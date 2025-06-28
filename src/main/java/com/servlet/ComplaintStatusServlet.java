package com.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/ComplaintStatusServlet")
public class ComplaintStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mobile = request.getParameter("mno");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

            // Fetch complaint status
            String query = "SELECT id, date_of_complaint, complaint_details, status FROM complaints WHERE mobile = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, mobile);
            rs = ps.executeQuery();

            out.println("<html><body><h2>Complaint Status</h2>");
            if (rs.next()) {
                out.println("<p><b>Complaint ID:</b> " + rs.getInt("id") + "</p>");
                out.println("<p><b>Date:</b> " + rs.getDate("date_of_complaint") + "</p>");
                out.println("<p><b>Details:</b> " + rs.getString("complaint_details") + "</p>");
                out.println("<p><b>Status:</b> " + rs.getString("status") + "</p>");
            } else {
                out.println("<p>No complaints found for this mobile number.</p>");
            }
            out.println("</body></html>");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
