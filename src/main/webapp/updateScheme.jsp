<%@ page import="java.sql.*, javax.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    // Retrieve form parameters
    String schemeIdParam = request.getParameter("scheme_id");
    String schemeName = request.getParameter("scheme_name");
    String description = request.getParameter("description");
    String eligibility = request.getParameter("eligibility_criteria");
    String benefits = request.getParameter("benefits");
    String applicationProcess = request.getParameter("application_process");

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

        // SQL query to update scheme details
        String sql = "UPDATE schemes SET scheme_name=?, description=?, eligibility_criteria=?, benefits=?, application_process=? WHERE scheme_id=?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, schemeName);
        statement.setString(2, description);
        statement.setString(3, eligibility);
        statement.setString(4, benefits);
        statement.setString(5, applicationProcess);
        statement.setInt(6, schemeId);

        int rowsUpdated = statement.executeUpdate();
        
        if (rowsUpdated > 0) {
%>
        <script>
            alert("Scheme updated successfully!");
            window.location.href = "AdminDashboard.jsp"; // Redirect to schemes page
        </script>
<%
        } else {
            out.println("<h3>Error: No Scheme Found with ID " + schemeId + "</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error updating scheme: " + e.getMessage() + "</h3>");
    } finally {
        try { if (statement != null) statement.close(); } catch (Exception e) {}
        try { if (connection != null) connection.close(); } catch (Exception e) {}
    }
%>
