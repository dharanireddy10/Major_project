<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login</title>

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

/* ================== Login Wrapper ================== */
.main-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 60px;
}

.login-container {
    width: 90%;
    max-width: 380px;
    background: rgba(255,255,255,0.15);
    padding: 40px;
    border-radius: 15px;
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 30px rgba(0,0,0,0.4);
    animation: fadeIn 1s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(25px); }
    to { opacity: 1; transform: translateY(0); }
}

.login-container h2 {
    text-align: center;
    margin-bottom: 25px;
}

/* ================== Inputs ================== */
.input-group {
    margin-bottom: 18px;
}

label {
    font-size: 14px;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-top: 6px;
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
    border-color: #f39c12;
    background: rgba(255,255,255,0.2);
}

/* ================== Button ================== */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    background: linear-gradient(45deg, #f39c12, #f5b041);
    border: none;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 10px;
    transition: 0.3s;
}

input[type="submit"]:hover {
    background: linear-gradient(45deg, #e67e22, #dc7633);
    transform: translateY(-2px);
}

/* ================== Links ================== */
.footer-links {
    text-align: center;
    margin-top: 22px;
}

.footer-links a {
    color: #ecf0f1;
    text-decoration: none;
    font-weight: 500;
}

.footer-links a:hover {
    color: #f39c12;
    text-decoration: underline;
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
        <div class="nav-title">👤 User Login</div>
    </div>
</div>

<!-- ================== LOGIN ================== -->
<div class="main-wrapper">
<div class="login-container">

<h2>Secure User Login</h2>

<form action="UserLoginServlet" method="post">

    <div class="input-group">
        <label>Email Address</label>
        <input type="email" name="email" placeholder="Enter your email" required>
    </div>

    <div class="input-group">
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>
    </div>

    <input type="submit" value="Login">

</form>

<div class="footer-links">
    <a href="userregister.jsp">Create Account</a> |
    <a href="user.jsp">Back to User Portal</a>
</div>

</div>
</div>

<!-- ================== FOOTER ================== -->
<div class="footer">
    © 2025 Cloud Security System
</div>

</body>
</html>
