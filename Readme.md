# Web Absensi

Web Absensi adalah sistem aplikasi berbasis web yang dirancang untuk memudahkan pengelolaan data kehadiran karyawan, pelacakan riwayat absensi, serta administrasi data kepegawaian secara efisien.

## Tech Stack

Project ini dibangun menggunakan teknologi-teknologi berikut:

![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)

## Fitur Aplikasi

Aplikasi ini memiliki dua role pengguna: **Admin** dan **User (Karyawan)**.

### 👑 Admin
- **Dashboard**: Melihat ringkasan data pegawai dan statistik kehadiran.
- **Manajemen Karyawan**: Tambah, Edit, dan Hapus data karyawan.
- **Setup Jabatan**: Mengelola data jabatan dalam perusahaan.
- **Riwayat Absensi**: Memantau seluruh riwayat absensi masuk dan pulang karyawan.
- **Cetak Laporan**: Generate laporan absensi dalam format PDF menggunakan mPDF.

### 👤 User (Karyawan)
- **Login Secure**: Akses akun dengan keamanan terjamin.
- **Dashboard Personal**: Melihat status kehadiran pribadi.
- **Absen Masuk & Pulang**: Melakukan absensi harian dengan mudah.
- **Riwayat Saya**: Melihat histori kehadiran pribadi.
- **Profil**: Mengelola dan melihat data profil diri.

## Instalasi & Setup

1. **Clone Repository**
   ```bash
   git clone https://github.com/username/web-absensi.git
   ```

2. **Konfigurasi Database**
   - Buat database baru di phpMyAdmin (misal: `db_absensi_selfie`).
   - Import file `db_absensi_selfie.sql` yang ada di root direktori project.
   - Sesuaikan konfigurasi koneksi database di file koneksi (jika ada file config terpisah, biasanya di `config/database.php` atau sejenisnya, atau langsung di file koneksi utama).

3. **Install Dependencies**
   Jika belum terinstall, jalankan composer untuk menginstall library yang dibutuhkan (seperti mPDF).
   ```bash
   composer install
   ```

4. **Jalankan Aplikasi**
   - Pastikan XAMPP (Apache & MySQL) sudah berjalan.
   - Akses melalui browser: `http://localhost/web-absensi/`

## Akun Demo
- **Admin**: `admin@gmail.com` / `admin123` (Sesuaikan dengan data di database)
- **User**: Gunakan akun yang sudah didaftarkan oleh admin.

---
*Dibuat untuk memenuhi tugas/proyek pengelolaan absensi.*
