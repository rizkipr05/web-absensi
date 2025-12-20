<?php
// =====================
// DEBUG (hapus kalau sudah stabil)
// =====================
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Session handling is done in header.php, but we need database connection here
require_once "../config/database.php";

// Pre-fetch user ID for query before including header (strictly speaking header does session_start so $_SESSION is available)
// We'll include header first to handle auth redirection automatically.
?>
<?php include 'layout/header.php'; ?>
<?php 
// Ensure DB connection existence after header inclusion (just to be safe/organized)
if (!isset($conn) || !$conn) {
    echo '<div class="alert alert-danger m-3">Koneksi database tidak tersedia. Cek config/database.php</div>';
    include 'layout/footer.php';
    exit;
}

$user_id = (int)($_SESSION['user']['id'] ?? 0);
$msg = $_GET['msg'] ?? '';

// Check user_idvalidity
if ($user_id <= 0) {
    echo '<div class="alert alert-danger m-3">Session user_id tidak valid. Silakan login ulang.</div>';
    include 'layout/footer.php';
    exit;
}

// query riwayat
$sql = "SELECT 
          id, tanggal,
          jam_masuk, status_masuk, jarak_masuk_meter, foto_masuk,
          jam_pulang, status_pulang, jarak_pulang_meter, foto_pulang
        FROM absensi
        WHERE user_id = $user_id
        ORDER BY tanggal DESC
        LIMIT 100";

$q = mysqli_query($conn, $sql);
?>
<?php include 'layout/sidebar.php'; ?>

<!-- Content -->
<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Riwayat Absensi</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home.php" class="text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Riwayat</li>
                </ol>
            </nav>
        </div>
    </div>

    <?php if ($msg): ?>
      <div class="alert alert-info alert-dismissible fade show shadow-sm" role="alert">
        <i class="bi bi-info-circle-fill me-2"></i><?= htmlspecialchars($msg) ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    <?php endif; ?>

    <!-- History Card -->
    <div class="card card-custom shadow-sm">
        <div class="card-header bg-white py-3 border-bottom d-flex justify-content-between align-items-center">
            <h5 class="m-0 fw-bold text-primary"><i class="bi bi-clock-history me-2"></i>Catatan Kehadiran</h5>
            <span class="badge bg-light text-secondary border">100 Data Terakhir</span>
        </div>
        <div class="card-body p-0">
            <?php if (!$q): ?>
                <div class="alert alert-danger m-3">
                    Query riwayat gagal: <?= mysqli_error($conn) ?>
                </div>
            <?php elseif (mysqli_num_rows($q) === 0): ?>
                <div class="text-center py-5">
                    <div class="mb-3">
                        <i class="bi bi-calendar-x text-muted" style="font-size: 4rem; opacity: 0.3;"></i>
                    </div>
                    <p class="text-muted fw-bold">Belum ada data absensi.</p>
                    <a href="absen_masuk.php" class="btn btn-primary rounded-pill px-4">Lakukan Absen Masuk</a>
                </div>
            <?php else: ?>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="bg-light text-secondary small text-uppercase">
                            <tr>
                                <th class="ps-4">Tanggal</th>
                                <th>Masuk</th>
                                <th>Pulang</th>
                                <th class="text-center">Bukti</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while($row = mysqli_fetch_assoc($q)): ?>
                                <!-- Logic Status Badge -->
                                <?php 
                                    $statusMasukColor = 'success';
                                    if(stripos($row['status_masuk'], 'telat') !== false) $statusMasukColor = 'warning';
                                    
                                    $statusPulangColor = 'success';
                                    if($row['status_pulang'] == '') $statusPulangColor = 'secondary';
                                ?>
                                <tr>
                                    <td class="ps-4">
                                        <div class="fw-bold text-dark"><?= date('d M Y', strtotime($row['tanggal'])) ?></div>
                                        <small class="text-muted"><?= date('l', strtotime($row['tanggal'])) ?></small>
                                    </td>
                                    
                                    <!-- Jam Masuk -->
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="fw-bold text-dark"><?= $row['jam_masuk'] ?: '-' ?></span>
                                            <span class="badge bg-<?= $statusMasukColor ?> bg-opacity-10 text-<?= $statusMasukColor ?> rounded-pill px-2 mt-1" style="width: fit-content;">
                                                <?= htmlspecialchars($row['status_masuk'] ?: 'Belum Absen') ?>
                                            </span>
                                        </div>
                                    </td>

                                    <!-- Jam Pulang -->
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="fw-bold text-dark"><?= $row['jam_pulang'] ?: '-' ?></span>
                                            <?php if($row['jam_pulang']): ?>
                                                <span class="badge bg-primary bg-opacity-10 text-primary rounded-pill px-2 mt-1" style="width: fit-content;">
                                                    <?= htmlspecialchars($row['status_pulang']) ?>
                                                </span>
                                            <?php else: ?>
                                                <span class="text-muted small">-</span>
                                            <?php endif; ?>
                                        </div>
                                    </td>

                                    <!-- Bukti Foto -->
                                    <td class="text-center">
                                        <div class="d-flex justify-content-center gap-2">
                                            <?php if (!empty($row['foto_masuk'])): ?>
                                                <div class="position-relative" data-bs-toggle="tooltip" title="Foto Masuk">
                                                    <img src="../<?= htmlspecialchars($row['foto_masuk']) ?>" class="rounded border shadow-sm" style="width: 45px; height: 45px; object-fit: cover; cursor: pointer;" onclick="window.open(this.src)">
                                                    <span class="position-absolute top-0 start-100 translate-middle p-1 bg-success border border-light rounded-circle"></span>
                                                </div>
                                            <?php endif; ?>
                                            
                                            <?php if (!empty($row['foto_pulang'])): ?>
                                                <div class="position-relative" data-bs-toggle="tooltip" title="Foto Pulang">
                                                    <img src="../<?= htmlspecialchars($row['foto_pulang']) ?>" class="rounded border shadow-sm" style="width: 45px; height: 45px; object-fit: cover; cursor: pointer;" onclick="window.open(this.src)">
                                                    <span class="position-absolute top-0 start-100 translate-middle p-1 bg-info border border-light rounded-circle"></span>
                                                </div>
                                            <?php endif; ?>
                                            
                                            <?php if(empty($row['foto_masuk']) && empty($row['foto_pulang'])): ?>
                                                <span class="text-muted small">-</span>
                                            <?php endif; ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<style>
    /* Custom scrollbar for table if data is long */
    .table-responsive::-webkit-scrollbar {
        height: 6px;
    }
    .table-responsive::-webkit-scrollbar-thumb {
        background: #ccc;
        border-radius: 3px;
    }
</style>

<?php include 'layout/footer.php'; ?>
