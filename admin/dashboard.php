<?php include 'layout/header.php'; ?>
<?php include 'layout/sidebar.php'; ?>

<!-- Dashboard Content -->
<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Dashboard Overview</h2>
            <p class="text-secondary">Ringkasan aktivitas hari ini</p>
        </div>
    </div>

    <!-- Stats Cards Row -->
    <div class="row g-4 mb-5">
        <!-- Total Pegawai Card -->
        <div class="col-xl-4 col-md-6">
            <div class="card card-custom card-border-left-primary h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs fw-bold text-primary text-uppercase mb-1">Total Pegawai</div>
                            <div class="h5 mb-0 fw-bold text-gray-800">12</div>
                        </div>
                        <div class="col-auto">
                            <i class="bi bi-people-fill fs-2 text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hadir Card -->
        <div class="col-xl-4 col-md-6">
            <div class="card card-custom card-border-left-success h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs fw-bold text-success text-uppercase mb-1">Hadir Hari Ini</div>
                            <div class="h5 mb-0 fw-bold text-gray-800">8</div>
                        </div>
                        <div class="col-auto">
                            <i class="bi bi-calendar-check-fill fs-2 text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Izin/Sakit Card -->
        <div class="col-xl-4 col-md-6">
            <div class="card card-custom card-border-left-warning h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs fw-bold text-warning text-uppercase mb-1">Izin / Sakit</div>
                            <div class="h5 mb-0 fw-bold text-gray-800">2</div>
                        </div>
                        <div class="col-auto">
                            <i class="bi bi-clipboard-x-fill fs-2 text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Section -->
    <div class="row">
        <div class="col-12">
            <div class="card card-custom shadow-sm">
                <div class="card-header bg-white py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 fw-bold text-primary">Aktivitas Terbaru (Demo)</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="bi bi-three-dots-vertical text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="#">Lihat Semua</a>
                            <a class="dropdown-item" href="#">Export PDF</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Nama Pegawai</th>
                                    <th>Waktu Absen</th>
                                    <th>Status</th>
                                    <th>Keterangan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded-circle p-2 me-2">
                                                <i class="bi bi-person"></i>
                                            </div>
                                            <div>
                                                <span class="fw-bold d-block">Budi Santoso</span>
                                                <small class="text-muted">Staff IT</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>07:55 AM</td>
                                    <td><span class="badge bg-success rounded-pill px-3">Masuk</span></td>
                                    <td>Tepat Waktu</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded-circle p-2 me-2">
                                                <i class="bi bi-person"></i>
                                            </div>
                                            <div>
                                                <span class="fw-bold d-block">Siti Aminah</span>
                                                <small class="text-muted">HRD</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>08:05 AM</td>
                                    <td><span class="badge bg-success rounded-pill px-3">Masuk</span></td>
                                    <td>Terlambat 5m</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded-circle p-2 me-2">
                                                <i class="bi bi-person"></i>
                                            </div>
                                            <div>
                                                <span class="fw-bold d-block">Rudi Hermawan</span>
                                                <small class="text-muted">Marketing</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>-</td>
                                    <td><span class="badge bg-warning text-dark rounded-pill px-3">Izin</span></td>
                                    <td>Sakit Demam</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include 'layout/footer.php'; ?>
