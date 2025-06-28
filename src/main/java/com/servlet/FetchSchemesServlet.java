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
import javax.servlet.http.HttpSession;
@WebServlet("/FetchSchemesServlet")
public class FetchSchemesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        
        String jdbcURL = "jdbc:mysql://localhost:3306/smart_grampanchayat";
        String dbUser = "root";
        String dbPassword = "7709648063";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                 PreparedStatement ps = con.prepareStatement("SELECT * FROM schemes");
                 ResultSet rs = ps.executeQuery()) {
                
                StringBuilder schemesData = new StringBuilder();
                while (rs.next()) {
                    schemesData.append("<tr>");
                    schemesData.append("<td>").append(rs.getString("scheme_name")).append("</td>");
                    schemesData.append("<td>").append(rs.getString("description")).append("</td>");
                    schemesData.append("<td>").append(rs.getString("eligibility_criteria")).append("</td>");
                    schemesData.append("<td>").append(rs.getString("benefits")).append("</td>");
                    schemesData.append("<td>").append(rs.getString("application_process")).append("</td>");
                    schemesData.append("<td>").append(rs.getString("last_date_to_apply")).append("</td>");
                    schemesData.append("</tr>");
                }

                session.setAttribute("schemesData", schemesData.toString());
                response.sendRedirect("myschemes.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
