<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Portal</title>

<!-- Google Fonts -->
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
    padding-top: 110px;
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

/* Page Title Row */
.page-title {
    width: 100%;
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    padding: 12px 0;
    color: #fff;
    background: rgba(0,0,0,0.7);
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

/* Top Navigation */
.top-nav {
    display: flex;
    gap: 15px;
}

.top-nav a {
    text-decoration: none;
    padding: 8px 15px;
    background: rgba(255,255,255,0.2);
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

/* ================== MAIN CONTENT ================== */
.container {
    width: 100%;
    text-align: center;
    margin-top: 40px;
}

/* Cards */
.cards {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 40px;
}

.card {
    width: 230px;
    height: 150px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 15px;
    backdrop-filter: blur(10px);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 20px;
    font-weight: 600;
    color: #fff;
    text-align: center;
    cursor: pointer;
    border: 2px solid rgba(255,255,255,0.5);
    transition: 0.3s;
    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}

.card:hover {
    background: rgba(255, 255, 255, 0.35);
    transform: translateY(-6px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.4);
}

/* Back Button */
.back-btn {
    display: inline-block;
    margin-top: 50px;
    text-decoration: none;
    padding: 12px 28px;
    font-size: 18px;
    font-weight: 600;
    background: rgba(0,0,0,0.4);
    color: #fff;
    border-radius: 12px;
    transition: 0.3s;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

.back-btn:hover {
    background: rgba(0,0,0,0.6);
    transform: translateY(-3px);
}

/* Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.cards, .back-btn {
    animation: fadeIn 1s ease-in-out;
}

/* Footer */
.footer {
    margin-top: 40px;
    text-align: center;
    color: #fff;
    font-size: 13px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
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
        <div class="nav-title">User Portal</div>
        <div class="top-nav">
            <a href="index.jsp">Home</a>
            <a href="userregister.jsp">Register</a>
            <a href="userlogin.jsp">Login</a>
        </div>
    </div>
</div>

<!-- ================== MAIN CONTENT ================== -->
<div class="container">
    <div class="cards">
        <div class="card" onclick="location.href='userregister.jsp'">
            User Register
        </div>

        <div class="card" onclick="location.href='userlogin.jsp'">
            User Login
        </div>
    </div>

    <a class="back-btn" href="index.jsp">Back</a>
</div>

<div class="footer">
    © 2025 Cloud Security System
</div>

</body>
</html>
