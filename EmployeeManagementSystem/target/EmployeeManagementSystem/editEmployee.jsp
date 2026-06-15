<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Employee, java.text.SimpleDateFormat" %>
<%
    Employee emp = (Employee) request.getAttribute("employee");
    if (emp == null) {
        response.sendRedirect("viewEmployees");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
    <div class="container animate-fade mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="glass-card p-4 p-md-5">
                    <div class="d-flex align-items-center mb-4">
                        <a href="viewEmployees" class="btn btn-outline-secondary btn-sm rounded-circle me-3" style="width: 32px; height: 32px; padding: 0; line-height: 30px;" data-bs-toggle="tooltip" title="Back to Directory">
                            <i class="bi bi-arrow-left"></i>
                        </a>
                        <div>
                            <h2 class="fw-bold mb-0">Edit Employee Profile</h2>
                            <p class="text-muted small mb-0">Updating records for <strong><%= emp.getFirstName() %> <%= emp.getLastName() %></strong> (ID: #<%= emp.getId() %>)</p>
                        </div>
                    </div>

                    <hr class="my-4 opacity-10">

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                            <i class="bi bi-exclamation-circle-fill me-2"></i>
                            <%= request.getAttribute("errorMessage") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <% } %>

                    <form action="updateEmployee" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="id" value="<%= emp.getId() %>">
                        
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">First Name</label>
                                <input type="text" name="firstName" value="<%= emp.getFirstName() %>" class="form-control" required>
                                <div class="invalid-feedback">First name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Last Name</label>
                                <input type="text" name="lastName" value="<%= emp.getLastName() %>" class="form-control" required>
                                <div class="invalid-feedback">Last name is required.</div>
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-7">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-envelope"></i></span>
                                    <input type="email" name="email" value="<%= emp.getEmail() %>" class="form-control border-start-0 ps-0" required>
                                </div>
                                <div class="invalid-feedback">Please provide a valid email.</div>
                            </div>
                            <div class="col-md-5">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-telephone"></i></span>
                                    <input type="text" name="phone" value="<%= emp.getPhone() != null ? emp.getPhone() : "" %>" class="form-control border-start-0 ps-0">
                                </div>
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Designation / Role</label>
                                <input type="text" name="designation" value="<%= emp.getDesignation() != null ? emp.getDesignation() : "" %>" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Annual Salary ($)</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-currency-dollar"></i></span>
                                    <input type="number" step="0.01" name="salary" value="<%= emp.getSalary() %>" class="form-control border-start-0 ps-0" required min="0">
                                </div>
                                <div class="invalid-feedback">Please enter a valid salary amount.</div>
                            </div>
                        </div>

                        <div class="mb-5">
                            <label class="form-label fw-semibold small text-muted text-uppercase">Hire Date</label>
                            <input type="date" name="hireDate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(emp.getHireDate()) %>" class="form-control" required>
                            <div class="invalid-feedback">Joining date is required.</div>
                        </div>

                        <div class="d-flex flex-column flex-md-row gap-3">
                            <button type="submit" class="btn btn-warning px-5 py-2 fw-bold flex-grow-1 shadow-sm text-dark">
                                <i class="bi bi-arrow-repeat me-2"></i> Update Employee Record
                            </button>
                            <a href="viewEmployees" class="btn btn-light px-5 py-2 fw-medium border text-muted">Cancel Change</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS & Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
