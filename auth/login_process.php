<?php
session_start();
require_once "../config/database.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: login.php?error=Akses tidak valid");
    exit;
}

$email    = mysqli_real_escape_string($conn, $_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($email === '' || $password === '') {
    header("Location: login.php?error=Email dan password wajib diisi");
    exit;
}

$query = mysqli_query($conn, "SELECT * FROM users WHERE email='$email' LIMIT 1");

if (mysqli_num_rows($query) === 1) {

    $user = mysqli_fetch_assoc($query);

    if ($user['is_active'] != 1) {
        header("Location: login.php?error=Akun nonaktif");
        exit;
    }

    if (password_verify($password, $user['password'])) {

        session_regenerate_id(true);

        $_SESSION['user'] = [
            'id'    => $user['id'],
            'nama'  => $user['nama'],
            'email' => $user['email'],
            'role'  => $user['role']
        ];

        if ($user['role'] === 'admin') {
            header("Location: ../admin/dashboard.php");
        } else {
            header("Location: ../user/home.php");
        }
        exit;

    } else {
        header("Location: login.php?error=Password salah");
        exit;
    }

} else {
    header("Location: login.php?error=Email tidak ditemukan");
    exit;
}
