<!DOCTYPE html>
<html lang="en">
<head>
  <title>E-Grampanchayat Chatbot</title>
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
      max-width: 600px;
      margin: auto;
      padding: 20px;
      text-align: center;
    }
    .chatbot-box {
      background: white;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      text-align: left;
    }
    .chatbox {
      width: 100%;
      height: 300px;
      overflow-y: auto;
      border: 1px solid #ddd;
      padding: 10px;
      background: #fff;
      display: flex;
      flex-direction: column;
    }
    .input-group {
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <header>E-Grampanchayat Chatbot</header>
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
    <h2>Chat with E-Grampanchayat AI</h2>
    <div class="chatbot-box">
      <div class="chatbox" id="chatbox"></div>
      <div class="input-group">
        <input type="text" id="userInput" class="form-control" placeholder="Type your message...">
        <button onclick="sendMessage()" class="btn btn-warning">Send</button>
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
    function sendMessage() {
      let inputField = document.getElementById("userInput");
      let chatbox = document.getElementById("chatbox");
      let userMessage = inputField.value.trim();
      
      if (userMessage === "") return;
      
      let userMessageHtml = `<div style="margin: 5px; padding: 8px; background-color: #FFD700; border-radius: 5px;"><strong>You:</strong> ${userMessage}</div>`;
      chatbox.innerHTML += userMessageHtml;
      
      inputField.value = "";
      
      setTimeout(() => {
        let botResponse = getBotResponse(userMessage);
        let botMessageHtml = `<div style="margin: 5px; padding: 8px; background-color: #ddd; border-radius: 5px;"><strong>Bot:</strong> ${botResponse}</div>`;
        chatbox.innerHTML += botMessageHtml;
        
        chatbox.scrollTop = chatbox.scrollHeight;
      }, 1000);
    }
    
    function getBotResponse(input) {
      input = input.toLowerCase();
      
      if (input.includes("hello") || input.includes("hi")) {
        return "Hello! How can I assist you with Grampanchayat services?";
      } else if (input.includes("schemes")) {
        return "You can find various government schemes under the 'Schemes' section.";
      } else if (input.includes("complaint")) {
        return "To file a complaint, go to the 'Complaint' section on our website.";
      } else if (input.includes("emergency")) {
        return "For emergency services, check the 'Emergency Services' page.";
      } else {
        return "I'm sorry, I didn't understand. Please ask about Grampanchayat services.";
      }
    }
  </script>
</body>
</html>
