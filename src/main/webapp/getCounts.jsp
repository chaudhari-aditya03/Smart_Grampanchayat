<%@ page import="java.sql.*" %>
<%@ page contentType="application/json" %>
<%
    String jdbcURL = "jdbc:mysql://localhost:3306/smart_grampanchayat";
    String jdbcUsername = "root";
    String jdbcPassword = "7709648063";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    int schemeCount = 0, complaintCount = 0, userCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        statement = connection.createStatement();

        resultSet = statement.executeQuery("SELECT COUNT(*) AS total FROM schemes");
        if (resultSet.next()) {
            schemeCount = resultSet.getInt("total");
        }

        resultSet = statement.executeQuery("SELECT COUNT(*) AS total FROM complaint_box");
        if (resultSet.next()) {
            complaintCount = resultSet.getInt("total");
        }

        resultSet = statement.executeQuery("SELECT COUNT(*) AS total FROM user");
        if (resultSet.next()) {
            userCount = resultSet.getInt("total");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Manually format JSON response
    out.print("{\"schemeCount\": " + schemeCount + ", \"complaintCount\": " + complaintCount + ", \"userCount\": " + userCount + "}");
    out.flush();
%>
