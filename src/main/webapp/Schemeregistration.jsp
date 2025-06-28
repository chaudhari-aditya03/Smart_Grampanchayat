<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/smart_Grampanchayat";
    String user = "root"; 
    String pass = "7709648063";    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM Schemes");
%>
<!DOCTYPE html>
<html lang="en-us">
<head>
    <meta charset="UTF-8">
    <title>Scheme Registration Form</title>
    <link rel="stylesheet" href="css/SchemeReg.css">
</head>
<body>
    <header class="header">
        E-GRAMPANCHAYAT<br>
        <span class="village-name"> Kankapur </span><br>
        <span class="location">Tal-Sangamner | Dist-Aahilyanagar</span>
    </header>
    
    
    <nav>
        <ul>
            <li><a href="Dashboard.jsp">Dashboard</a></li>
            <li><a href="Documents.jsp">Documents</a></li>
            <li><a href="Complaint.html">Complaint Box</a></li>
        </ul>
    </nav>
    
    <div class="container">
        <h1>Apply for a Scheme</h1>
       <form action="SchemeRegisterServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" required></textarea>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required>
            </div>
            <div class="form-group">
                <label for="Scheme">Select Scheme:</label>
                <select id="Scheme" name="Scheme">
			    <option value="">Select Scheme</option>
			    <% while (rs.next()) { %>
			        <option value="<%= rs.getInt("scheme_id") %>"><%= rs.getString("scheme_name") %></option>
			    <% } %>
			</select>
            </div>
            <input type="submit" class="btn" value="Apply Now">
        </form>
    </div>

<footer class="footer" style="background-color:#ffcc00;">
  <div class="footer-container">
    <!-- Address Section -->
    <div class="footer-address">
      <h3  style="color:black;">Grampanchayat Office</h3>
      <p  style="color:black;"><i class="fas fa-map-marker-alt"></i> Kankapur, Sangamner, Aahilyanagar, Maharashtra, India.</p>
      <p  style="color:black;"><i class="fas fa-phone-alt"></i> STD Code: +91-2425</p>
    </div>

    <!-- Map Section -->
    <div class="footer-map">
      <h3  style="color:black;">Find Us on the Map</h3>
      <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1dXYZ!2dLongitude!3dLatitude!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xXXXXXXXXX!2sKankapur%2C+Maharashtra!5e0!3m2!1sen!2sin!4vXXXXXXXXXXXX"
        width="100%"
        height="200"
        style="border:0;"
        allowfullscreen=""
        loading="lazy">
      </iframe>
    </div>
  </div>

  <!-- Copyright -->
  <div class="footer-bottom">
    <p  style="color:black;"> Grampanchayat Department. All rights reserved.<br>
    Design and Developed by Future Developers Team</p>
  </div>
</footer>
<%
    rs.close();
    stmt.close();
    con.close();
%>

</body>
</html>
