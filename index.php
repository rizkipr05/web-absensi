<?php
session_start();
if (isset($_SESSION['user'])) {
  if ($_SESSION['user']['role'] === 'admin') {
    header("Location: admin/dashboard.php"); exit;
  }
  header("Location: user/home.php"); exit;
}
?>
<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Absensi Selfie</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
  <h2>Home</h2>
  <p>Website Absensi Selfie + Validasi Lokasi</p>
  <a class="btn btn-primary" href="auth/login.php">Login</a>
</body>
</html>
