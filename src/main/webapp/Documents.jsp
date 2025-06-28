<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Government Schemes - Required Documents</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: gold;
            color: black;
            text-align: center;
            padding: 15px;
            font-size: 20px;
            font-weight: bold;
        }
        .village-name, .location {
            font-size: 16px;
            display: block;
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
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .search-bar {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-bar input {
            width: 60%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .scheme-list {
            list-style: none;
            padding: 0;
        }
        .scheme {
            background: gold;
            color: black;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .scheme:hover {
            background: #d4af37;
        }
        .documents {
            display: none;
            background: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            margin-top: 5px;
        }
        .footer {
            background-color: gold;
            color: black;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header class="header">SMART GRAMPANCHAYAT<br>
        <span class="village-name">Kankapur</span><br>
        <span class="location">Tal-Sangamner | Dist-Aahilyanagar</span>
    </header>
    <nav>
        <ul>
            <li><a href="home.html">Home</a></li>
            <li><a href="myschemes.html">Schemes</a></li>
            <li><a href="mygallery.html">Gallery</a></li>
            <li><a href="Member_info.html">Member Info</a></li>
            <li><a href="Contact_us.jsp">Contact Us</a></li>
          <li><a href="Login.html" class="user-login">User Login</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Documents Required for Government Schemes</h2>
        <div class="search-bar">
            <input type="text" id="search" placeholder="Search schemes...">
        </div>
        <ul class="scheme-list" id="schemeList">
            <li class="scheme" onclick="toggleDocuments(this)">Pradhan Mantri Awas Yojana <i class="fa fa-angle-down"></i>
                <div class="documents">Aadhaar Card, Income Certificate, Address Proof, Ration Card</div>
            </li>
            <li class="scheme" onclick="toggleDocuments(this)">Pradhan Mantri Kisan Samman Nidhi <i class="fa fa-angle-down"></i>
                <div class="documents">Aadhaar Card, Land Ownership Documents, Bank Account Details</div>
            </li>
            <li class="scheme" onclick="toggleDocuments(this)">Sukanya Samriddhi Yojana <i class="fa fa-angle-down"></i>
                <div class="documents">Birth Certificate of Girl Child, Identity Proof of Parents, Address Proof</div>
            </li>
            <li class="scheme" onclick="toggleDocuments(this)">Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA) <i class="fa fa-angle-down"></i>
                <div class="documents">Job Card, Aadhaar Card, Bank Account Details</div>
            </li>
        </ul>
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
        function toggleDocuments(element) {
            let docDiv = element.querySelector('.documents');
            let icon = element.querySelector('i');
            if (docDiv.style.display === "block") {
                docDiv.style.display = "none";
                icon.classList.replace("fa-angle-up", "fa-angle-down");
            } else {
                docDiv.style.display = "block";
                icon.classList.replace("fa-angle-down", "fa-angle-up");
            }
        }

        document.getElementById('search').addEventListener('input', function() {
            let filter = this.value.toLowerCase();
            let schemes = document.querySelectorAll('.scheme');
            schemes.forEach(function(scheme) {
                let text = scheme.textContent.toLowerCase();
                scheme.style.display = text.includes(filter) ? "flex" : "none";
            });
        });
    </script>
</body>
</html>
