<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("Username") == null) {
        response.sendRedirect("Login.html"); // Redirect if not logged in
    }
    String name = (String) session1.getAttribute("Username");
    String Phone = (String) session1.getAttribute("Phone");
    String email = (String) session1.getAttribute("email");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Dashboard - E-Grampanchayat</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/Home.css">
   <link rel="stylesheet" href="css/Dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

<header class="header">
  SMART GRAMPANCHAYAT
  <br>
  <span class="village-name">Kankapur</span><br>
  <span class="location">Tal-Sangamner | Dist-Aahilyanagar</span><br>
  <span class="user-details">
    Welcome, <span ><%= name %></span> | Phone: <span> +91 <%= Phone %> </span> | Email: <span> <%= email %></span>
</span>
  
</header>

<!-- Navbar with Logout Button -->
<nav>
  <ul>
    <li><a href="Dashboard.jsp">Dashboard</a></li>
    <li><a href="Schemeregistration.jsp">Apply for Schemes</a></li>
    <li><a href="Complaint.html">Complaint Box</a></li>
     <li><a href="Documents.jsp">Documents</a></li>
    <li><a href="#" class="logout-btn" onclick="logout()">Logout</a></li>
  </ul>
</nav>

<section class="dashboard-container">
  <div class="card">
    <h3>Upcoming Events</h3>
  <button><a href="Events.html">View Events</a></button>  
  </div>

  <div class="card">
    <h3>Registered Schemes</h3>
      <button><a href="UserSchemes.jsp">View Registered Schemes</a></button>  
  </div>

  <div class="card">
    <h3>Pending Complaints</h3>
    <button><a href="#">Check Status</button>  
  </div>
</section>


<section class="news-section">
  <h3>Latest News</h3>
  <div class="news-container">
    <div class="news-item">News 1: Community updates...</div>
    <div class="news-item">News 2: Events and announcements...</div>
    <div class="news-item">News 3: New development projects...</div>
    <div class="news-item">News 4: Infrastructure improvements...</div>
  </div>
</section>
<footer class="footer" style="background-color:#ffcc00;">
  <div class="footer-container">

    <div class="footer-address">
      <h3  style="color:black;">Grampanchayat Office</h3>
      <p  style="color:black;"><i class="fas fa-map-marker-alt"></i> Kankapur, Sangamner, Aahilyanagar, Maharashtra, India.</p>
      <p  style="color:black;"><i class="fas fa-phone-alt"></i> STD Code: +91-2425</p>
    </div>

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

<script>
  function logout() {
    alert("Logging Out...");
    window.location.href = "Login.html";
  }

  
</script>

</body>
</html>
