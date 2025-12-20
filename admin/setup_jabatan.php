<?php
require_once '../config/database.php';

// Check if column exists
$check = mysqli_query($conn, "SHOW COLUMNS FROM users LIKE 'jabatan'");
if (mysqli_num_rows($check) == 0) {
    $sql = "ALTER TABLE users ADD COLUMN jabatan VARCHAR(50) NULL AFTER role";
    if (mysqli_query($conn, $sql)) {
        echo "Berhasil menambahkan kolom jabatan ke tabel users.";
    } else {
        echo "Gagal menambahkan kolom: " . mysqli_error($conn);
    }
} else {
    echo "Kolom jabatan sudah ada.";
}
