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

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 PrintWriter out = response.getWriter();
        String date = request.getParameter("date");
        String name = request.getParameter("name");
        String mobile = request.getParameter("mno");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String location = request.getParameter("location");
        String complaintDetails = request.getParameter("complaintdetails");
        String outcome = request.getParameter("Outcome");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

            // Insert query
            String query = "INSERT INTO complaints (date_of_complaint, name, mobile, email, address, incident_location, complaint_details, desired_outcome) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, date);
            ps.setString(2, name);
            ps.setString(3, mobile);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, location);
            ps.setString(7, complaintDetails);
            ps.setString(8, outcome);

            int i = ps.executeUpdate();
            if (i > 0)
            {
            	out.println("<script>alert('Complaint Added successful!');window.location='Complaint.html';</script>"); 
            } 
        else {
            	out.println("<script>alert('Error! to add Complaint');window.location='Complaint.html';</script>"); 
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
