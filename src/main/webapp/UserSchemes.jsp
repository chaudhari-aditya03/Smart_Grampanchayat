<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Registered Schemes</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        header, footer {
            background-color: #FFD700;
            text-align: center;
            font-size: 35px;
            font-weight: bold;
            padding: 20px;
            color: #333;
            width: 100%;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
            padding: 15px 0;
            width: 100%;
        }
        nav ul {
            list-style: none;
            display: flex;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            margin: 0 20px;
        }
        nav ul li a {
            text-decoration: none;
            color: white;
            padding: 12px 20px;
            font-size: 18px;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
        }
        nav ul li a:hover {
            background-color: #FFD700;
            color: black;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            color: white;
            border-radius: 3px;
        }
        .edit-btn {
            background-color: #28a745;
        }
        .delete-btn {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<header>Smart Grampanchayat</header>

<nav>
  <ul>
    <li><a href="Dashboard.jsp">Dashboard</a></li>
    <li><a href="Schemeregistration.jsp">Apply for Schemes</a></li>
    <li><a href="Complaint.html">Complaint Box</a></li>
     <li><a href="Documents.jsp">Documents</a></li>
  </ul>
</nav>

<div class="container">
    <h2>My Registered Schemes</h2>
    <table>
        <tr>
            <th>Scheme Name</th>
            <th>Registration Date</th>
            <th>Actions</th>
        </tr>

        <% 
            String userEmail = (String) session.getAttribute("userEmail");

            if (userEmail != null) {
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

                    String query = "SELECT sr.id, s.scheme_name, sr.reg_date FROM Scheme_Registration sr " +
                                   "JOIN Schemes s ON sr.scheme_id = s.scheme_id " +
                                   "WHERE sr.email = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, userEmail);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String schemeName = rs.getString("scheme_name");
                        String regDate = rs.getString("reg_date");
        %>

        <tr>
            <td><%= schemeName %></td>
            <td><%= regDate %></td>
            <td>
                <a href="EditScheme.jsp?id=<%= id %>" class="btn edit-btn">Edit</a>
                <a href="DeleteSchemeServlet?id=<%= id %>" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete?');">Delete</a>
            </td>
        </tr>

        <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            } else {
        %>
        <tr>
            <td colspan="3" style="color: red; text-align: center;">You are not logged in. Please log in to view your registered schemes.</td>
        </tr>
        <% } %>
    </table>
</div>

<footer class="footer" style="background-color:#ffcc00;">
  <div class="footer-container">
    <div class="footer-address">
      <h3 style="color:black;">Grampanchayat Office</h3>
      <p style="color:black;"><i class="fas fa-map-marker-alt"></i> Kankapur, Sangamner, Aahilyanagar, Maharashtra, India.</p>
      <p style="color:black;"><i class="fas fa-phone-alt"></i> STD Code: +91-2425</p>
    </div>

    <div class="footer-map">
      <h3 style="color:black;">Find Us on the Map</h3>
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

  <div class="footer-bottom">
    <p style="color:black;">Grampanchayat Department. All rights reserved.<br>
    Designed and Developed by Future Developers Team</p>
  </div>
</footer>

</body>
</html>
