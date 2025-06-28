<%@ page import="java.sql.*, javax.sql.*, java.util.*" %>
<%@ page session="true" %>

<%
    // JDBC Setup
    String jdbcURL = "jdbc:mysql://localhost:3306/smart_grampanchayat"; // Update with your DB details
    String jdbcUsername = "root"; // Update with your DB username
    String jdbcPassword = "7709648063"; // Update with your DB password
    Connection connection = null;
    PreparedStatement statement = null;
    
    try {
        // Get the user ID from the request
        int userId = Integer.parseInt(request.getParameter("user_id"));

        // Establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        
        // SQL query to delete the user
        String sql = "DELETE FROM user WHERE user_id = ?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, userId);
        int rowsDeleted = statement.executeUpdate();

        if (rowsDeleted > 0) {
            out.println("User deleted successfully!");
            response.sendRedirect("AdminDashboard.jsp"); // Redirect back to the dashboard
        } else {
            out.println("Error deleting user.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close all resources
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
