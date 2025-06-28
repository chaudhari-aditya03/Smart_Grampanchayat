<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page session="true" %>
<%
    // Retrieve the scheme ID from the request
    String schemeIdParam = request.getParameter("scheme_id");

    if (schemeIdParam == null || schemeIdParam.isEmpty()) {
        out.println("<h3>Error: Missing Scheme ID</h3>");
        return;
    }

    int schemeId = Integer.parseInt(schemeIdParam);

    // Database connection setup
    String jdbcURL = "jdbc:mysql://localhost:3306/smart_grampanchayat";
    String jdbcUsername = "root";
    String jdbcPassword = "7709648063";

    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // SQL query to delete the scheme
        String sql = "DELETE FROM schemes WHERE scheme_id=?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, schemeId);

        int rowsDeleted = statement.executeUpdate();

        if (rowsDeleted > 0) {
%>
        <script>
            alert("Scheme deleted successfully!");
            window.location.href = "AdminDashboard.jsp"; // Redirect to schemes page
        </script>
<%
        } else {
            out.println("<h3>Error: No Scheme Found with ID " + schemeId + "</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error deleting scheme: " + e.getMessage() + "</h3>");
    } finally {
        try { if (statement != null) statement.close(); } catch (Exception e) {}
        try { if (connection != null) connection.close(); } catch (Exception e) {}
    }
%>
