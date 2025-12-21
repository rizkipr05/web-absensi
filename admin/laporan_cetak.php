<?php 
include 'layout/header.php'; 
include 'layout/sidebar.php'; 
require_once '../config/database.php';

// Fetch users for the dropdown
$users = mysqli_query($conn, "SELECT id, nama FROM users WHERE role='user' ORDER BY nama ASC");
?>

<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Laporan Cetak</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard.php" class="text-decoration-none">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Laporan</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <!-- Main Form Column -->
        <div class="col-lg-8">
            <div class="card card-custom shadow-sm mb-4">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="m-0 fw-bold text-primary"><i class="bi bi-file-earmark-pdf me-2"></i>Parameter Laporan</h5>
                </div>
                <div class="card-body p-4">
                    <form action="cetak_pdf.php" method="POST" target="_blank">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="bulan" class="form-label fw-bold small text-muted text-uppercase">Bulan</label>
                                <select class="form-select bg-light border-0 py-2" id="bulan" name="bulan" required>
                                    <option value="" disabled selected>Pilih Bulan</option>
                                    <option value="01">Januari</option>
                                    <option value="02">Februari</option>
                                    <option value="03">Maret</option>
                                    <option value="04">April</option>
                                    <option value="05">Mei</option>
                                    <option value="06">Juni</option>
                                    <option value="07">Juli</option>
                                    <option value="08">Agustus</option>
                                    <option value="09">September</option>
                                    <option value="10">Oktober</option>
                                    <option value="11">November</option>
                                    <option value="12">Desember</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="tahun" class="form-label fw-bold small text-muted text-uppercase">Tahun</label>
                                <select class="form-select bg-light border-0 py-2" id="tahun" name="tahun" required>
                                    <?php 
                                    $currentYear = date('Y');
                                    for($i = $currentYear; $i >= $currentYear - 2; $i--) {
                                        echo "<option value='$i'>$i</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            
                            <!-- Optional additional filters -->
                            <div class="col-12 mt-4">
                                <label class="form-label fw-bold small text-muted text-uppercase">Tipe Laporan</label>
                                <div class="d-flex gap-3">
                                    <div class="form-check card-radio p-0">
                                        <input class="form-check-input d-none" type="radio" name="tipeLaporan" id="tipeSemua" value="semua" checked>
                                        <label class="form-check-label border rounded p-3 d-block text-center cursor-pointer radio-label" for="tipeSemua">
                                            <i class="bi bi-people d-block fs-4 mb-2"></i>
                                            Semua Pegawai
                                        </label>
                                    </div>
                                    <div class="form-check card-radio p-0">
                                        <input class="form-check-input d-none" type="radio" name="tipeLaporan" id="tipeIndividu" value="individu">
                                        <label class="form-check-label border rounded p-3 d-block text-center cursor-pointer radio-label" for="tipeIndividu">
                                            <i class="bi bi-person d-block fs-4 mb-2"></i>
                                            Pegawai Tertentu
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Select user dropdown (Hidden by default) -->
                            <div class="col-12 mt-3" id="userDropdownContainer" style="display: none;">
                                <label for="user_id" class="form-label fw-bold small text-muted text-uppercase">Pilih Pegawai</label>
                                <select class="form-select bg-light border-0 py-2" id="user_id" name="user_id">
                                    <option value="" selected>-- Pilih Pegawai --</option>
                                    <?php while($user = mysqli_fetch_assoc($users)): ?>
                                        <option value="<?= $user['id'] ?>"><?= htmlspecialchars($user['nama']) ?></option>
                                    <?php endwhile; ?>
                                </select>
                            </div>

                        </div>

                        <hr class="my-4">

                        <div class="d-flex align-items-center justify-content-end gap-2">
                             <button type="reset" class="btn btn-light text-secondary">Reset</button>
                             <button type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-printer-fill me-2"></i> Cetak Laporan
                             </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Info Column -->
        <div class="col-lg-4">
            <div class="card card-custom bg-primary text-white mb-4">
                <div class="card-body">
                    <h5 class="card-title"><i class="bi bi-info-circle-fill me-2"></i>Petunjuk</h5>
                    <p class="card-text small opacity-75">
                        Pilih bulan dan tahun untuk mencetak laporan absensi bulanan. Anda dapat memilih untuk mencetak laporan seluruh pegawai atau pegawai tertentu saja.
                    </p>
                </div>
            </div>

            <div class="card card-custom shadow-sm border-0">
                <div class="card-body">
                    <h6 class="fw-bold mb-3">Laporan Terakhir Dicetak</h6>
                    <ul class="list-group list-group-flush small">
                        <li class="list-group-item px-0 d-flex justify-content-between align-items-center border-bottom">
                            <div>
                                <i class="bi bi-file-earmark-pdf text-danger me-2"></i>
                                Laporan_Nov_2025.pdf
                            </div>
                            <span class="text-muted">Kemarin</span>
                        </li>
                         <li class="list-group-item px-0 d-flex justify-content-between align-items-center">
                            <div>
                                <i class="bi bi-file-earmark-pdf text-danger me-2"></i>
                                Laporan_Okt_2025.pdf
                            </div>
                            <span class="text-muted">1 Nov</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
/* Local style for radio buttons resembling cards */
.radio-label {
    transition: all 0.2s;
    background: #fff;
}
.form-check-input:checked + .radio-label {
    background: #e8f0fe;
    border-color: var(--primary-color) !important;
    color: var(--primary-color);
}
.cursor-pointer { cursor: pointer; }
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const tipeSemua = document.getElementById('tipeSemua');
    const tipeIndividu = document.getElementById('tipeIndividu');
    const userDropdown = document.getElementById('userDropdownContainer');
    const userSelect = document.getElementById('user_id');

    function toggleDropdown() {
        if (tipeIndividu.checked) {
            userDropdown.style.display = 'block';
            userSelect.required = true;
        } else {
            userDropdown.style.display = 'none';
            userSelect.required = false;
            userSelect.value = ''; // Reset selection
        }
    }

    tipeSemua.addEventListener('change', toggleDropdown);
    tipeIndividu.addEventListener('change', toggleDropdown);
});
</script>

<?php include 'layout/footer.php'; ?>
