<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Complaints</title>
    <style>
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
<body>
    <h2>Complaint List</h2>
    <table>
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
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (ps != null) ps.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        %>
    </table>
</body>
</html>
