<?php
session_start();
require_once "../config/database.php";

if (!isset($_SESSION['user'])) { header("Location: ../auth/login.php"); exit; }
if ($_SESSION['user']['role'] !== 'user') { header("Location: ../admin/dashboard.php"); exit; }

$user_id = (int)$_SESSION['user']['id'];
$tanggal = date("Y-m-d");
$jam = date("H:i:s");

$photo_base64 = $_POST['photo_base64'] ?? '';
$lat = $_POST['lat'] ?? '';
$lng = $_POST['lng'] ?? '';
$accuracy = $_POST['accuracy'] ?? '';
$jabatan = mysqli_real_escape_string($conn, $_POST['jabatan'] ?? '');

if ($photo_base64 === '' || $lat === '' || $lng === '') {
  die("Data selfie/lokasi tidak lengkap.");
}

if ($jabatan === '') {
    die("Jabatan belum dipilih.");
}

// Update Jabatan User
mysqli_query($conn, "UPDATE users SET jabatan='$jabatan' WHERE id=$user_id");

// Cek sudah absen masuk hari ini?
$cek = mysqli_query($conn, "SELECT id, jam_masuk FROM absensi WHERE user_id=$user_id AND tanggal='$tanggal' LIMIT 1");
if ($cek && mysqli_num_rows($cek) === 1) {
  $row = mysqli_fetch_assoc($cek);
  if (!empty($row['jam_masuk'])) {
    die("Kamu sudah absen masuk hari ini.");
  }
}

// Ambil lokasi kantor (ambil id=1)
$qk = mysqli_query($conn, "SELECT latitude, longitude, radius_meter FROM kantor ORDER BY id ASC LIMIT 1");
if (!$qk || mysqli_num_rows($qk) === 0) {
  die("Data lokasi kantor belum di-set.");
}
$kantor = mysqli_fetch_assoc($qk);
$kantorLat = (float)$kantor['latitude'];
$kantorLng = (float)$kantor['longitude'];
$radius = (int)$kantor['radius_meter'];

$userLat = (float)$lat;
$userLng = (float)$lng;

// Haversine (meter)
function haversine_m($lat1, $lon1, $lat2, $lon2) {
  $R = 6371000; // meter
  $dLat = deg2rad($lat2 - $lat1);
  $dLon = deg2rad($lon2 - $lon1);
  $a = sin($dLat/2) * sin($dLat/2) +
       cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
       sin($dLon/2) * sin($dLon/2);
  $c = 2 * atan2(sqrt($a), sqrt(1-$a));
  return $R * $c;
}

$jarak = (int)round(haversine_m($userLat, $userLng, $kantorLat, $kantorLng));
$status = ($jarak <= $radius) ? "VALID" : "TIDAK_VALID";

// Simpan foto (base64 -> file)
if (!preg_match('#^data:image/(png|jpeg|jpg);base64,#', $photo_base64)) {
  die("Format foto tidak valid.");
}
$photo_base64 = preg_replace('#^data:image/\w+;base64,#i', '', $photo_base64);
$binary = base64_decode($photo_base64);

if ($binary === false) die("Gagal decode foto.");

$folder = __DIR__ . "/../assets/upload/absensi";
if (!is_dir($folder)) mkdir($folder, 0777, true);

$filename = "masuk_".$user_id."_".$tanggal."_".time().".jpg";
$filePath = $folder . "/" . $filename;
file_put_contents($filePath, $binary);

$fotoRel = "assets/upload/absensi/" . $filename;

// Insert / Update absensi
// Kalau record tanggal belum ada: insert. Kalau ada tapi jam_masuk null: update.
$cek2 = mysqli_query($conn, "SELECT id FROM absensi WHERE user_id=$user_id AND tanggal='$tanggal' LIMIT 1");
if ($cek2 && mysqli_num_rows($cek2) === 1) {
  $r = mysqli_fetch_assoc($cek2);
  $absensi_id = (int)$r['id'];

  $sql = "UPDATE absensi SET 
            jam_masuk='$jam',
            foto_masuk='".mysqli_real_escape_string($conn,$fotoRel)."',
            lat_masuk=$userLat,
            long_masuk=$userLng,
            jarak_masuk_meter=$jarak,
            status_masuk='$status'
          WHERE id=$absensi_id";
  mysqli_query($conn, $sql);

} else {
  $sql = "INSERT INTO absensi
          (user_id, tanggal, jam_masuk, foto_masuk, lat_masuk, long_masuk, jarak_masuk_meter, status_masuk)
          VALUES
          ($user_id, '$tanggal', '$jam', '".mysqli_real_escape_string($conn,$fotoRel)."', $userLat, $userLng, $jarak, '$status')";
  mysqli_query($conn, $sql);
  $absensi_id = mysqli_insert_id($conn);
}

// log (optional)
$ip = mysqli_real_escape_string($conn, $_SERVER['REMOTE_ADDR'] ?? '');
$ua = mysqli_real_escape_string($conn, substr($_SERVER['HTTP_USER_AGENT'] ?? '', 0, 250));
mysqli_query($conn, "INSERT INTO absensi_log(absensi_id,user_id,aksi,ip_address,user_agent) VALUES ($absensi_id,$user_id,'MASUK','$ip','$ua')");

// Feedback
if ($status === "VALID") {
  header("Location: riwayat.php?msg=" . urlencode("Absen masuk berhasil. Jarak: {$jarak}m (VALID)"));
} else {
  header("Location: riwayat.php?msg=" . urlencode("Absen masuk tersimpan, tapi lokasi TIDAK VALID. Jarak: {$jarak}m > radius {$radius}m"));
}
exit;
