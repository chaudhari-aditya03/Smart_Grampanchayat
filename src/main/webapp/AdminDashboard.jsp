<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="css/admindash.css">
      <style>
      .container1{
      background: white;
      border-radius: 8px;
      margin-left: 270px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      transition: transform 0.3s ease-in-out;
      display: none;
      }
      .container1:hover
      {
            transform: scale(1.02);
      }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .approve-btn {
            background-color: green;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        .delete-btn {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body  >
<header>Admin Dashboard</header>
<div class="sidenav">
  <a href="#" onclick="showSection('dashboard')">Dashboard</a>
  <a href="#" onclick="showSection('schemes')">Schemes</a>
    <a href="#" onclick="showSection('register')"> Registra Scheme Details</a>
    <a href="#" onclick="showSection('users')">User Details</a>
      <a href="#" onclick="showSection('complaints')">Complaints</a>
  <a href="home.html">Log Out</a>
</div>
<div class="main-content">
  <div id="dashboard" class="container">
    <h2>Admin Dashboard</h2>
    <p>Manage schemes, complaints, and user details efficiently.</p>
    <div class="dashboard-cards">
      <div class="card">Total Schemes: <span id="schemeCount">0</span></div>
      <div class="card">Total Complaints: <span id="complaintCount">0</span></div>
      <div class="card">Registered Users: <span id="userCount">0</span></div>
    </div>
  </div>
  
  <div id="schemes" class="container" style="display: none;">
    <h3>Manage Schemes</h3>
    <form id="schemeForm">
      <input type="text" id="schemeName" class="form-control mb-2" placeholder="Scheme Name" required>
      <textarea id="schemeDescription" class="form-control mb-2" placeholder="Scheme Description" required></textarea>
      <textarea id="eligibilityCriteria" class="form-control mb-2" placeholder="Eligibility Criteria" required></textarea>
      <textarea id="benefits" class="form-control mb-2" placeholder="Benefits" required></textarea>
      <textarea id="applicationProcess" class="form-control mb-2" placeholder="Application Process" required></textarea>
      <input type="date" id="lastDateToApply" class="form-control mb-2" required>
      <button type="submit" class="btn btn-success w-100">Add Scheme</button>
    </form>
<%@ page import="java.sql.*, javax.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    // JDBC Setup
    String jdbcURL = "jdbc:mysql://localhost:3306/smart_grampanchayat";
    String jdbcUsername = "root";
    String jdbcPassword = "7709648063";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    try { Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        statement = connection.createStatement();
        // Query to fetch all schemes
        String sql = "SELECT * FROM schemes";
        resultSet = statement.executeQuery(sql);
      %>
      <table >
       <thead >
        <tr>
            <th>Scheme Name</th>
            <th>Description</th>
            <th>Eligibility</th>
            <th>Benefits</th>
            <th>Application Process</th>
            <th>Last Date</th>
                     <th>Action</th>
        </tr>
    </thead>
     <tbody >
        <%
            while (resultSet.next()) {
                int schemeId = resultSet.getInt("scheme_id");
                String schemeName = resultSet.getString("scheme_name");
                String description = resultSet.getString("description");
                String eligibility = resultSet.getString("eligibility_criteria");
                String benefits = resultSet.getString("benefits");
                String applicationProcess = resultSet.getString("application_process");
                String lastDate = resultSet.getString("last_date_to_apply");
        %>
        <tr>
            <td><%= schemeName %></td>
            <td><%= description %></td>
            <td><%= eligibility %></td>
            <td><%= benefits %></td>
            <td><%= applicationProcess %></td>
            <td><%= lastDate %></td>
            <td>
                <a href="editScheme.jsp?scheme_id=<%= schemeId %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="deleteScheme.jsp?scheme_id=<%= schemeId %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this scheme?');">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
      </tbody>
    </table>
  </div>
      <% } catch (Exception e) {
        e.printStackTrace();
        } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<%
	try {
        // Establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        statement = connection.createStatement();
        
        // Query to fetch all users
        String sql = "SELECT * FROM user";
        resultSet = statement.executeQuery(sql);
  %> 
  
<div id="register" class="container" style="display: none;">
    <h2>Registered Scheme Details</h2>
      <table class="table table-striped mt-4" style="padding-left:100px;">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>City</th>
            <th>Scheme Name</th>
            <th>Action</th>
        </tr>
        <% 
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

                String query = "SELECT sr.id, sr.full_name, sr.email, sr.mobile, sr.dob, sr.address, sr.city, s.scheme_name " +
                               "FROM Scheme_Registration sr " +
                               "JOIN Schemes s ON sr.scheme_id = s.scheme_id";
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();

                // Loop through results and display them
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getDate("dob") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("city") %></td>
            <td><%= rs.getString("scheme_name") %></td>
            <td>
              <form action="delete_scheme.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this record?');">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
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
        %>
    </table>
</div>
    
    
    
  <div id="users" class="container" style="display: none;">
    <h3>Manage Users</h3>
    <table class="table table-striped mt-4">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Address</th>
          <th>Village</th>
          <th>Pincode</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
            while (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String villageName = resultSet.getString("village_name");
                String pincode = resultSet.getString("pincode");
        %>
        <tr>
            <td><%= userId %></td>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><%= phoneNumber %></td>
            <td><%= address %></td>
            <td><%= villageName %></td>
            <td><%= pincode %></td>
            <td>
               
                <a href="deleteUser.jsp?user_id=<%= userId %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
      </tbody>
    </table>
  </div>
</div>
  
  <%} catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close all resources
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>


 
        
<div id="complaints" class="container1" style="display: none;">
<h3 >Manage Complaints</h3>
    <table >
      <thead>
        <tr>
          <th>ID</th>
            <th>Date</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Address</th>
            <th>Location</th>
            <th>Details</th>
            <th>Outcome</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
         <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_grampanchayat", "root", "7709648063");

                String query = "SELECT * FROM complaints";
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("date_of_complaint") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("incident_location") %></td>
            <td><%= rs.getString("complaint_details") %></td>
            <td><%= rs.getString("desired_outcome") %></td>
            <td>
                <form action="ComplaintActionServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <button type="submit" name="action" value="approve" class="approve-btn">Approve</button>
                </form>
                <form action="ComplaintActionServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <button type="submit" name="action" value="delete" class="delete-btn">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
      </tbody>
    </table>
  </div>
<%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (ps != null) ps.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        %>

  
<script>
$(document).ready(function () {
    $("#schemeForm").submit(function (event) {
        event.preventDefault();

        let formData = {
            name: $("#schemeName").val().trim(),
            description: $("#schemeDescription").val().trim(),
            eligibility: $("#eligibilityCriteria").val().trim(),
            benefits: $("#benefits").val().trim(),
            applicationProcess: $("#applicationProcess").val().trim(),
            lastDateToApply: $("#lastDateToApply").val().trim()
        };

        $.post("AddSchemeServlet", formData, function (response)
        		{
            if (response.trim() === "success") {
                alert("Scheme added successfully!");
                $("#schemeForm")[0].reset();
                fetchSchemes();
            }
        }).fail(function () {
            alert("Failed to add scheme. Please try again.");
        });
    });
});

function showSection(section) {
    $(".container").hide();
    $("#" + section).fadeIn();
}
$(document).ready(function () {
    fetchCounts();

    function fetchCounts() {
        $.get("getCounts.jsp", function (data) {
            $("#schemeCount").text(data.schemeCount);
            $("#complaintCount").text(data.complaintCount);
            $("#userCount").text(data.userCount);
        }).fail(function () {
            alert("Failed to fetch counts.");
        });
    }
});

</script>

</body>
</html>
