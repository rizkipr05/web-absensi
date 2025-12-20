<?php 
require_once '../config/database.php';
include 'layout/header.php'; 
include 'layout/sidebar.php'; 

// 1. Total Pegawai
$q1 = mysqli_query($conn, "SELECT COUNT(*) as total FROM users WHERE role='user' AND is_active=1");
$row1 = mysqli_fetch_assoc($q1);
$total_pegawai = $row1['total'] ?? 0;

// 2. Hadir Hari Ini
$today = date("Y-m-d");
$q2 = mysqli_query($conn, "SELECT COUNT(DISTINCT user_id) as hadir FROM absensi WHERE tanggal='$today' AND jam_masuk IS NOT NULL");
$row2 = mysqli_fetch_assoc($q2);
$hadir_hari_ini = $row2['hadir'] ?? 0;

// 3. Izin/Sakit (Placeholder logic for now as no explicit table exists yet)
// We can display 0 or hide it. Let's display 0 for now.
$izin_sakit = 0; 
?>

<!-- Dashboard Content -->
<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Dashboard Overview</h2>
            <p class="text-secondary">Ringkasan aktivitas hari ini (<?= date('d M Y') ?>)</p>
        </div>
    </div>

    <!-- Stats Cards Row -->
    <div class="row g-4 mb-5">
        <!-- Total Pegawai Card -->
        <div class="col-xl-4 col-md-6">
            <div class="card card-custom card-border-left-primary h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs fw-bold text-primary text-uppercase mb-1">Total Pegawai</div>
                            <div class="h5 mb-0 fw-bold text-gray-800"><?= $total_pegawai ?></div>
                        </div>
                        <div class="col-auto">
                            <i class="bi bi-people-fill fs-2 text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hadir Card -->
        <div class="col-xl-4 col-md-6">
            <div class="card card-custom card-border-left-success h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs fw-bold text-success text-uppercase mb-1">Hadir Hari Ini</div>
                            <div class="h5 mb-0 fw-bold text-gray-800"><?= $hadir_hari_ini ?></div>
                        </div>
                        <div class="col-auto">
                            <i class="bi bi-calendar-check-fill fs-2 text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Izin/Sakit Card -->
        <div class="col-xl-4 col-md-6">
            <div class="card card-custom card-border-left-warning h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs fw-bold text-warning text-uppercase mb-1">Izin / Sakit</div>
                            <div class="h5 mb-0 fw-bold text-gray-800"><?= $izin_sakit ?></div>
                        </div>
                        <div class="col-auto">
                            <i class="bi bi-clipboard-x-fill fs-2 text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="row">
        <div class="col-12">
            <div class="card card-custom shadow-sm">
                <div class="card-header bg-white py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 fw-bold text-primary">Aktivitas Terbaru</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-three-dots-vertical text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="riwayat.php">Lihat Semua</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Nama Pegawai</th>
                                    <th>Waktu Absen</th>
                                    <th>Status</th>
                                    <th>Keterangan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $q3 = mysqli_query($conn, "SELECT a.*, u.nama, u.role FROM absensi a JOIN users u ON a.user_id = u.id ORDER BY a.tanggal DESC, a.jam_masuk DESC LIMIT 5");
                                if (mysqli_num_rows($q3) > 0) {
                                    while ($r = mysqli_fetch_assoc($q3)) {
                                        // Determine status badge
                                        $statusBadge = '<span class="badge bg-secondary">Unknown</span>';
                                        $ket = '-';
                                        
                                        // Simple logic to determine what to show (Masuk or Pulang)
                                        // Priorities: if updated recently? For now, just show jam_masuk info or status_masuk
                                        if ($r['status_masuk'] == 'VALID') {
                                            $statusBadge = '<span class="badge bg-success rounded-pill px-3">Masuk</span>';
                                            $ket = "Tepat Waktu"; // Simplification
                                        } elseif ($r['status_masuk'] == 'TIDAK_VALID') {
                                            $statusBadge = '<span class="badge bg-warning text-dark rounded-pill px-3">Lokasi Invalid</span>';
                                            $ket = "Jarak: " . ($r['jarak_masuk_meter'] ?? 0) . " m";
                                        }
                                        
                                        $time = $r['jam_masuk'] ? date('H:i', strtotime($r['jam_masuk'])) : '-';
                                        
                                        echo "<tr>
                                            <td>
                                                <div class='d-flex align-items-center'>
                                                    <div class='bg-light rounded-circle p-2 me-2'>
                                                        <i class='bi bi-person'></i>
                                                    </div>
                                                    <div>
                                                        <span class='fw-bold d-block'>".htmlspecialchars($r['nama'])."</span>
                                                        <small class='text-muted'>".htmlspecialchars($r['role'])."</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>$time</td>
                                            <td>$statusBadge</td>
                                            <td>$ket</td>
                                        </tr>";
                                    }
                                } else {
                                    echo "<tr><td colspan='4' class='text-center text-muted py-3'>Belum ada aktivitas.</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
