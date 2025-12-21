<?php 
include 'layout/header.php'; 
include 'layout/sidebar.php'; 
require_once '../config/database.php';
?>

<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Data Pegawai</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard.php" class="text-decoration-none">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Pegawai</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card card-custom shadow-sm">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h5 class="card-title fw-bold text-primary m-0"><i class="bi bi-people me-2"></i>Daftar Pegawai</h5>
                <a href="karyawan_tambah.php" class="btn btn-primary text-white">
                    <i class="bi bi-plus-lg me-2"></i>Tambah Pegawai
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle border-bottom">
                    <thead class="bg-light text-secondary small text-uppercase">
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Email</th>
                            <th>Jabatan</th>
                            <th>Status</th>
                            <th class="text-end">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $query = "SELECT * FROM users WHERE role='user' ORDER BY nama ASC";
                        $result = mysqli_query($conn, $query);
                        $no = 1;
                        while ($row = mysqli_fetch_assoc($result)) {
                            $jabatan = !empty($row['jabatan']) ? $row['jabatan'] : '-';
                            $status = $row['is_active'] ? '<span class="badge bg-success rounded-pill">Aktif</span>' : '<span class="badge bg-danger rounded-pill">Nonaktif</span>';
                            ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td>
                                    <div class="fw-bold"><?= htmlspecialchars($row['nama']) ?></div>
                                </td>
                                <td><?= htmlspecialchars($row['email']) ?></td>
                                <td><span class="badge bg-info text-dark rounded-pill px-3"><?= htmlspecialchars($jabatan) ?></span></td>
                                <td><?= $status ?></td>
                                <td class="text-end">
                                    <a href="karyawan_edit.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-outline-primary rounded-circle me-1" data-bs-toggle="tooltip" title="Edit">
                                        <i class="bi bi-pencil-fill"></i>
                                    </a>
                                    <a href="karyawan_hapus.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-outline-danger rounded-circle" data-bs-toggle="tooltip" title="Hapus" onclick="return confirm('Yakin ingin menghapus pegawai ini? Data yang dihapus tidak dapat dikembalikan.')">
                                        <i class="bi bi-trash-fill"></i>
                                    </a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
