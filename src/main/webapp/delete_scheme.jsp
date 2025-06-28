<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Get the ID from request
        int id = Integer.parseInt(request.getParameter("id"));

        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

        // Delete Query
        String query = "DELETE FROM Scheme_Registration WHERE id=?";
        ps = con.prepareStatement(query);
        ps.setInt(1, id);

        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            response.sendRedirect("AdminDashboard.jsp?msg=deleted"); // Redirect with success message
        } else {
            response.sendRedirect("AdminDashboard.jsp?msg=error"); // Redirect with error message
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("AdminDashboard.jsp?msg=error"); // Redirect on exception
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
