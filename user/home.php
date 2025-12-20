<?php include 'layout/header.php'; ?>
<?php include 'layout/sidebar.php'; ?>

<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Home User</h2>
            <p class="text-secondary">Selamat datang kembali di panel pegawai.</p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 mb-4">
            <div class="card card-custom border-0 shadow-sm bg-primary text-white h-100" style="background: linear-gradient(45deg, var(--primary-color), #6610f2);">
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="fw-bold mb-2">Halo, <?= htmlspecialchars($_SESSION['user']['nama']) ?>!</h4>
                            <p class="mb-4 opacity-75">Jangan lupa untuk melakukan absensi hari ini.</p>
                            <div class="d-flex gap-2">
                                <a href="absen_masuk.php" class="btn btn-light text-primary fw-bold shadow-sm rounded-pill px-4">
                                    <i class="bi bi-box-arrow-in-right me-2"></i>Absen Masuk
                                </a>
                                <a href="absen_pulang.php" class="btn btn-outline-light fw-bold rounded-pill px-4">
                                    <i class="bi bi-box-arrow-left me-2"></i>Absen Pulang
                                </a>
                            </div>
                        </div>
                        <div class="d-none d-md-block opacity-50">
                             <i class="bi bi-calendar-check-fill " style="font-size: 8rem;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
             <div class="card card-custom h-100">
                <div class="card-header bg-white py-3">
                    <h6 class="m-0 fw-bold text-primary">Status Hari Ini</h6>
                </div>
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <!-- Placeholder logic for status, can be dynamic later -->
                    <div class="mb-3">
                        <i class="bi bi-clock-history text-muted" style="font-size: 4rem;"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Belum Absen</h5>
                    <p class="text-muted small">Silakan lakukan absen masuk</p>
                </div>
             </div>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
