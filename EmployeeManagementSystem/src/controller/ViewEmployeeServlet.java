package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import model.Employee;

/**
 * Servlet implementation for Viewing Employees with Pagination and Sorting.
 */
public class ViewEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int page = 1;
        int pageSize = 5;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        String sortBy = request.getParameter("sortBy");
        String order = request.getParameter("order");
        if (sortBy == null) sortBy = "id";
        if (order == null) order = "ASC";

        List<Employee> listEmployees = employeeDAO.getEmployeesPaginatedAndSorted(sortBy, order, page, pageSize);
        int totalEmployees = employeeDAO.getTotalEmployeeCount();
        int totalPages = (int) Math.ceil((double) totalEmployees / pageSize);

        request.setAttribute("listEmployees", listEmployees);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("order", order);

        request.getRequestDispatcher("viewEmployees.jsp").forward(request, response);
    }
}
