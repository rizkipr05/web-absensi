<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>
<nav id="sidebar">
    <div class="sidebar-header">
        <div class="d-flex align-items-center justify-content-center">
             <i class="bi bi-shield-lock-fill fs-3 me-2"></i>
             <h3>Admin</h3>
        </div>
        <div class="small mt-2 text-white-50">Panel Manajemen</div>
    </div>

    <ul class="list-unstyled components">
        <li class="<?= $current_page == 'dashboard.php' ? 'active' : '' ?>">
            <a href="dashboard.php">
                <i class="bi bi-speedometer2"></i> Dashboard
            </a>
        </li>
        <li class="<?= $current_page == 'riwayat.php' ? 'active' : '' ?>">
            <a href="riwayat.php">
                <i class="bi bi-clock-history"></i> Riwayat Absensi
            </a>
        </li>
        <li class="<?= $current_page == 'laporan_cetak.php' ? 'active' : '' ?>">
            <a href="laporan_cetak.php">
                <i class="bi bi-printer"></i> Laporan Cetak
            </a>
        </li>
    </ul>

    <div style="margin-top: auto; padding: 20px;">
        <a href="../auth/logout.php" class="btn btn-outline-light w-100 d-flex align-items-center justify-content-center" style="border-radius: 20px; backdrop-filter: blur(5px); background: rgba(255,255,255,0.1);">
            <i class="bi bi-box-arrow-right me-2"></i> Logout
        </a>
    </div>
</nav>

<!-- Page Content Wrapper - Starts here, ends in footer -->
<div id="content">
    <!-- Top Navbar -->
    <nav class="top-navbar">
        <button type="button" id="sidebarCollapse" class="btn-toggle-sidebar">
            <i class="bi bi-list"></i>
        </button>
        
        <div class="d-flex align-items-center">
            <div class="dropdown">
                <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle text-secondary" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 35px; height: 35px;">
                        <?= strtoupper(substr($_SESSION['user']['nama'] ?? 'A', 0, 1)) ?>
                    </div>
                    <span class="d-none d-sm-inline fw-medium"><?= htmlspecialchars($_SESSION['user']['nama'] ?? 'Admin') ?></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="../auth/logout.php">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
