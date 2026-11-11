<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
    // Session check
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
    String userEmail = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Activities Portal</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
	rel="stylesheet">
<style>
/* ================== Global Styles ================== */
body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background: url('images/cloud.jpg') no-repeat center center/cover;
	min-height: 100vh;
	color: #fff;
}

/* ================== Fixed Header ================== */
.header-bar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 110px;
	background: rgba(0, 0, 0, 0.6);
	backdrop-filter: blur(10px);
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	z-index: 1000;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
}

.header-bar h1 {
	margin: 0;
	font-size: 22px;
	font-weight: 700;
	text-align: center;
}

/* ================== Top Navigation Right ================== */
.top-nav {
	width: 97%;
	height: 55px;
	background: rgba(0, 0, 0, 0.55);
	backdrop-filter: blur(12px);
	display: flex;
	justify-content: flex-end; /* aligned to right */
	align-items: center;
	padding: 0 40px;
	position: fixed;
	top: 110px;
	z-index: 999;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
	gap: 15px;
}

.top-nav a, .top-nav span {
	text-decoration: none;
	color: #fff;
	font-size: 14px;
	font-weight: 600;
	padding: 8px 14px;
	border-radius: 8px;
	background: rgba(255, 255, 255, 0.1);
	transition: 0.3s;
}

.top-nav a:hover {
	background: rgba(243, 156, 18, 0.8);
	color: #fff;
}

/* ================== Main Content Wrapper ================== */
.main-content-wrapper {
	display: flex;
	justify-content: center;
	margin-top: 185px; /* header + top-nav space */
	padding-bottom: 50px;
}

/* ================== Activity Hub Container ================== */
.activity-hub-container {
	width: 90%;
	max-width: 750px;
	background: rgba(255, 255, 255, 0.1);
	padding: 50px 30px 30px 30px;
	border-radius: 25px;
	backdrop-filter: blur(12px);
	box-shadow: 0px 10px 40px rgba(0, 0, 0, 0.5);
	text-align: center;
	animation: fadeIn 1.2s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h2 {
	font-size: 34px;
	font-weight: 700;
	margin-bottom: 10px;
	text-shadow: 0 2px 8px rgba(0, 0, 0, 0.8);
}

p.subtitle {
	font-weight: 300;
	font-size: 16px;
	margin-bottom: 30px;
	opacity: 0.85;
}

/* ================== Status Info ================== */
.status-info {
	text-align: center;
	margin-bottom: 30px;
	font-size: 14px;
	font-weight: 500;
	opacity: 0.85;
}

/* ================== Navigation Boxes ================== */
.navigation-area {
	display: flex;
	justify-content: space-around;
	gap: 25px;
	margin-bottom: 40px;
	flex-wrap: wrap;
}

.container-box {
	flex: 1;
	min-width: 200px;
	height: 160px;
	background: rgba(255, 255, 255, 0.08);
	color: #fff;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	font-size: 18px;
	font-weight: 600;
	border: 1px solid rgba(255, 255, 255, 0.2);
	transition: 0.3s ease-in-out;
	backdrop-filter: blur(6px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
	padding: 15px;
	text-align: center;
}

.container-box:hover {
	background: linear-gradient(135deg, #f39c12, #f1c40f);
	color: #2c3e50;
	transform: translateY(-6px) scale(1.05);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.5);
}

.box-icon {
	font-size: 45px;
	margin-bottom: 10px;
	color: #e67e22;
}

/* ================== Back Button ================== */
.back-btn {
	text-align: center;
}

.back-btn a {
	text-decoration: none;
	color: #fff;
	font-size: 16px;
	font-weight: 500;
	padding: 10px 25px;
	background: rgba(0, 0, 0, 0.4);
	border-radius: 10px;
	transition: 0.3s;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.back-btn a:hover {
	background: rgba(0, 0, 0, 0.6);
}

/* ================== Footer ================== */
.footer {
	margin-top: 40px;
	text-align: center;
	padding: 15px;
	background: rgba(0, 0, 0, 0.6);
}
</style>
</head>
<body>

	<!-- ================== HEADER ================== -->
	<div class="header-bar">
		<h1>SECURE KEYWORD SEARCH AND KEY MANAGEMENT SYSTEM</h1>
	</div>

	<!-- ================== TOP NAV RIGHT ================== -->
	<div class="top-nav">
		<a href="user.jsp">Dashboard</a> <a href="usersearch.jsp">Search
			Requests</a> <a href="viewencrypted.jsp">Encrypted Data</a> <a
			href="searchFile.jsp">Secret Key</a>
<%-- 		<span>${email}</span>
 --%>		<a href="index.jsp">Logout</a>
	</div>

	<!-- ================== MAIN CONTENT ================== -->
	<div class="main-content-wrapper">
		<div class="activity-hub-container">
			<h2>☁️ User Activities Hub</h2>
			<p class="subtitle">Manage and view your data usage and security
				features.</p>
			<div class="status-info">
				Welcome :  <b>${sessionScope.email}</b>
			</div>


			<div class="navigation-area">
				<div class="container-box" onclick="location.href='usersearch.jsp'">
					<div class="box-icon">🔍</div>
					User Search Requests
				</div>
				<div class="container-box"
					onclick="location.href='viewencrypted.jsp'">
					<div class="box-icon">📁</div>
					View Encrypted Data
				</div>
				<div class="container-box" onclick="location.href='searchFile.jsp'">
					<div class="box-icon">🔑</div>
					Get Secret Key
				</div>
			</div>
			<div class="back-btn">
				<a href="user.jsp">← Back to User Portal</a>
			</div>
		</div>
	</div>

	<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
