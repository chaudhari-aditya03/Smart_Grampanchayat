<!DOCTYPE html>
<html lang="en">
<head>
  <title>Schemes for Me</title>
  <link rel="stylesheet" href="css/myscheme.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <Style>
  /* Container Styling */
.container {
    width: 90%;
    margin: 20px auto;
    overflow-x: auto;
}

/* Table Styling */
.table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
}

/* Table Header */
.table thead {
    background-color: #ffcc00;
    color: black;
}

.table th {
    padding: 15px;
    text-align: left;
    font-size: 16px;
    border-bottom: 2px solid #ddd;
}

/* Table Rows */
.table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

/* Alternate Row Colors */
.table tbody tr:nth-child(odd) {
    background-color: #f9f9f9;
}

/* Hover Effect */
.table tbody tr:hover {
    background-color: #f1f1f1;
    transition: 0.3s;
}

/* Responsive Table */
@media (max-width: 768px) {
    .table th, .table td {
        padding: 10px;
        font-size: 14px;
    }
}
  
  </Style>
</head>
<body>
<header>SCHEMES</header>
<nav>
  <ul>
    <li><a href="home.html">Home</a></li>
    <li><a href="Documents.jsp">Documents</a></li>
    <li><a href="mygallery.html">Gallery</a></li>
    <li><a href="Member_info.html">Member_Info</a></li>
    <li><a href="Login.html" class="user-login">User Login</a></li>
  </ul>
</nav>

<h1 style="text-align: center; color: #333;">Schemes Under Grampanchayat</h1>

<div class="container">
  <table class="table">
    <thead>
        <tr>
            <th>Scheme Name</th>
            <th>Description</th>
            <th>Eligibility</th>
            <th>Benefits</th>
            <th>Application Process</th>
            <th>Last Date</th>
        </tr>
    </thead>
    <tbody>
        <%= session.getAttribute("schemesData") %>
    </tbody>
  </table>
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

<script>
  document.querySelectorAll(".accordion").forEach((accordion) => {
    accordion.addEventListener("click", function () {
      this.classList.toggle("active");
      let panel = this.nextElementSibling;
      panel.style.display = panel.style.display === "block" ? "none" : "block";
    });
  });
</script>

</body>
</html>
