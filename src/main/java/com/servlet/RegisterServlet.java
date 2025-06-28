package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String address = request.getParameter("address");
        String village_name = request.getParameter("village_name");
        String pincode = request.getParameter("pincode");
        
        // Password validation
        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match!');window.location='register.html';</script>");
            return;
        }
        
        String hashedPassword = hashPassword(password);
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Smart_Grampanchayat", "root", "7709648063");
            String sql = "INSERT INTO User (name, email, password, phone_number, address, village_name, pincode) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setString(6, village_name);
            stmt.setString(7, pincode);
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                out.println("<script>alert('Registration successful!');window.location='Login.html';</script>");
            } else {
                out.println("<script>alert('Registration failed! Please try again.');window.location='Login.html';</script>");
            }
            conn.close();
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');window.location='Login.html';</script>");
        }
    }
   
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
