<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.DB.Database" %>
<%@ page isELIgnored="false" %>

<%
/* ================= LOGOUT HANDLING (JSP ITSELF) ================= */
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
<title>File Search Request</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== Global Styles ================== */
body {
    margin: 0;
    padding: 110px 0 0 0; /* space for header */
    font-family: 'Poppins', sans-serif;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
    color: #fff;
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

/* Page Title */
.page-title {
    width: 100%;
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    padding: 12px 0;
    color: #fff;
    background: rgba(0,0,0,0.7);
}

/* Header Bar / Navigation */
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

.top-nav {
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
    max-width: 480px;
    background: rgba(255,255,255,0.15);
    padding: 40px;
    border-radius: 15px;
    backdrop-filter: blur(10px);
    box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
    margin: 0 auto 50px auto;
    text-align: center;
    animation: fadeIn 1.2s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

h2 {
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 20px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}

.status-info {
    text-align: center;
    margin-bottom: 30px;
    font-size: 14px;
    opacity: 0.8;
}

/* Form */
form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.input-group {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 5px;
    font-weight: 400;
    font-size: 14px;
    text-shadow: 0 1px 2px rgba(0,0,0,0.5);
}

input[type="text"] {
    width: 100%;
    padding: 12px;
    border: 1px solid rgba(255,255,255,0.4);
    border-radius: 8px;
    background: rgba(255,255,255,0.1);
    color: #fff;
    box-sizing: border-box;
    transition: all 0.3s;
    font-family: 'Poppins', sans-serif;
}

input::placeholder {
    color: rgba(255,255,255,0.7);
}

input:focus {
    border-color: #f39c12;
    background: rgba(255,255,255,0.2);
    outline: none;
}

/* Submit Button */
button[type="submit"] {
    background: linear-gradient(45deg,#2ecc71,#58d68d);
    color: #fff;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
    font-weight: 600;
    margin-top: 20px;
    box-shadow: 0 4px 10px rgba(46,204,113,0.3);
    transition: background 0.3s, transform 0.3s;
}

button[type="submit"]:hover {
    background: linear-gradient(45deg,#27ae60,#48c9b0);
    transform: translateY(-2px);
}

/* Back Link */
.back-link-container {
    text-align: center;
    margin-top: 30px;
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
    margin-top: 18px;
    font-size: 13px;
    color: #fff;
    text-align: center;
}
</style>
</head>
<body>

<!-- ================= HEADER ================= -->
<div class="header-wrapper">
    <div class="page-title">SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS</div>

    <div class="header-bar">
        <div class="nav-title">User Panel</div>
       <!--  <div class="top-nav">
            <a href="user.jsp">Home</a>
            <a href="usersearchrequests.jsp">My Requests</a>
            <a href="viewencrypted.jsp">Encrypted Data</a>

            Logout
            <form method="post" style="margin:0;">
                <input type="hidden" name="logout" value="true">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div> -->
    </div>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="container">
    <h2>☁️ File Search Request</h2>

    <div class="status-info">
        Logged in as: **${sessionScope.email}**
    </div>

    <div class="graphic-area">
        <p>Searching secure files on Cloud</p>
    </div>

    <form action="SearchRequestServlet" method="post">
        <div class="input-group">
            <label for="keyword">File Name:</label>
            <input type="text" id="keyword" name="keyword" placeholder="Enter the keyword" required>
        </div>
        <button type="submit">Submit Search Request</button>
    </form>

    <div class="back-link-container">
        <a href="results.jsp" class="back-link">← Back to User Portal</a>
    </div>
</div>

<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
