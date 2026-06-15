package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
import util.DBConnection;

/**
 * Data Access Object for Employee-related database operations.
 */
public class EmployeeDAO {

    // --- CRUD Operations ---

    public boolean addEmployee(Employee employee) {
        String query = "INSERT INTO employees (first_name, last_name, email, phone, designation, salary, hire_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, employee.getFirstName());
            ps.setString(2, employee.getLastName());
            ps.setString(3, employee.getEmail());
            ps.setString(4, employee.getPhone());
            ps.setString(5, employee.getDesignation());
            ps.setDouble(6, employee.getSalary());
            ps.setDate(7, new java.sql.Date(employee.getHireDate().getTime()));
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateEmployee(Employee employee) {
        String query = "UPDATE employees SET first_name=?, last_name=?, email=?, phone=?, designation=?, salary=?, hire_date=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, employee.getFirstName());
            ps.setString(2, employee.getLastName());
            ps.setString(3, employee.getEmail());
            ps.setString(4, employee.getPhone());
            ps.setString(5, employee.getDesignation());
            ps.setDouble(6, employee.getSalary());
            ps.setDate(7, new java.sql.Date(employee.getHireDate().getTime()));
            ps.setInt(8, employee.getId());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteEmployee(int id) {
        String query = "DELETE FROM employees WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Employee getEmployeeById(int id) {
        String query = "SELECT * FROM employees WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToEmployee(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        String query = "SELECT * FROM employees";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                list.add(mapResultSetToEmployee(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // --- Pagination and Sorting ---

    public List<Employee> getEmployeesPaginatedAndSorted(String sortBy, String order, int page, int pageSize) {
        List<Employee> list = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        
        String column;
        if (sortBy == null) sortBy = "";
        switch (sortBy.toLowerCase()) {
            case "name": column = "first_name"; break;
            case "department": column = "designation"; break;
            case "salary": column = "salary"; break;
            default: column = "id";
        }

        String sortOrder = "ASC";
        if ("DESC".equalsIgnoreCase(order)) {
            sortOrder = "DESC";
        }

        String query = "SELECT * FROM employees ORDER BY " + column + " " + sortOrder + " LIMIT ? OFFSET ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToEmployee(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalEmployeeCount() {
        String query = "SELECT COUNT(*) FROM employees";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Employee mapResultSetToEmployee(ResultSet rs) throws SQLException {
        Employee emp = new Employee();
        emp.setId(rs.getInt("id"));
        emp.setFirstName(rs.getString("first_name"));
        emp.setLastName(rs.getString("last_name"));
        emp.setEmail(rs.getString("email"));
        emp.setPhone(rs.getString("phone"));
        emp.setDesignation(rs.getString("designation"));
        emp.setSalary(rs.getDouble("salary"));
        emp.setHireDate(rs.getDate("hire_date"));
        return emp;
    }
}
