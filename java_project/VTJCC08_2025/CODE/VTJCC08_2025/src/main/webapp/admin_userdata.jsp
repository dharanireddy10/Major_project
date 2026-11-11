<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.DB.Database"%>
<%
/* ================= LOGOUT HANDLING ================= */
if ("true".equals(request.getParameter("logout"))) {
    session.invalidate();
    response.sendRedirect("index.jsp");
    return;
}

/* Prevent back button after logout */
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Search History</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
	rel="stylesheet">

<style>
/* ================== Global Styles ================== */
body {
	margin: 0;
	padding: 120px 0 0 0;
	font-family: 'Poppins', sans-serif;
	background: url('images/cloud.jpg') no-repeat center center/cover;
	min-height: 100vh;
}

/* ================== Page Title ================== */
.page-title {
	width: 100%;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	padding: 12px 0;
	color: #fff;
	background: rgba(0, 0, 0, 0.7);
	position: fixed;
	top: 0;
	z-index: 1010;
}

/* ================== Header Bar ================== */
.header-bar {
	width: 100%;
	height: 60px;
	display: flex;
	align-items: center;
	padding: 0 40px;
	background: rgba(0, 0, 0, 0.5);
	backdrop-filter: blur(10px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
	position: fixed;
	top: 40px;
	z-index: 1000;
}

.nav-title {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
}

/* ================== RIGHT SIDE NAV ================== */
.top-nav {
	width: 63%;
	height: 55px;
	display: flex;
	gap: 15px;
	margin-left: auto;
	align-items: center;
}

.top-nav a {
	text-decoration: none;
	padding: 4px 15px;
	background: rgba(255, 255, 255, 0.2);
	color: #fff;
	font-weight: 600;
	border-radius: 6px;
	transition: 0.3s;
}

.top-nav a:hover {
	background: rgba(255, 255, 255, 0.4);
}

/* ================== LOGOUT BUTTON ================== */
.top-nav a, .logout-btn {
	text-decoration: none;
	padding: 8px 15px;
	background: rgba(255, 255, 255, 0.2);
	color: #fff;
	font-weight: 600;
	border-radius: 6px;
	border: 1px solid rgba(255, 255, 255, 0.4);
	transition: 0.3s;
	cursor: pointer;
}

.top-nav a:hover, .logout-btn:hover {
	background: rgba(255, 255, 255, 0.4);
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

/* ================== Main Container ================== */
.container {
	width: 90%;
	max-width: 1400px;
	background: rgba(255, 255, 255, 0.1);
	padding: 30px;
	border-radius: 15px;
	backdrop-filter: blur(10px);
	box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.25);
	color: #fff;
	margin: 20px auto 50px auto;
	text-align: center;
}

h2 {
	font-size: 30px;
	margin-bottom: 30px;
}

/* ================== Table Styling ================== */
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 15px 10px;
	text-align: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

th {
	background: rgba(255, 255, 255, 0.3);
	color: #333;
}

/* ================== Back Button ================== */
.back-btn {
	margin-top: 30px;
}

.back-btn a {
	text-decoration: none;
	color: #fff;
	padding: 12px 25px;
	background: rgba(0, 0, 0, 0.4);
	border-radius: 10px;
}

/* ================== Footer ================== */
.footer {
	margin-top: 18px;
	font-size: 13px;
	color: #fff;
	text-align: center;
}
</style>
</head>

<body>

	<!-- Page Title -->
	<div class="page-title">SECURE KEYWORD SEARCH AND KEY MANAGEMENT
		SCHEME IN CLOUD ENVIRONMENTS</div>

	<!-- Header -->
	<div class="header-bar">
		<div class="nav-title">Admin Panel</div>

		<div class="top-nav">
			<a href="approve.jsp">Home</a> <a href="adminownerapprove.jsp">Approve
				Owner</a> <a href="adminuserapprove.jsp">Approve User</a> <a
				href="adminsearchrequests.jsp">Pending Requests</a> <a
				href="AdminOwnerDataServlet">Owner Data</a> <a
				href="AdminUserDataServlet">User Data</a>

			<form method="get" action="" style="margin: 0;">
				<input type="hidden" name="logout" value="true">
				<button type="submit" class="logout-btn">Logout</button>
			</form>

		</div>
	</div>

	<!-- Main Content -->
	<div class="container">
		<h2>User Search & File History</h2>

		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Gender</th>
					<th>Address</th>
					<th>Filename</th>
					<th>Search Count</th>
				</tr>
			</thead>
			<tbody>
				<%
            ResultSet rs = (ResultSet) request.getAttribute("userData");
            if (rs != null) {
                while (rs.next()) {
        %>
				<tr>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("email") %></td>
					<td><%= rs.getString("mobileno") %></td>
					<td><%= rs.getString("gender") %></td>
					<td><%= rs.getString("address") %></td>
					<td><%= rs.getString("keyword") %></td>
					<td><%= rs.getInt("search_requests") %></td>
				</tr>
				<%
                }
            }
        %>
			</tbody>
		</table>

		<div class="back-btn">
			<a href="approve.jsp">Back to Admin Home</a>
		</div>
	</div>

	<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
