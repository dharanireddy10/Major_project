<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Owner Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== Global Styles ================== */
body {
    margin: 0;
    padding: 110px 0 0 0;
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

.page-title {
    width: 100%;
    text-align: center;
    font-size: 20px;
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

/* ================== Login Container ================== */
.login-container {
    width: 90%;
    max-width: 380px;
    background: rgba(255,255,255,0.15);
    padding: 40px;
    border-radius: 15px;
    backdrop-filter: blur(10px);
    box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
    margin: 60px auto;
    animation: fadeIn 1.2s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

h2 {
    text-align: center;
    font-size: 26px;
    font-weight: 600;
    margin-bottom: 25px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}

/* ================== Form ================== */
.input-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.4);
    background: rgba(255,255,255,0.1);
    color: #fff;
}

input:focus {
    outline: none;
    border-color: #3498db;
    background: rgba(255,255,255,0.2);
}

/* ================== Button ================== */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    border-radius: 8px;
    border: none;
    background: linear-gradient(45deg, #3498db, #5dade2);
    color: #fff;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(52,152,219,0.6);
}

/* ================== Footer Links ================== */
.footer-links {
    text-align: center;
    margin-top: 20px;
}

.footer-links a {
    color: #ecf0f1;
    text-decoration: none;
    font-size: 14px;
}

.footer-links a:hover {
    text-decoration: underline;
    color: #3498db;
}

/* ================== Footer ================== */
.footer {
    margin-top: 40px;
    text-align: center;
    color: #fff;
    font-size: 14px;
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
        <div class="nav-title">☁️ Owner Portal</div>
    </div>
</div>

<!-- ================== LOGIN BOX ================== -->
<div class="login-container">
    <h2>Owner Login</h2>

    <form action="OwnerLoginServlet" method="post">
        <div class="input-group">
            <label>Email Address</label>
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>
        </div>

        <input type="submit" value="Login">
    </form>

    <div class="footer-links">
        <a href="ownerregister.jsp">New Owner? Register Here</a>
    </div>
</div>

<!-- ================== FOOTER ================== -->
<div class="footer">
    © 2025 Cloud Security System
</div>

</body>
</html>
