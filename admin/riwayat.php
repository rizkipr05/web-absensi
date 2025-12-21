<?php 
require_once '../config/database.php';
include 'layout/header.php'; 
include 'layout/sidebar.php'; 
?>

<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Riwayat Absensi</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard.php" class="text-decoration-none">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Riwayat</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Data Table Card -->
    <div class="card card-custom shadow-sm">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h5 class="card-title fw-bold text-primary m-0"><i class="bi bi-table me-2"></i>Data Kehadiran</h5>
            </div>
            
            <div class="alert alert-light border-start border-4 border-info shadow-sm" role="alert">
                <div class="d-flex align-items-center">
                    <i class="bi bi-info-circle-fill text-info fs-4 me-3"></i>
                    <div>
                        <strong>Informasi</strong>
                        <p class="mb-0 small text-muted">Halaman ini menampilkan seluruh riwayat absensi pegawai. Gunakan filter untuk mencari data spesifik.</p>
                    </div>
                </div>
            </div>

            <div class="table-responsive mt-4">
                <table class="table table-hover align-middle border-bottom">
                    <thead class="bg-light text-secondary small text-uppercase">
                        <tr>
                            <th class="border-0">Tanggal</th>
                            <th class="border-0">Pegawai</th>
                            <th class="border-0">Jam Masuk</th>
                            <th class="border-0">Jam Pulang</th>
                            <th class="border-0">Status</th>
                            <th class="border-0 text-end">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Pagination logic could be added here later
                        $query = "SELECT a.*, u.nama, u.role, u.jabatan 
                                  FROM absensi a 
                                  JOIN users u ON a.user_id = u.id 
                                  ORDER BY a.tanggal DESC, a.jam_masuk DESC";
                        $result = mysqli_query($conn, $query);

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                $date = date('d M Y', strtotime($row['tanggal']));
                                $jam_masuk = $row['jam_masuk'] ? date('H:i', strtotime($row['jam_masuk'])) : '-';
                                $jam_pulang = $row['jam_pulang'] ? date('H:i', strtotime($row['jam_pulang'])) : '-';
                                $jabatan = !empty($row['jabatan']) ? $row['jabatan'] : '';
                                
                                // Status logic
                                $status_badge = '<span class="badge bg-secondary rounded-pill px-3">Belum Lengkap</span>';
                                if ($row['status_masuk'] == 'VALID') {
                                    $status_badge = '<span class="badge bg-success rounded-pill px-3">Hadir</span>';
                                } elseif ($row['status_masuk'] == 'TIDAK_VALID') {
                                    $status_badge = '<span class="badge bg-warning text-dark rounded-pill px-3">Lokasi Invalid</span>';
                                }
                                ?>
                                <tr>
                                    <td><?= $date ?></td>
                                    <td>
                                        <div class="fw-bold"><?= htmlspecialchars($row['nama']) ?></div>
                                        <?php if($jabatan): ?><small class="text-info"><?= htmlspecialchars($jabatan) ?></small><?php endif; ?>
                                    </td>
                                    <td><?= $jam_masuk ?></td>
                                    <td><?= $jam_pulang ?></td>
                                    <td><?= $status_badge ?></td>
                                    <td class="text-end">
                                        <button class="btn btn-sm btn-light text-primary" data-bs-toggle="tooltip" title="Detail"><i class="bi bi-eye"></i></button>
                                    </td>
                                </tr>
                                <?php
                            }
                        } else {
                            ?>
                            <tr>
                                <td colspan="6" class="text-center py-5">
                                    <div class="text-muted">Belum ada data riwayat absensi.</div>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination (Static for now) -->
            <nav aria-label="Page navigation example" class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link border-0 rounded-circle mx-1" href="#" tabindex="-1" aria-disabled="true"><i class="bi bi-chevron-left"></i></a>
                    </li>
                    <li class="page-item active"><a class="page-link border-0 rounded-circle mx-1 shadow-sm" href="#">1</a></li>
                    <li class="page-item">
                        <a class="page-link border-0 rounded-circle mx-1" href="#"><i class="bi bi-chevron-right"></i></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
