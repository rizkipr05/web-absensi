<?php
require_once '../config/database.php';
require_once '../vendor/autoload.php';

use Mpdf\Mpdf;

// 1. Ambil Data Filter
$bulan = $_POST['bulan'] ?? date('m');
$tahun = $_POST['tahun'] ?? date('Y');
$tipe  = $_POST['tipeLaporan'] ?? 'semua';

// Nama bulan array (Indonesian)
$bulanIndo = [
    '01' => 'Januari',
    '02' => 'Februari',
    '03' => 'Maret',
    '04' => 'April',
    '05' => 'Mei',
    '06' => 'Juni',
    '07' => 'Juli',
    '08' => 'Agustus',
    '09' => 'September',
    '10' => 'Oktober',
    '11' => 'November',
    '12' => 'Desember'
];

$namaBulan = $bulanIndo[$bulan] ?? $bulan;

// 2. Query Data - Join absensi dan users
$query = "SELECT a.*, u.nama, u.role, u.jabatan 
          FROM absensi a 
          JOIN users u ON a.user_id = u.id 
          WHERE DATE_FORMAT(a.tanggal, '%Y-%m') = '$tahun-$bulan' ";

if ($tipe === 'individu' && !empty($_POST['user_id'])) {
    $uid = (int)$_POST['user_id'];
    $query .= " AND a.user_id = $uid ";
}

$query .= " ORDER BY a.tanggal ASC, u.nama ASC";

$result = mysqli_query($conn, $query);
$data = [];
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

// 3. Setup HTML Layout untuk PDF
$html = '<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan Absensi</title>
    <style>
        body { font-family: sans-serif; font-size: 11pt; color: #333; }
        .header { text-align: center; margin-bottom: 20px; border-bottom: 2px solid #333; padding-bottom: 10px; }
        .header h2 { margin: 0; text-transform: uppercase; }
        .header p { margin: 5px 0 0; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #999; padding: 8px; text-align: left; font-size: 10pt; }
        th { background-color: #eee; font-weight: bold; text-align: center; }
        .text-center { text-align: center; }
        .footer { margin-top: 30px; text-align: right; font-size: 10pt; }
    </style>
</head>
<body>

    <div class="header">
        <h2>Laporan Absensi Pegawai</h2>
        <p>Periode: ' . $namaBulan . ' ' . $tahun . '</p>
    </div>

    <p>Dicetak pada: ' . date('d F Y H:i') . '</p>

    <table>
        <thead>
            <tr>
                <th width="5%">No</th>
                <th width="15%">Tanggal</th>
                <th width="30%">Nama Pegawai</th>
                <th width="15%">Jam Masuk</th>
                <th width="15%">Jam Pulang</th>
                <th width="20%">Status</th>
            </tr>
        </thead>
        <tbody>';

if (count($data) > 0) {
    $no = 1;
    foreach ($data as $d) {
        $tglIndo = date('d-m-Y', strtotime($d['tanggal']));
        $jamMasuk = $d['jam_masuk'] ? date('H:i', strtotime($d['jam_masuk'])) : '-';
        $jamPulang = $d['jam_pulang'] ? date('H:i', strtotime($d['jam_pulang'])) : '-';
        $jabatan = !empty($d['jabatan']) ? '<br><small style="color:blue">' . htmlspecialchars($d['jabatan']) . '</small>' : '';
        
        $status = 'Hadir';
        // Simple logic for status text
        if ($d['status_masuk'] == 'TIDAK_VALID') $status .= ' (Lokasi Invalid)';
        
        $html .= '<tr>
            <td class="text-center">' . $no++ . '</td>
            <td class="text-center">' . $tglIndo . '</td>
            <td>' . htmlspecialchars($d['nama']) . '<br><small style="color:#666">' . htmlspecialchars($d['role']) . '</small>' . $jabatan . '</td>
            <td class="text-center">' . $jamMasuk . '</td>
            <td class="text-center">' . $jamPulang . '</td>
            <td>' . $status . '</td>
        </tr>';
    }
} else {
    $html .= '<tr><td colspan="6" class="text-center">Tidak ada data absensi untuk periode ini.</td></tr>';
}

$html .= '</tbody>
    </table>

    <div class="footer">
        <p>Mengetahui,</p>
        <br><br><br>
        <p>___________________<br>Admin HRD</p>
    </div>

</body>
</html>';

// 4. Generate PDF
try {
    $mpdf = new \Mpdf\Mpdf([
        'mode' => 'utf-8', 
        'format' => 'A4', 
        'orientation' => 'P'
    ]);
    
    // Add header/footer if needed using mPDF built-in methods
    $mpdf->SetFooter('{PAGENO}');
    
    $mpdf->WriteHTML($html);
    
    // Output directly to browser
    $filename = 'Laporan_Absensi_' . $bulan . '-' . $tahun . '.pdf';
    $mpdf->Output($filename, 'I'); // I = Inline (preview), D = Download

} catch (\Mpdf\MpdfException $e) {
    echo "Terjadi kesalahan saat membuat PDF: " . $e->getMessage();
}
