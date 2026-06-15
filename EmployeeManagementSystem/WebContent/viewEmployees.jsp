<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Employee, model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Employee> listEmployees = (List<Employee>) request.getAttribute("listEmployees");
    int currentPage = (Integer) (request.getAttribute("currentPage") != null ? request.getAttribute("currentPage") : 1);
    int totalPages = (Integer) (request.getAttribute("totalPages") != null ? request.getAttribute("totalPages") : 1);
    String sortBy = (String) request.getAttribute("sortBy");
    String order = (String) request.getAttribute("order");

    String nextOrder = "ASC".equalsIgnoreCase(order) ? "DESC" : "ASC";
    String sortIcon = "ASC".equalsIgnoreCase(order) ? "bi-sort-alpha-down" : "bi-sort-alpha-up-alt";
    boolean isAdmin = "Admin".equalsIgnoreCase(user.getRole());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee List - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg glass-nav navbar-dark p-3 sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="<%= isAdmin ? "admin.jsp" : "employee.jsp" %>">
                <i class="bi bi-people-fill me-2"></i>EMS Panel
            </a>
            <div class="ms-auto d-flex align-items-center">
                <span class="text-white me-3 d-none d-md-block">Welcome, <%= user.getUsername() %></span>
                <a href="logout" class="btn btn-outline-danger btn-sm rounded-pill px-3">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container animate-fade mt-5 mb-5">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
            <div>
                <h2 class="fw-bold mb-0">Employee Directory</h2>
                <p class="text-muted small">Manage and view all registered employees.</p>
            </div>
            <% if (isAdmin) { %>
                <a href="addEmployee" class="btn btn-primary d-flex align-items-center justify-content-center gap-2 px-4 shadow-sm">
                    <i class="bi bi-person-plus-fill"></i> Add New Employee
                </a>
            <% } %>
        </div>

        <div class="table-container shadow-sm border-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th class="ps-4">ID</th>
                            <th>
                                <a href="viewEmployees?sortBy=name&order=<%= "name".equalsIgnoreCase(sortBy) ? nextOrder : "ASC" %>&page=<%= currentPage %>" 
                                   class="text-decoration-none text-muted d-flex align-items-center gap-1">
                                    Full Name 
                                    <i class="bi <%= "name".equalsIgnoreCase(sortBy) ? sortIcon : "bi-arrow-down-up opacity-50" %>"></i>
                                </a>
                            </th>
                            <th>Email Address</th>
                            <th>
                                <a href="viewEmployees?sortBy=department&order=<%= "department".equalsIgnoreCase(sortBy) ? nextOrder : "ASC" %>&page=<%= currentPage %>" 
                                   class="text-decoration-none text-muted d-flex align-items-center gap-1">
                                    Department
                                    <i class="bi <%= "department".equalsIgnoreCase(sortBy) ? sortIcon : "bi-arrow-down-up opacity-50" %>"></i>
                                </a>
                            </th>
                            <th>
                                <a href="viewEmployees?sortBy=salary&order=<%= "salary".equalsIgnoreCase(sortBy) ? nextOrder : "ASC" %>&page=<%= currentPage %>" 
                                   class="text-decoration-none text-muted d-flex align-items-center gap-1">
                                    Salary
                                    <i class="bi <%= "salary".equalsIgnoreCase(sortBy) ? sortIcon : "bi-arrow-down-up opacity-50" %>"></i>
                                </a>
                            </th>
                            <% if (isAdmin) { %><th class="text-center pe-4">Actions</th><% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (listEmployees != null && !listEmployees.isEmpty()) { 
                            for (Employee e : listEmployees) { %>
                            <tr class="align-middle">
                                <td class="ps-4 fw-medium text-muted">#<%= e.getId() %></td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="rounded-circle bg-primary bg-opacity-10 text-primary d-flex align-items-center justify-content-center me-3" style="width: 35px; height: 35px; font-weight: 600;">
                                            <%= e.getFirstName().charAt(0) %>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-dark"><%= e.getFirstName() %> <%= e.getLastName() %></div>
                                            <div class="small text-muted"><%= e.getDesignation() %></div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="text-primary-emphasis"><%= e.getEmail() %></span></td>
                                <td><span class="badge bg-light text-secondary border px-2 py-1"><%= e.getDesignation() %></span></td>
                                <td class="fw-bold text-dark">$<%= String.format("%.2f", e.getSalary()) %></td>
                                <% if (isAdmin) { %>
                                    <td class="text-center pe-4">
                                        <div class="btn-group">
                                            <a href="updateEmployee?id=<%= e.getId() %>" class="btn btn-outline-warning btn-sm" data-bs-toggle="tooltip" title="Edit Record">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="confirmDelete(<%= e.getId() %>)" data-bs-toggle="tooltip" title="Delete Record">
                                                <i class="bi bi-trash3-fill"></i>
                                            </button>
                                        </div>
                                    </td>
                                <% } %>
                            </tr>
                        <% } } else { %>
                            <tr>
                                <td colspan="<%= isAdmin ? 6 : 5 %>" class="text-center py-5">
                                    <i class="bi bi-inbox fs-1 text-muted d-block mb-2"></i>
                                    <span class="text-muted">No employees found in the directory.</span>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- Footer Meta & Pagination -->
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center p-4 border-top bg-light bg-opacity-50 gap-3">
                <div class="small text-muted">
                    Showing page <strong><%= currentPage %></strong> of <strong><%= totalPages %></strong>
                </div>
                <nav>
                    <ul class="pagination pagination-sm mb-0">
                        <li class="page-item <%= (currentPage <= 1) ? "disabled" : "" %>">
                            <a class="page-link" href="viewEmployees?page=<%= currentPage - 1 %>&sortBy=<%= sortBy %>&order=<%= order %>">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </li>
                        <% for (int i = 1; i <= totalPages; i++) { %>
                            <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                                <a class="page-link px-3" href="viewEmployees?page=<%= i %>&sortBy=<%= sortBy %>&order=<%= order %>"><%= i %></a>
                            </li>
                        <% } %>
                        <li class="page-item <%= (currentPage >= totalPages) ? "disabled" : "" %>">
                            <a class="page-link" href="viewEmployees?page=<%= currentPage + 1 %>&sortBy=<%= sortBy %>&order=<%= order %>">
                                <i class="bi bi-chevron-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
