<?php
session_start();
if (isset($_SESSION['user'])) {
  if ($_SESSION['user']['role'] === 'admin') {
    header("Location: ../admin/dashboard.php"); exit;
  } else {
    header("Location: ../user/home.php"); exit;
  }
}
$error = $_GET['error'] ?? null;
?>
<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login - Web Absensi</title>
  
  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  
  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  
  <style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .login-card {
        border: none;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        overflow: hidden;
        width: 100%;
        max-width: 450px;
        background: #fff;
        animation: fadeInUp 0.5s ease-out;
    }
    
    .card-header-custom {
        background: #fff;
        padding: 40px 40px 20px 40px;
        text-align: center;
    }

    .card-body-custom {
        padding: 20px 40px 40px 40px;
    }

    .form-control {
        height: 50px;
        border-radius: 10px;
        padding-left: 45px;
        font-size: 0.95rem;
        border: 1px solid #e3e6f0;
        background-color: #f8f9fc;
        transition: all 0.2s;
    }
    
    .form-control:focus {
        background-color: #fff;
        border-color: #4e73df;
        box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
    }
    
    .input-icon {
        position: absolute;
        left: 15px;
        top: 13px;
        color: #b7b9cc;
        font-size: 1.2rem;
        transition: color 0.2s;
    }
    
    .input-group:focus-within .input-icon {
        color: #4e73df;
    }
    
    .btn-login {
        height: 50px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 1rem;
        background: #4e73df;
        border: none;
        transition: all 0.3s;
        box-shadow: 0 4px 15px rgba(78, 115, 223, 0.3);
    }
    
    .btn-login:hover {
        background: #2e59d9;
        transform: translateY(-2px);
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

  <div class="container px-3">
    <div class="d-flex justify-content-center">
        <div class="login-card">
            <div class="card-header-custom">
                <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                    <i class="bi bi-shield-lock-fill fs-1"></i>
                </div>
                <h4 class="fw-bold text-dark mb-1">Selamat Datang</h4>
                <p class="text-muted small mb-0">Silakan login untuk mengakses sistem absensi</p>
            </div>
            
            <div class="card-body-custom">
                <?php if ($error): ?>
                    <div class="alert alert-danger d-flex align-items-center small" role="alert">
                        <i class="bi bi-exclamation-circle-fill me-2"></i>
                        <div><?= htmlspecialchars($error) ?></div>
                    </div>
                <?php endif; ?>

                <form method="post" action="login_process.php" autocomplete="off">
                    <div class="mb-4 position-relative input-group">
                        <i class="bi bi-envelope input-icon"></i>
                        <input name="email" type="email" class="form-control" placeholder="Email Address" required>
                    </div>
                    
                    <div class="mb-4 position-relative input-group">
                        <i class="bi bi-lock input-icon"></i>
                        <input name="password" type="password" class="form-control" placeholder="Password" required>
                    </div>
                    <button class="btn btn-primary w-100 btn-login text-white" type="submit">
                        Masuk Sekarang <i class="bi bi-arrow-right ms-2"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
  </div>
</body>
</html>
