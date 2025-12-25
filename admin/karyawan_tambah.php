<?php 
ob_start();
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once '../config/database.php';

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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = $_POST['password'];
    $jabatan = mysqli_real_escape_string($conn, $_POST['jabatan']);
    
    // Check if email already exists
    $checkQuery = "SELECT id FROM users WHERE email = '$email'";
    $checkResult = mysqli_query($conn, $checkQuery);
    
    if (mysqli_num_rows($checkResult) > 0) {
        $error = "Email sudah terdaftar. Gunakan email lain."; // Keep local error for form redisplay
    } else {
        $passwordHash = password_hash($password, PASSWORD_DEFAULT);
        $role = 'user';
        $isActive = 1;
        
        $query = "INSERT INTO users (nama, email, password, role, jabatan, is_active) 
                  VALUES ('$nama', '$email', '$passwordHash', '$role', '$jabatan', $isActive)";
                  
        if (mysqli_query($conn, $query)) {
            $_SESSION['success'] = "Pegawai berhasil ditambahkan";
            header("Location: karyawan.php");
            exit;
        } else {
            $error = "Terjadi kesalahan: " . mysqli_error($conn);
        }
    }
}

include 'layout/header.php'; 
include 'layout/sidebar.php'; 
?>

<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Tambah Pegawai</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard.php" class="text-decoration-none">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="karyawan.php" class="text-decoration-none">Pegawai</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tambah</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card card-custom shadow-sm" style="max-width: 800px;">
        <div class="card-body p-4">
            <?php if (isset($error)): ?>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    <div><?= $error ?></div>
                </div>
            <?php endif; ?>

            <form method="POST" autocomplete="off">
                <div class="mb-3">
                    <label class="form-label fw-bold">Nama Lengkap</label>
                    <input type="text" name="nama" class="form-control" required placeholder="Contoh: Budi Santoso">
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Email</label>
                    <input type="email" name="email" class="form-control" required placeholder="email@contoh.com">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Password</label>
                    <input type="password" name="password" class="form-control" required minlength="6" placeholder="Minimal 6 karakter">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Jabatan</label>
                    <select name="jabatan" class="form-select" required>
                        <option value="">-- Pilih Jabatan --</option>
                        <?php foreach ($jabatanOptions as $code => $label): ?>
                            <option value="<?= $label ?>"><?= $label ?></option>
                        <?php endforeach; ?>
                        <option value="Staff">Staff (General)</option>
                    </select>
                </div>

                <hr>
                <div class="d-flex justify-content-end gap-2">
                    <a href="karyawan.php" class="btn btn-light">Batal</a>
                    <button type="submit" class="btn btn-primary">Simpan Data</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
