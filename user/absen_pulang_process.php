<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require_once "../config/database.php";

if (!isset($_SESSION['user'])) { header("Location: ../auth/login.php"); exit; }
if (!isset($_SESSION['user']['role']) || $_SESSION['user']['role'] !== 'user') { header("Location: ../admin/dashboard.php"); exit; }

if (!isset($conn) || !$conn) die("Koneksi database tidak tersedia.");

$user_id = (int)$_SESSION['user']['id'];
$tanggal = date("Y-m-d");
$jam     = date("H:i:s");

$photo_base64 = $_POST['photo_base64'] ?? '';
$lat = $_POST['lat'] ?? '';
$lng = $_POST['lng'] ?? '';
$accuracy = $_POST['accuracy'] ?? '';

if ($photo_base64 === '' || $lat === '' || $lng === '') {
  die("Data selfie/lokasi tidak lengkap.");
}

// 1) Wajib sudah absen masuk hari ini
$cek = mysqli_query($conn, "SELECT id, jam_masuk, jam_pulang FROM absensi WHERE user_id=$user_id AND tanggal='$tanggal' LIMIT 1");
if (!$cek) die("Query cek absensi gagal: " . mysqli_error($conn));

if (mysqli_num_rows($cek) === 0) {
  die("Kamu belum absen masuk hari ini. Absen pulang ditolak.");
}

$row = mysqli_fetch_assoc($cek);
$absensi_id = (int)$row['id'];

if (empty($row['jam_masuk'])) {
  die("Data absen masuk belum lengkap. Absen pulang ditolak.");
}

if (!empty($row['jam_pulang'])) {
  die("Kamu sudah absen pulang hari ini.");
}

// 2) Ambil lokasi kantor
$qk = mysqli_query($conn, "SELECT latitude, longitude, radius_meter FROM kantor ORDER BY id ASC LIMIT 1");
if (!$qk || mysqli_num_rows($qk) === 0) {
  die("Data lokasi kantor belum di-set.");
}
$kantor = mysqli_fetch_assoc($qk);
$kantorLat = (float)$kantor['latitude'];
$kantorLng = (float)$kantor['longitude'];
$radius    = (int)$kantor['radius_meter'];

$userLat = (float)$lat;
$userLng = (float)$lng;

// 3) Haversine (meter)
function haversine_m($lat1, $lon1, $lat2, $lon2) {
  $R = 6371000;
  $dLat = deg2rad($lat2 - $lat1);
  $dLon = deg2rad($lon2 - $lon1);
  $a = sin($dLat/2) * sin($dLat/2) +
       cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
       sin($dLon/2) * sin($dLon/2);
  $c = 2 * atan2(sqrt($a), sqrt(1-$a));
  return $R * $c;
}

$jarak  = (int)round(haversine_m($userLat, $userLng, $kantorLat, $kantorLng));
$status = ($jarak <= $radius) ? "VALID" : "TIDAK_VALID";

// 4) Simpan foto pulang
if (!preg_match('#^data:image/(png|jpeg|jpg);base64,#i', $photo_base64)) {
  die("Format foto tidak valid.");
}
$photo_base64 = preg_replace('#^data:image/\w+;base64,#i', '', $photo_base64);
$binary = base64_decode($photo_base64);
if ($binary === false) die("Gagal decode foto.");

$uploadDir = __DIR__ . "/../assets/upload/absensi";
if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

$filename = "pulang_" . $user_id . "_" . date("Ymd") . "_" . time() . ".jpg";
$fullPath = $uploadDir . "/" . $filename;

if (file_put_contents($fullPath, $binary) === false) {
  die("Gagal menyimpan file foto pulang. Cek permission folder upload.");
}

$fotoRel = "assets/upload/absensi/" . $filename;

// 5) Update absensi (pulang)
$sql = "UPDATE absensi SET 
          jam_pulang='$jam',
          foto_pulang='".mysqli_real_escape_string($conn, $fotoRel)."',
          lat_pulang=$userLat,
          long_pulang=$userLng,
          jarak_pulang_meter=$jarak,
          status_pulang='$status'
        WHERE id=$absensi_id";

if (!mysqli_query($conn, $sql)) {
  die("Update absen pulang gagal: " . mysqli_error($conn));
}

// 6) Log (optional)
$ip = mysqli_real_escape_string($conn, $_SERVER['REMOTE_ADDR'] ?? '');
$ua = mysqli_real_escape_string($conn, substr($_SERVER['HTTP_USER_AGENT'] ?? '', 0, 250));
mysqli_query($conn, "INSERT INTO absensi_log(absensi_id,user_id,aksi,ip_address,user_agent) VALUES ($absensi_id,$user_id,'PULANG','$ip','$ua')");

// 7) Redirect
if ($status === "VALID") {
  header("Location: riwayat.php?msg=" . urlencode("Absen pulang berhasil. Jarak: {$jarak}m (VALID)"));
} else {
  header("Location: riwayat.php?msg=" . urlencode("Absen pulang tersimpan, tapi lokasi TIDAK VALID. Jarak: {$jarak}m > radius {$radius}m"));
}
exit;
