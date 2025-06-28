<!DOCTYPE html>
<html lang="en">
<head>
  <title>Emergency Services</title>
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
      max-width: 1000px;
      margin: auto;
      padding: 20px;
    }
    .search-bar {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    .emergency-card {
      background: white;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .emergency-card h3 {
      margin: 0;
    }
    .emergency-card a {
      display: inline-block;
      margin-top: 5px;
      padding: 5px 10px;
      background-color: #FFD700;
      color: black;
      text-decoration: none;
      border-radius: 5px;
      transition: 0.3s;
    }
    .emergency-card a:hover {
      background-color: black;
      color: #FFD700;
    }
  </style>
</head>
<body>
  <header>Emergency Services</header>
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
    <h2>Emergency Contact Information</h2>
    <input type="text" class="search-bar" id="searchBar" placeholder="Search emergency services...">
    <div id="emergencyList">
      <div class="emergency-card"><h3>Police Station</h3><p>Contact: 9270498357</p><a href="tel:1234567890">Call</a> <a href="sms:9270498357">Message</a></div>
      <div class="emergency-card"><h3>Doctor (Local Hospital)</h3><p>Contact: 102</p><a href="tel:102">Call</a> <a href="sms:102">Message</a></div>
      <div class="emergency-card"><h3>Medical Services</h3><p>Contact: 108</p><a href="tel:108">Call</a> <a href="sms:108">Message</a></div>
      <div class="emergency-card"><h3>Ambulance Service</h3><p>Contact: 104</p><a href="tel:104">Call</a> <a href="sms:104">Message</a></div>
      <div class="emergency-card"><h3>Water Supplier</h3><p>Contact: 1234567890</p><a href="tel:1234567890">Call</a> <a href="sms:1234567890">Message</a></div>
      <div class="emergency-card"><h3>Agro Chemist</h3><p>Contact: 0987654321</p><a href="tel:0987654321">Call</a> <a href="sms:0987654321">Message</a></div>
      <div class="emergency-card"><h3>Fire Brigade</h3><p>Contact: 101</p><a href="tel:101">Call</a> <a href="sms:101">Message</a></div>
    </div>
  </div>
  <footer>
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
  </footer>
  <script>
    document.getElementById('searchBar').addEventListener('input', function() {
      let filter = this.value.toLowerCase();
      let cards = document.querySelectorAll('.emergency-card');
      cards.forEach(card => {
        let text = card.textContent.toLowerCase();
        if (text.includes(filter)) {
          card.style.display = "block";
        } else {
          card.style.display = "none";
        }
      });
    });
  </script>
</body>
</html>
