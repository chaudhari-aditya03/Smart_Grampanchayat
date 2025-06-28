<%@ page import="java.sql.*, javax.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    int schemeId = Integer.parseInt(request.getParameter("scheme_id"));

    String jdbcURL = "jdbc:mysql://localhost:3306/smart_grampanchayat"; // Update with your DB details
    String jdbcUsername = "root"; // Update with your DB username
    String jdbcPassword = "7709648063"; // Update with your DB password
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
 
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        String sql = "SELECT * FROM schemes WHERE scheme_id = ?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, schemeId);
        resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String schemeName = resultSet.getString("scheme_name");
            String description = resultSet.getString("description");
            String eligibility = resultSet.getString("eligibility_criteria");
            String benefits = resultSet.getString("benefits");
            String applicationProcess = resultSet.getString("application_process"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Scheme</title>
</head>
<body>
    <h2>Edit Scheme</h2>
    <form action="updateScheme.jsp" method="post">
        <input type="hidden" name="scheme_id" value="<%= schemeId %>">
        
        <label>Scheme Name:</label>
        <input type="text" name="scheme_name" value="<%= schemeName %>" required><br>

        <label>Description:</label>
        <textarea name="description" required><%= description %></textarea><br>

        <label>Eligibility Criteria:</label>
        <textarea name="eligibility_criteria" required><%= eligibility %></textarea><br>

        <label>Benefits:</label>
        <textarea name="benefits" required><%= benefits %></textarea><br>

        <label>Application Process:</label>
        <textarea name="application_process" required><%= applicationProcess %></textarea><br>

        <input type="submit" value="Update Scheme">
    </form>
</body>
</html>

<%
        } else {
            out.println("<h3>No Scheme Found</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (resultSet != null) resultSet.close(); } catch (Exception e) {}
        try { if (statement != null) statement.close(); } catch (Exception e) {}
        try { if (connection != null) connection.close(); } catch (Exception e) {}
    }
%>
