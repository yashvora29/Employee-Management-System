<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (!"Admin".equalsIgnoreCase(user.getRole())) {
        out.println("<h2 style='color:red;'>Access Denied.</h2>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg glass-nav navbar-dark p-3">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#"><i class="bi bi-shield-lock-fill me-2"></i>EMS Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <span class="nav-link text-white me-3 d-none d-lg-block">
                            <i class="bi bi-person-circle me-1"></i> Hello, <%= user.getUsername() %>
                        </span>
                    </li>
                    <li class="nav-item">
                        <a href="logout" class="btn btn-outline-danger btn-sm rounded-pill px-3">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container animate-fade mt-5">
        <div class="glass-card p-4 p-md-5">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4">
                <div>
                    <h1 class="fw-bold mb-1">Admin Dashboard</h1>
                    <p class="text-muted">Welcome back. Here's what's happening today.</p>
                </div>
                <div class="mt-3 mt-md-0">
                    <span class="badge bg-primary px-3 py-2">Account Type: Admin</span>
                </div>
            </div>
            
            <hr class="my-4 opacity-10">

            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="bg-primary bg-opacity-10 p-3 rounded-3 text-primary me-3">
                                    <i class="bi bi-people-fill fs-4"></i>
                                </div>
                                <h5 class="card-title fw-bold mb-0">Employees</h5>
                            </div>
                            <p class="card-text text-muted small mb-4">View, search, update, and manage all employee records in the system.</p>
                            <a href="viewEmployees" class="btn btn-primary w-100 py-2 rounded-3">Manage Employees</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm rounded-4 opacity-50">
                        <div class="card-body p-4 text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-gear-fill fs-1 text-muted mb-2"></i>
                            <h6 class="fw-bold text-muted">System Settings</h6>
                            <p class="small text-muted mb-0">Coming Soon</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card h-100 border-0 shadow-sm rounded-4 opacity-50">
                        <div class="card-body p-4 text-center d-flex flex-column justify-content-center">
                            <i class="bi bi-bar-chart-fill fs-1 text-muted mb-2"></i>
                            <h6 class="fw-bold text-muted">Reports & Analytics</h6>
                            <p class="small text-muted mb-0">Coming Soon</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
