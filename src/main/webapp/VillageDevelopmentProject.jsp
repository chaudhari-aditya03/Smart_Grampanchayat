<!DOCTYPE html>
<html lang="en">
<head>
  <title>Village Development Projects</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
    }
    header, footer {
      background-color: #FFD700;
      color: black;
      text-align: center;
      padding: 15px;
      font-size: 26px;
      font-weight: bold;
    }
    nav {
      background-color: #333;
      padding: 10px 0;
    }
    nav ul {
      list-style: none;
      margin: 0;
      padding: 0;
      text-align: center;
    }
    nav ul li {
      display: inline;
      margin: 0 15px;
    }
    nav ul li a {
      color: white;
      text-decoration: none;
      font-size: 18px;
      padding: 8px 12px;
      transition: 0.3s;
    }
    nav ul li a:hover {
      background-color: #FFD700;
      border-radius: 5px;
      color: black;
    }
    .container {
      max-width: 800px;
      margin: auto;
      padding: 20px;
      text-align: center;
    }
    .project-box {
      background: white;
      padding: 15px;
      border-radius: 5px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin-bottom: 15px;
      text-align: left;
    }
    .details {
      display: none;
      margin-top: 10px;
      padding: 10px;
      background: #eee;
      border-radius: 5px;
    }
    .details img {
      width: 100%;
      max-height: 200px;
      border-radius: 5px;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <header>Village Development Projects</header>
  <nav>
    <ul>
    <li><a href="home.html">Home</a></li>
    <li><a href="myschemes.html">Schemes</a></li>
      <li><a href="mygallery.html">Gallery</a></li>
    <li><a href="Documents.jsp">Documents</a></li>
      <li><a href="Member_info.html">Member Info</a></li>
    <li><a href="Contact_us.jsp">Contact Us</a></li>
    <li><a href="Login.html" class="user-login">User Login</a></li>
    </ul>
  </nav>
  <div class="container">
    <h2>Ongoing Village Development Projects</h2>
    <div class="project-box">
      <h4>Water Conservation Initiative</h4>
      <button onclick="toggleDetails('project1')" class="btn btn-warning">View Details</button>
      <div id="project1" class="details">
        <p>Implementation of rainwater harvesting and borewell recharge systems.</p>
        <img src="img/well.jpeg" alt="Water Conservation Initiative">
      </div>
    </div>
    <div class="project-box">
      <h4>Road Infrastructure Enhancement</h4>
      <button onclick="toggleDetails('project2')" class="btn btn-warning">View Details</button>
      <div id="project2" class="details">
        <p>Upgrading village roads with better materials and lighting for safety.</p>
        <img src="img/road.jpeg" alt="Road Infrastructure Enhancement">
      </div>
    </div>
    <div class="project-box">
      <h4>Solar Energy for Public Buildings</h4>
      <button onclick="toggleDetails('project3')" class="btn btn-warning">View Details</button>
      <div id="project3" class="details">
        <p>Installing solar panels on Gram Panchayat buildings to promote renewable energy.</p>
        <img src="img/solar.jpeg" alt="Solar Energy for Public Buildings">
      </div>
    </div>
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
    function toggleDetails(id) {
      let details = document.getElementById(id);
      if (details.style.display === "none" || details.style.display === "") {
        details.style.display = "block";
      } else {
        details.style.display = "none";
      }
    }
  </script>
</body>
</html>
