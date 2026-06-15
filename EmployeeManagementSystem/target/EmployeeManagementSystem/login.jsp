<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Employee Management System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="login-page">
    <div class="container d-flex justify-content-center align-items-center">
        <div class="login-card animate-fade shadow-lg">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-primary">EMS Login</h2>
                <p class="text-muted small">Please enter your credentials to continue</p>
            </div>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <form action="login" method="post" class="needs-validation" novalidate>
                <div class="mb-4">
                    <label for="username" class="form-label fw-medium small">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required placeholder="example: admin">
                    <div class="invalid-feedback">Please enter your username.</div>
                </div>
                <div class="mb-4">
                    <label for="password" class="form-label fw-medium small">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="••••••••">
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary py-2 fw-semibold">Login to Dashboard</button>
                </div>
            </form>
            
            <div class="mt-4 pt-3 border-top text-center">
                <p class="text-muted mb-1 small">Test Credentials:</p>
                <div class="d-flex justify-content-center gap-2">
                    <span class="badge bg-light text-dark border p-2">Admin: admin/admin123</span>
                    <span class="badge bg-light text-dark border p-2">Emp: employee/emp123</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS & Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
