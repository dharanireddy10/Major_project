<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Encrypted Data</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== GLOBAL STYLES ================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    padding-top: 110px; /* space for fixed header */
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
}

/* ================== HEADER WRAPPER ================== */
.header-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    display: flex;
    flex-direction: column;
}

/* Page Title */
.page-title {
    width: 100%;
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    padding: 12px 0;
    color: #fff;
    background: rgba(0, 0, 0, 0.7);
    text-shadow: 1px 1px 4px rgba(0,0,0,0.8);
}

/* Header Bar */
.header-bar {
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}

.nav-title {
    font-size: 18px;
    font-weight: 700;
    color: #fff;
}

/* Top Navigation (optional) */
.top-nav {
    display: flex;
    gap: 15px;
}

.top-nav a {
    text-decoration: none;
    padding: 8px 15px;
    background: rgba(255, 255, 255, 0.2);
    color: #fff;
    font-weight: 600;
    border-radius: 6px;
    border: 1px solid rgba(255,255,255,0.4);
    transition: 0.3s;
}

.top-nav a:hover {
    background: rgba(255,255,255,0.4);
    transform: scale(1.05);
}

/* ================== MAIN CONTAINER ================== */
.container {
    width: 90%;
    max-width: 500px;
    background: rgba(255,255,255,0.15);
    padding: 40px 30px;
    border-radius: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0px 10px 40px rgba(0,0,0,0.5);
    text-align: center;
    animation: fadeIn 1.2s ease-in-out;
}

@keyframes fadeIn {
    from { opacity:0; transform: translateY(-30px); }
    to { opacity:1; transform: translateY(0); }
}

h2 {
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 20px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}
.top-nav {
	width: 100%;
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
.status-info {
    font-size: 14px;
    margin-bottom: 25px;
    opacity: 0.85;
}

/* Graphic area */
.graphic-area {
    margin-bottom: 25px;
}
.graphic-area p {
    font-size: 14px;
    font-weight: 300;
    text-shadow: 0 1px 3px rgba(0,0,0,0.5);
}

/* Form Styles */
form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.input-group {
    display: flex;
    flex-direction: column;
    text-align: left;
}

label {
    font-weight: 400;
    font-size: 14px;
    margin-bottom: 5px;
    text-shadow: 0 1px 2px rgba(0,0,0,0.5);
}

input[type="text"] {
    width: 100%;
    padding: 12px;
    border: 1px solid rgba(255,255,255,0.4);
    border-radius: 8px;
    background: rgba(255,255,255,0.1);
    color: #fff;
    font-family: 'Poppins', sans-serif;
    transition: all 0.3s;
}

input::placeholder {
    color: rgba(255,255,255,0.7);
}

input:focus {
    border-color: #e74c3c;
    background: rgba(255,255,255,0.2);
    outline: none;
}

/* Submit Button */
button[type="submit"] {
    background: linear-gradient(45deg, #e74c3c, #c0392b);
    color: #fff;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    margin-top: 15px;
    transition: background 0.3s, transform 0.3s;
    box-shadow: 0 4px 10px rgba(231,76,60,0.3);
}

button[type="submit"]:hover {
    background: linear-gradient(45deg, #c0392b, #a93226);
    transform: translateY(-2px);
}

/* Back link */
.back-link-container {
    margin-top: 25px;
    text-align: center;
}
.back-link {
    color: #fff;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    padding: 10px 20px;
    background: rgba(0,0,0,0.4);
    border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.3);
    transition: 0.3s;
}

.back-link:hover {
    background: rgba(0,0,0,0.6);
}

/* Footer */
.footer {
    margin-top: 30px;
    text-align: center;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}
</style>
</head>
<body>

<!-- ================= HEADER ================= -->
<div class="header-wrapper">
    <div class="page-title">SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS</div>

    <div class="header-bar">
        <div class="nav-title">View Encrypted Data</div>
    </div>
    <div class="top-nav">
		<a href="results.jsp">Dashboard</a> 
		 <a href="usersearch.jsp">Search
			Requests</a> <a
			href="searchFile.jsp">Secret Key</a>
			<a href="index.jsp">Logout</a>
		</div>
</div>

<!-- ================= MAIN CONTAINER ================= -->
<div>
<div class="container">
    <h2>🔐 View Encrypted Data</h2>

    <div class="status-info">
        Logged in as: **${sessionScope.email}**
    </div>

    <div class="graphic-area">
        <p>Decryption requires file name and trapdoor key from Cloud</p>
    </div>

   <form action="GetTrapdoorKeyServlet" method="post">
    <div class="input-group">
        <label for="keyword">Keyword:</label>
        <input type="text" id="keyword" name="keyword"
               placeholder="Enter the keyword" required>
    </div>

    <button type="submit">Get Trapdoor Key</button>
</form>


    <div class="back-link-container">
        <a href="results.jsp" class="back-link">← Back</a>
    </div>
</div>

<div class="footer">© 2025 Cloud Security System</div>
</div>
</body>
</html>
