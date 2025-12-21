<?php
ob_start();
session_start();
require_once '../config/database.php';

// Check admin session (basic security)
if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'admin') {
    header("Location: ../auth/login.php");
    exit;
}

$id = $_GET['id'] ?? null;

if ($id) {
    // Prevent deleting self (optional but good practice)
    if ($id == $_SESSION['user']['id']) {
        echo "<script>alert('Tidak dapat menghapus akun sendiri!'); window.location='karyawan.php';</script>";
        exit;
    }

    $id = mysqli_real_escape_string($conn, $id);
    
    // Check if user exists
    $check = mysqli_query($conn, "SELECT id FROM users WHERE id=$id AND role='user'");
    if (mysqli_num_rows($check) > 0) {
        $delete = "DELETE FROM users WHERE id=$id";
        if (mysqli_query($conn, $delete)) {
             $_SESSION['success'] = "Pegawai berhasil dihapus";
             header("Location: karyawan.php");
             exit;
        } else {
             $_SESSION['error'] = "Gagal menghapus: " . mysqli_error($conn);
             header("Location: karyawan.php");
             exit;
        }
    } else {
        $_SESSION['error'] = "Data tidak ditemukan atau bukan pegawai user";
        header("Location: karyawan.php");
        exit;
    }
} else {
    header("Location: karyawan.php");
}
?>
