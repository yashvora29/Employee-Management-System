<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee - EMS</title>
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
                            <h2 class="fw-bold mb-0">Add New Employee</h2>
                            <p class="text-muted small mb-0">Fill in the details below to create a new record.</p>
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

                    <form action="addEmployee" method="post" class="needs-validation" novalidate>
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">First Name</label>
                                <input type="text" name="firstName" class="form-control" placeholder="John" required>
                                <div class="invalid-feedback">Please enter first name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Last Name</label>
                                <input type="text" name="lastName" class="form-control" placeholder="Doe" required>
                                <div class="invalid-feedback">Please enter last name.</div>
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-7">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-envelope"></i></span>
                                    <input type="email" name="email" class="form-control border-start-0 ps-0" placeholder="john.doe@company.com" required>
                                </div>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-5">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-telephone"></i></span>
                                    <input type="text" name="phone" class="form-control border-start-0 ps-0" placeholder="+1 (555) 000-0000">
                                </div>
                            </div>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Designation / Role</label>
                                <input type="text" name="designation" class="form-control" placeholder="Software Engineer">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small text-muted text-uppercase">Annual Salary ($)</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-currency-dollar"></i></span>
                                    <input type="number" step="0.01" name="salary" class="form-control border-start-0 ps-0" placeholder="65000.00" required min="0">
                                </div>
                                <div class="invalid-feedback">Please enter a valid salary.</div>
                            </div>
                        </div>

                        <div class="mb-5">
                            <label class="form-label fw-semibold small text-muted text-uppercase">Joining Date</label>
                            <input type="date" name="hireDate" class="form-control" required>
                            <div class="invalid-feedback">Please select a joining date.</div>
                        </div>

                        <div class="d-flex flex-column flex-md-row gap-3">
                            <button type="submit" class="btn btn-primary px-5 py-2 fw-bold flex-grow-1 shadow-sm">
                                <i class="bi bi-check-circle-fill me-2"></i> Save Employee Record
                            </button>
                            <a href="viewEmployees" class="btn btn-light px-5 py-2 fw-medium border text-muted">Cancel</a>
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
