package com.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddSchemeServlet")
public class AddSchemeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String eligibility = request.getParameter("eligibility");
        String benefits = request.getParameter("benefits");
        String applicationProcess = request.getParameter("applicationProcess");
        String lastDateToApply = request.getParameter("lastDateToApply");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");
            String query = "INSERT INTO schemes (scheme_name, description, eligibility_criteria, benefits, application_process, last_date_to_apply) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, eligibility);
            ps.setString(4, benefits);
            ps.setString(5, applicationProcess);
            ps.setString(6, lastDateToApply);
            ps.executeUpdate();
            con.close();
            response.getWriter().write("Success");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error");
        }
    }
}
