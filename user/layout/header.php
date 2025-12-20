<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'user') {
    header("Location: ../auth/login.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Web Absensi</title>
    
    <!-- Google Fonts: Poppins -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap 5 & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        :root {
            /* Using a slightly different primary color for User to distinguish (optional, but requested to "samakan", so I'll keep the structure but maybe a fresh accent) */
            --primary-color: #0d6efd; /* Bootstrap Blue */
            --secondary-color: #858796;
            --success-color: #198754;
            --info-color: #0dcaf0;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --light-color: #f8f9fc;
            --dark-color: #212529;
            --sidebar-bg: #0d6efd;
            --sidebar-color: #fff;
            --bg-color: #f0f2f5;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: #444;
            overflow-x: hidden;
        }

        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
        }

        /* Modern Sidebar */
        #sidebar {
            min-width: 260px;
            max-width: 260px;
            min-height: 100vh;
            /* Gradient for user - nice Blue/Purple or just Blue */
            background: linear-gradient(180deg, var(--primary-color) 10%, #0a58ca 100%);
            color: var(--sidebar-color);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        
        #sidebar.active {
            margin-left: -260px;
        }

        #sidebar .sidebar-header {
            padding: 25px 20px;
            background: rgba(0,0,0,0.1);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            text-align: center;
        }
        
        #sidebar .sidebar-header h3 {
            font-weight: 700;
            font-size: 1.4rem;
            margin-bottom: 0;
            letter-spacing: 1px;
        }

        #sidebar ul.components {
            padding: 15px 10px;
            border-bottom: none;
        }

        #sidebar ul li {
            margin-bottom: 5px;
        }

        #sidebar ul li a {
            padding: 12px 20px;
            font-size: 0.95rem;
            display: block;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            border-radius: 10px;
            transition: all 0.3s;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        #sidebar ul li a i {
            margin-right: 15px;
            font-size: 1.1rem;
            width: 25px;
            text-align: center;
        }

        #sidebar ul li a:hover {
            color: #fff;
            background: rgba(255,255,255,0.15);
            transform: translateX(5px);
        }

        #sidebar ul li.active > a {
            color: var(--primary-color);
            background: #fff;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        /* Content Area */
        #content {
            width: 100%;
            padding: 30px;
            min-height: 100vh;
            transition: all 0.3s;
        }

        /* Header Navbar */
        .top-navbar {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            padding: 15px 25px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .btn-toggle-sidebar {
            background: transparent;
            border: none;
            color: var(--primary-color);
            font-size: 1.5rem;
            cursor: pointer;
            padding: 0;
            transition: transform 0.2s;
        }
        
        .btn-toggle-sidebar:hover {
            transform: scale(1.1);
        }

        /* Cards */
        .card-custom {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
            position: relative;
            background: #fff;
        }
        
        .card-custom:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        /* Breadcrumb Refined */
        .breadcrumb {
            background: transparent;
            padding: 0;
            margin-bottom: 0;
        }
        
        .page-header-title {
            color: #5a5c69;
            font-weight: 600;
            margin-bottom: 5px;
        }

        @media (max-width: 768px) {
            #sidebar {
                margin-left: -260px;
            }
            #sidebar.active {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="wrapper">
