<?php 
include 'layout/header.php'; 
include 'layout/sidebar.php'; 
require_once '../config/database.php';

$id = $_GET['id'] ?? 0;
$query = "SELECT * FROM users WHERE id=$id AND role='user'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) === 0) {
    echo "<script>alert('Data tidak ditemukan'); window.location='karyawan.php';</script>";
    exit;
}

$user = mysqli_fetch_assoc($result);

// Handle Form Submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $jabatan = mysqli_real_escape_string($conn, $_POST['jabatan']);
    $is_active = isset($_POST['is_active']) ? 1 : 0;
    
    // Logic for password update if needed, but omitted for simplicity as focus is on Jabatan
    
    $update = "UPDATE users SET nama='$nama', jabatan='$jabatan', is_active=$is_active WHERE id=$id";
    if (mysqli_query($conn, $update)) {
        echo "<script>alert('Data berhasil diperbarui'); window.location='karyawan.php';</script>";
        exit;
    } else {
        $error = mysqli_error($conn);
    }
}

// Jabatan Options based on user image
$jabatanOptions = [
    'BC' => 'Business Consultants (BC)',
    'SBC' => 'Senior Business Consultants (SBC)',
    'BSM' => 'Business Senior Manager (BSM)',
    'SBM' => 'Senior Business Manager (SBM)',
    'EM' => 'Executive Manager (EM)',
    'SEM' => 'Senior Executive Manager (SEM)',
    'VBM' => 'Vice Branch Manager (VBM)',
    'BM' => 'Branch Manager (BM)'
];

?>

<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Edit Pegawai</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard.php" class="text-decoration-none">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="karyawan.php" class="text-decoration-none">Pegawai</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card card-custom shadow-sm" style="max-width: 800px;">
        <div class="card-body p-4">
            <?php if (isset($error)): ?>
                <div class="alert alert-danger"><?= $error ?></div>
            <?php endif; ?>

            <form method="POST">
                <div class="mb-3">
                    <label class="form-label fw-bold">Nama Lengkap</label>
                    <input type="text" name="nama" class="form-control" value="<?= htmlspecialchars($user['nama']) ?>" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Email</label>
                    <input type="email" class="form-control" value="<?= htmlspecialchars($user['email']) ?>" disabled readonly>
                    <small class="text-muted">Email tidak dapat diubah.</small>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Jabatan</label>
                    <select name="jabatan" class="form-select">
                        <option value="">-- Pilih Jabatan --</option>
                        <?php foreach ($jabatanOptions as $code => $label): ?>
                            <option value="<?= $label ?>" <?= $user['jabatan'] === $label ? 'selected' : '' ?>>
                                <?= $label ?>
                            </option>
                        <?php endforeach; ?>
                        <!-- Fallback for custom values -->
                         <option value="Staff" <?= $user['jabatan'] === 'Staff' ? 'selected' : '' ?>>Staff (General)</option>
                    </select>
                </div>

                <div class="mb-3 form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="isActive" name="is_active" <?= $user['is_active'] ? 'checked' : '' ?>>
                    <label class="form-check-label" for="isActive">Akun Aktif</label>
                </div>

                <hr>
                <div class="d-flex justify-content-end gap-2">
                    <a href="karyawan.php" class="btn btn-light">Batal</a>
                    <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
