<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Owner Registration</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== Global ================== */
body {
    margin: 0;
    padding: 110px 0 0 0;
    font-family: 'Poppins', sans-serif;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
    color: #fff;
}

/* ================== Header ================== */
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
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    padding: 12px 0;
    background: rgba(0,0,0,0.7);
}

.header-bar {
    height: 60px;
    display: flex;
    align-items: center;
    padding: 0 40px;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(10px);
}

.nav-title {
    font-size: 18px;
    font-weight: 700;
}

/* ================== Form Wrapper ================== */
.main-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 40px;
}

.container {
    width: 90%;
    max-width: 420px;
    background: rgba(255,255,255,0.15);
    padding: 30px;
    border-radius: 15px;
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
    animation: fadeIn 1s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(25px); }
    to { opacity: 1; transform: translateY(0); }
}

.container h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* ================== Inputs ================== */
input[type="text"],
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 14px;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.4);
    background: rgba(255,255,255,0.1);
    color: #fff;
}

input::placeholder {
    color: rgba(255,255,255,0.7);
}

input:focus {
    outline: none;
    border-color: #4CAF50;
    background: rgba(255,255,255,0.2);
}

/* ================== Button ================== */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    background: linear-gradient(45deg, #4CAF50, #8bc34a);
    border: none;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 10px;
    transition: 0.3s;
}

input[type="submit"]:hover {
    background: linear-gradient(45deg, #45a049, #7cb342);
    transform: translateY(-2px);
}

/* ================== Messages ================== */
.message-success {
    background: rgba(46, 204, 113, 0.95);
    color: #0b3d1c;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 15px;
    text-align: center;
}

.message-error {
    background: rgba(231, 76, 60, 0.95);
    color: #fff;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 15px;
    text-align: center;
}

/* ================== Back Link ================== */
.back-link-container {
    text-align: center;
    margin-top: 18px;
}

.back-link {
    color: #fff;
    text-decoration: none;
    padding: 8px 14px;
    border-radius: 6px;
    background: rgba(255,255,255,0.15);
    border: 1px solid rgba(255,255,255,0.3);
}

.back-link:hover {
    background: rgba(255,255,255,0.3);
}

/* ================== Footer ================== */
.footer {
    margin-top: 40px;
    text-align: center;
    padding: 15px;
    background: rgba(0,0,0,0.6);
}
</style>
</head>

<body>

<!-- ================== HEADER ================== -->
<div class="header-wrapper">
    <div class="page-title">
        SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS
    </div>
    <div class="header-bar">
        <div class="nav-title">☁️ Owner Registration</div>
    </div>
</div>

<!-- ================== FORM ================== -->
<div class="main-wrapper">
<div class="container">

<h2>New Owner Registration</h2>

<%
String success = (String) request.getAttribute("success");
String error = (String) request.getAttribute("error");
if(success != null){
%>
<div class="message-success"><%= success %></div>
<% } %>

<% if(error != null){ %>
<div class="message-error"><%= error %></div>
<% } %>

<form action="OwnerRegisterServlet" method="post">

    <input type="text" name="name" placeholder="Full Name" required>

    <input type="email" name="email" placeholder="Email Address" required>

    <input type="password" name="password"
           placeholder="Password (Min 6 chars with symbol)"
           pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$"
           required>

    <input type="text" name="gender" placeholder="Gender" required>

    <input type="text" name="mobileno"
           placeholder="Mobile Number"
           pattern="89[0-9]{8}" required>

    <input type="text" name="address" placeholder="Address" required>

    <input type="submit" value="Submit Application">

</form>

<div class="back-link-container">
    <a href="owner.jsp" class="back-link">← Back to Login</a>
</div>

</div>
</div>

<!-- ================== FOOTER ================== -->
<div class="footer">
    © 2025 Cloud Security System
</div>

</body>
</html>
