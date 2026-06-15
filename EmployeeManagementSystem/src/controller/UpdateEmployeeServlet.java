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
 * Servlet implementation for Updating an Employee.
 */
public class UpdateEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Employee existingEmployee = employeeDAO.getEmployeeById(id);
            request.setAttribute("employee", existingEmployee);
            request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
        } else {
            response.sendRedirect("viewEmployees");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String designation = request.getParameter("designation");
        String salaryStr = request.getParameter("salary");
        String hireDateStr = request.getParameter("hireDate");

        try {
            double salary = Double.parseDouble(salaryStr);
            Date hireDate = new SimpleDateFormat("yyyy-MM-dd").parse(hireDateStr);

            Employee employee = new Employee(id, firstName, lastName, email, phone, designation, salary, hireDate);

            if (employeeDAO.updateEmployee(employee)) {
                String subject = "Employee Record Updated";
                String body = "Hello " + firstName + " " + lastName + ",\n\n" +
                             "Your employee information has been updated successfully.\n\n" +
                             "Please review your profile.\n\n" +
                             "Thank you.";
                
                new Thread(() -> {
                    EmailUtil.sendEmail(email, subject, body);
                }).start();

                response.sendRedirect("viewEmployees");
            } else {
                request.setAttribute("errorMessage", "Error occurred while updating employee.");
                request.setAttribute("employee", employee);
                request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewEmployees");
        }
    }
}
