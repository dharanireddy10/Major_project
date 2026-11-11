<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.DB.Database" %>

<%
/* ================== LOGOUT HANDLING ================== */
if ("true".equals(request.getParameter("logout"))) {
    session.invalidate();
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pending Owner Applications</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== Global Styles ================== */
body {
    margin: 0;
    padding: 110px 0 0 0;
    font-family: 'Poppins', sans-serif;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
}

/* ================== Header Wrapper ================== */
.header-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    display: flex;
    flex-direction: column;
}

.page-title {
    width: 100%;
    text-align: center;
    font-size: 20px;
    
    top: 0;
    left: 20px;
    font-weight: 600;
    padding: 12px 0;
    color: #fff;
    background: rgba(0,0,0,0.7);
}

.header-bar {
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(10px);
}

.nav-title {
    font-size: 18px;
    font-weight: 700;
    color: #fff;
}

/* Top Navigation */
.top-nav {
	width: 65%;
    height: 55px;
    display: flex;
    gap: 15px;
    align-items: center;
}

.top-nav a,
.logout-btn {
    text-decoration: none;
    padding: 8px 15px;
    background: rgba(255,255,255,0.2);
    color: #fff;
    font-weight: 600;
    border-radius: 6px;
    border: 1px solid rgba(255,255,255,0.4);
    transition: 0.3s;
    cursor: pointer;
}

.top-nav a:hover,
.logout-btn:hover {
    background: rgba(255,255,255,0.4);
    transform: scale(1.05);
}

/* Logout Button */
.logout-btn {
    background: linear-gradient(45deg, #e74c3c, #c0392b);
    border: none;
}

.logout-btn:hover {
    box-shadow: 0 0 12px rgba(231, 76, 60, 0.9);
}

/* ================== Container ================== */
.container {
    width: 90%;
    max-width: 1200px;
    background: rgba(255,255,255,0.1);
    padding: 30px;
    border-radius: 15px;
    color: #fff;
    margin: 20px auto 50px auto;
    text-align: center;
}

/* ================== Table ================== */
table {
    width: 100%;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
    border-bottom: 1px solid rgba(255,255,255,0.3);
}
th {
    background: rgba(255,255,255,0.3);
}
tr:hover td {
    background: rgba(255,255,255,0.15);
}

/* ================== Buttons ================== */
button {
    padding: 8px 15px;
    border-radius: 8px;
    border: none;
    font-weight: 600;
    cursor: pointer;
    color: #fff;
}
.approve { background: #2ecc71; }
.reject  { background: #e74c3c; }

/* Footer */
.footer {
    margin-top: 20px;
    text-align: center;
    color: #fff;
}
</style>

<script>
let currentForm = null;

function confirmAction(form, type) {
    currentForm = form;
    if(confirm("Are you sure you want to " + type + " this Owner application?")){
        form.submit();
    }
}
</script>
</head>

<body>

<!-- ================== HEADER ================== -->
<div class="header-wrapper">
    <div class="page-title">
        SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS
    </div>

    <div class="header-bar">
        <div class="nav-title">👑 Admin Panel</div>

        <div class="top-nav">
            <a href="approve.jsp">Home</a>
            <a href="adminownerapprove.jsp">Approve Owner</a>
            <a href="adminuserapprove.jsp">Approve User</a>
            <a href="adminsearchrequests.jsp">Pending Requests</a>
            <a href="AdminOwnerDataServlet">Owner Data</a>
            <a href="AdminUserDataServlet">User Data</a>

            <!-- LOGOUT (JSP ITSELF) -->
            <form method="post" style="margin:0;">
                <input type="hidden" name="logout" value="true">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>
    </div>
</div>

<!-- ================== MAIN CONTENT ================== -->
<div class="container">
<h2>☁️ Pending Owner Applications</h2>

<table>
<thead>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Gender</th>
    <th>Address</th>
    <th>Action</th>
</tr>
</thead>
<tbody>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = Database.getConnection();
    ps = con.prepareStatement("SELECT * FROM ownerdetails WHERE status='PENDING'");
    rs = ps.executeQuery();

    while(rs.next()){
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("mobileno") %></td>
    <td><%= rs.getString("gender") %></td>
    <td><%= rs.getString("address") %></td>
    <td>
        <form action="AdminownerApprove" method="post" style="display:inline;"
              onsubmit="event.preventDefault(); confirmAction(this,'approve');">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <input type="hidden" name="action" value="approve">
            <button class="approve">Approve</button>
        </form>

        <form action="AdminownerApprove" method="post" style="display:inline;"
              onsubmit="event.preventDefault(); confirmAction(this,'reject');">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <input type="hidden" name="action" value="reject">
            <button class="reject">Reject</button>
        </form>
    </td>
</tr>
<%
    }
} catch(Exception e){
    out.println("<tr><td colspan='7'>"+e.getMessage()+"</td></tr>");
} finally {
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

</tbody>
</table>
</div>

<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
