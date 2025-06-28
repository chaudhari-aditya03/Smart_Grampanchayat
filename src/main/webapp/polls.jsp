<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Grampanchayat - Polls & Survey</title>
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
            background: white;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .poll, form {
            text-align: left;
            margin-top: 20px;
        }
        form button {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <header>
        Smart Grampanchayat
    </header>
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
        <h2>Community Polls</h2>
        <div class="poll">
            <p>What should be the priority for village development?</p>
            <form>
                <input type="radio" name="poll1" value="roads"> Better Roads<br>
                <input type="radio" name="poll1" value="water"> Water Supply Improvement<br>
                <input type="radio" name="poll1" value="education"> Education & Schools<br>
                <input type="radio" name="poll1" value="health"> Healthcare Facilities<br>
                <button type="submit" class="btn btn-warning">Vote</button>
            </form>
        </div>
    </div>
    
    <div class="container mt-4">
        <h2>Community Survey</h2>
        <form>
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">How satisfied are you with the current village facilities?</label>
                <select name="satisfaction" class="form-select" required>
                    <option value="very_satisfied">Very Satisfied</option>
                    <option value="satisfied">Satisfied</option>
                    <option value="neutral">Neutral</option>
                    <option value="dissatisfied">Dissatisfied</option>
                    <option value="very_dissatisfied">Very Dissatisfied</option>
                </select>
            </div>
            
            <div class="mb-3">
                <label for="suggestions" class="form-label">Your Suggestions:</label>
                <textarea id="suggestions" name="suggestions" rows="4" class="form-control"></textarea>
            </div>
            
            <button type="submit" class="btn btn-success">Submit</button>
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
</body>
</html>
