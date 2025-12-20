<?php include 'layout/header.php'; ?>
<?php include 'layout/sidebar.php'; ?>

<!-- Page Content -->
<div class="container-fluid p-0">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="page-header-title">Absen Masuk</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home.php" class="text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Masuk</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Alert Info -->
    <div class="alert alert-info border-start border-4 border-info shadow-sm" role="alert">
        <div class="d-flex align-items-center">
            <i class="bi bi-info-circle-fill fs-4 me-3"></i>
            <div>
                 <strong>Penting!</strong> Pastikan Anda mengizinkan akses <b>Kamera</b> dan <b>Lokasi</b> di browser Anda.
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Camera Column -->
        <div class="col-md-6">
            <div class="card card-custom h-100">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="m-0 fw-bold text-primary"><i class="bi bi-camera me-2"></i>Kamera (Selfie)</h5>
                </div>
                <div class="card-body">
                    <div id="videoWrap" class="bg-dark rounded overflow-hidden d-flex align-items-center justify-content-center" style="min-height: 280px;">
                        <video id="video" autoplay playsinline muted style="width: 100%; object-fit: cover;"></video>
                    </div>
                    <canvas id="canvas" class="d-none"></canvas>
                    
                    <div class="mt-3 text-center">
                        <img id="preview" class="d-none img-fluid rounded border shadow-sm" alt="Preview selfie">
                    </div>

                    <div class="mt-4 d-grid gap-2 d-md-flex justify-content-md-center">
                        <button class="btn btn-primary" id="btnCapture" type="button">
                            <i class="bi bi-camera-fill me-2"></i>Ambil Foto
                        </button>
                        <button class="btn btn-outline-secondary" id="btnRetake" type="button" disabled>
                            <i class="bi bi-arrow-counterclockwise me-2"></i>Ulangi
                        </button>
                    </div>
                    
                    <div class="mt-3 text-center small text-muted">
                        Status Kamera: <span id="camStatus" class="fw-bold">Menunggu...</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Location Column -->
        <div class="col-md-6">
            <div class="card card-custom h-100">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="m-0 fw-bold text-success"><i class="bi bi-geo-alt me-2"></i>Lokasi Anda</h5>
                </div>
                <div class="card-body">
                    <div class="d-grid mb-4">
                        <button class="btn btn-success" id="btnLocation" type="button">
                            <i class="bi bi-geo-alt-fill me-2"></i>Ambil Lokasi Saat Ini
                        </button>
                    </div>

                    <ul class="list-group list-group-flush mb-4 small">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Latitude <span id="latText" class="fw-mono fw-bold">-</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Longitude <span id="lngText" class="fw-mono fw-bold">-</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Akurasi <span class="badge bg-secondary rounded-pill"><span id="accText">-</span> meter</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Status <span id="locStatus" class="fw-bold text-muted">Belum diambil</span>
                        </li>
                    </ul>

                    <form method="post" action="absen_masuk_process.php" id="formAbsen">
                        <input type="hidden" name="photo_base64" id="photo_base64">
                        <input type="hidden" name="lat" id="lat">
                        <input type="hidden" name="lng" id="lng">
                        <input type="hidden" name="accuracy" id="accuracy">

                        <button class="btn btn-dark w-100 py-3 fw-bold" type="submit" id="btnSubmit" disabled>
                            <i class="bi bi-send-fill me-2"></i>Kirim Absen Masuk
                        </button>
                    </form>
                    
                    <div class="mt-3 text-center small text-muted">
                        <i class="bi bi-exclamation-circle me-1"></i>Tombol kirim aktif jika foto & lokasi tersedia.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
const video = document.getElementById('video');
const canvas = document.getElementById('canvas');
const preview = document.getElementById('preview');
const btnCapture = document.getElementById('btnCapture');
const btnRetake = document.getElementById('btnRetake');
const btnLocation = document.getElementById('btnLocation');
const btnSubmit = document.getElementById('btnSubmit');

const photoBase64 = document.getElementById('photo_base64');
const latInp = document.getElementById('lat');
const lngInp = document.getElementById('lng');
const accInp = document.getElementById('accuracy');

