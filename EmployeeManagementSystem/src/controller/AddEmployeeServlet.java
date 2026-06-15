package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDAO;
import model.Employee;
import model.User;
import util.EmailUtil;

/**
 * Servlet implementation for Adding a new Employee.
 */
public class AddEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String designation = request.getParameter("designation");
        String salaryStr = request.getParameter("salary");
        String hireDateStr = request.getParameter("hireDate");

        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$") ||
            salaryStr == null || salaryStr.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required. Please provide a valid email.");
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
            return;
        }

        try {
            double salary = Double.parseDouble(salaryStr);
            Date hireDate = new SimpleDateFormat("yyyy-MM-dd").parse(hireDateStr);

            Employee employee = new Employee();
            employee.setFirstName(firstName);
            employee.setLastName(lastName);
            employee.setEmail(email);
            employee.setPhone(phone);
            employee.setDesignation(designation);
            employee.setSalary(salary);
            employee.setHireDate(hireDate);

            if (employeeDAO.addEmployee(employee)) {
                String subject = "Employee Record Created";
                String body = "Hello " + firstName + " " + lastName + ",\n\n" +
                             "Your employee record has been created successfully.\n\n" +
                             "Department: " + designation + "\n" +
                             "Salary: " + salary + "\n\n" +
                             "Thank you.";
                
                new Thread(() -> {
                    EmailUtil.sendEmail(email, subject, body);
                }).start();

                response.sendRedirect("viewEmployees");
            } else {
                request.setAttribute("errorMessage", "Error occurred while adding employee.");
                request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Invalid format: " + e.getMessage());
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
    }
}
