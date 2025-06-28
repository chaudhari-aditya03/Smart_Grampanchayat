<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Scheme</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%
    int schemeId = Integer.parseInt(request.getParameter("id"));
    String schemeName = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

        String query = "SELECT scheme_name FROM registered_schemes WHERE id=?";
        ps = con.prepareStatement(query);
        ps.setInt(1, schemeId);
        rs = ps.executeQuery();

        if (rs.next()) {
            schemeName = rs.getString("scheme_name");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

<form action="UpdateSchemeServlet" method="post">
    <input type="hidden" name="id" value="<%= schemeId %>">
    <label>Scheme Name:</label>
    <input type="text" name="schemeName" value="<%= schemeName %>" required>
    <input type="submit" value="Update">
</form>

</body>
</html>
