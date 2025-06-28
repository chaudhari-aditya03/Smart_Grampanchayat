package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComplaintActionServlet")
public class ComplaintActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

            if ("approve".equals(action)) {

            	if ("approve".equals(action)) {
                    String query = "UPDATE complaints SET status = ? WHERE id = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, "Approved");
                    ps.setInt(2, id);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<script>alert('Complaint Approved!');window.location='AdminDashboard.jsp';</script>");
                    } else {
                        out.println("<script>alert('Error: Complaint not updated!');window.location='AdminDashboard.jsp';</script>");
                    }
            } 
            else if ("delete".equals(action)) {
                String query = "DELETE FROM complaints WHERE id = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, id);
                ps.executeUpdate();
                out.println("<script>alert('Complaint Deleted!');window.location='AdminDashboard.jsp';</script>");
            }
            }
            }
            catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
