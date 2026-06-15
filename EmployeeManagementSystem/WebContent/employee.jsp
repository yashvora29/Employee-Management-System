<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee View - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg glass-nav navbar-dark p-3">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#"><i class="bi bi-person-badge-fill me-2"></i>EMS Employee</a>
            <div class="ms-auto d-flex align-items-center">
                <span class="text-white me-3 d-none d-md-block">Logged in: <%= user.getUsername() %></span>
                <a href="logout" class="btn btn-outline-light btn-sm rounded-pill px-3">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container animate-fade mt-5">
        <div class="glass-card p-4 p-md-5">
            <div class="text-center mb-5">
                <h1 class="fw-bold">Employee Dashboard</h1>
                <p class="text-muted">Welcome to your personal panel, <%= user.getUsername() %>!</p>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card border-0 shadow-sm rounded-4 p-4 text-center">
                        <div class="bg-info bg-opacity-10 p-4 rounded-circle text-info mx-auto mb-4" style="width: 80px; height: 80px;">
                            <i class="bi bi-journal-text fs-1"></i>
                        </div>
                        <h4 class="fw-bold mb-3">Directory</h4>
                        <p class="text-muted mb-4">View the internal employee directory and find colleagues.</p>
                        <a href="viewEmployees" class="btn btn-primary py-2 rounded-3 w-100">Browse Employees</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