const latText = document.getElementById('latText');
const lngText = document.getElementById('lngText');
const accText = document.getElementById('accText');

const camStatus = document.getElementById('camStatus');
const locStatus = document.getElementById('locStatus');

let streamRef = null;
let hasPhoto = false;
let hasLocation = false;

function updateSubmitState() {
  btnSubmit.disabled = !(hasPhoto && hasLocation);
  if (!btnSubmit.disabled) {
      btnSubmit.classList.remove('btn-dark');
      btnSubmit.classList.add('btn-primary');
  } else {
      btnSubmit.classList.add('btn-dark');
      btnSubmit.classList.remove('btn-primary');
  }
}

// =====================
// START CAMERA
// =====================
async function startCamera() {
  try {
    if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
      camStatus.textContent = "Browser tidak mendukung kamera.";
      camStatus.className = "text-danger fw-bold";
      alert("Browser tidak mendukung kamera.");
      return;
    }

    streamRef = await navigator.mediaDevices.getUserMedia({
      video: { facingMode: "user" },
      audio: false
    });

    video.srcObject = streamRef;

    await new Promise((resolve) => {
      if (video.readyState >= 1) return resolve();
      video.onloadedmetadata = () => resolve();
    });

    camStatus.textContent = "Aktif ✅";
    camStatus.className = "text-success fw-bold";
  } catch (e) {
    camStatus.textContent = "Gagal (Izin ditolak)";
    camStatus.className = "text-danger fw-bold";
    alert("Gagal akses kamera. Cek izin kamera di browser.\nDetail: " + e.message);
  }
}
startCamera();

// =====================
// CAPTURE PHOTO
// =====================
btnCapture.addEventListener('click', () => {
  const w = video.videoWidth;
  const h = video.videoHeight;

  if (!w || !h) {
    alert("Kamera belum siap. Tunggu sebentar atau refresh.");
    return;
  }

  canvas.width = w;
  canvas.height = h;

  const ctx = canvas.getContext('2d');
  ctx.drawImage(video, 0, 0, w, h);

  const dataUrl = canvas.toDataURL('image/jpeg', 0.9);
  photoBase64.value = dataUrl;

  preview.src = dataUrl;
  preview.classList.remove('d-none');
  
  // hide video container to show preview better? optional. 
  // For now let's keep video visible or maybe hide it. User existing code didn't hide it.
  
  hasPhoto = true;
  btnRetake.disabled = false;
  updateSubmitState();
});

btnRetake.addEventListener('click', () => {
  preview.classList.add('d-none');
  preview.src = '';
  photoBase64.value = '';
  hasPhoto = false;
  btnRetake.disabled = true;
  updateSubmitState();
});

// =====================
// GET LOCATION
// =====================
btnLocation.addEventListener('click', () => {
  if (!navigator.geolocation) {
    locStatus.textContent = "Browser tidak mendukung GPS.";
    alert("Browser tidak mendukung GPS.");
    return;
  }

  locStatus.textContent = "Mengambil lokasi...";
  locStatus.className = "text-warning fw-bold";

  navigator.geolocation.getCurrentPosition(
    (pos) => {
      const { latitude, longitude, accuracy } = pos.coords;

      latInp.value = latitude;
      lngInp.value = longitude;
      accInp.value = accuracy;

      latText.textContent = latitude.toFixed(7);
      lngText.textContent = longitude.toFixed(7);
      accText.textContent = Math.round(accuracy);

      hasLocation = true;
      locStatus.textContent = "Didapat ✅";
      locStatus.className = "text-success fw-bold";
      updateSubmitState();
    },
    (err) => {
      locStatus.textContent = "Gagal ❌";
      locStatus.className = "text-danger fw-bold";
      alert("Gagal ambil lokasi: " + err.message);
    },
    { enableHighAccuracy: true, timeout: 15000, maximumAge: 0 }
  );
});

// optional: stop camera saat keluar halaman
window.addEventListener('beforeunload', () => {
  if (streamRef) {
    streamRef.getTracks().forEach(t => t.stop());
  }
});
</script>

<?php include 'layout/footer.php'; ?>
