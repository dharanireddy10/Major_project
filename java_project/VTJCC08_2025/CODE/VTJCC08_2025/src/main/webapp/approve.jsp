<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== Global Styles ================== */
body {
    margin: 0;
    padding: 140px 0 0 0; /* space for page title + header bar */
    font-family: "Poppins", sans-serif;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
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

/* ================== Page Title ================== */
.page-title {
    width: 100%;
    text-align: center;
    font-size: 30px;
    font-weight: 600;
    padding: 12px 0;
    color: #fff;
    background: rgba(0,0,0,0.7);
    text-shadow: 1px 1px 4px rgba(0,0,0,0.8);
}

/* ================== Header Bar ================== */
.header-bar {
    width: 100%;
    height: 70px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 40px;
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}

.nav-title {
    color: #fff;
    font-size: 20px;
    font-weight: 700;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
    letter-spacing: 1px;
}

/* ================== Main Panel Container ================== */
.container {
    width: 85%;
    max-width: 1200px;
    padding: 30px;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.12);
    backdrop-filter: blur(10px);
    box-shadow: 0px 8px 25px rgba(0,0,0,0.25);
    animation: fadeIn 1.1s ease-in-out;
    text-align: center;
}

/* Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    color: #fff;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 35px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.7);
}

/* ================== Option Cards ================== */
.options {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 25px;
}

.card {
    width: 260px;
    height: 150px;
    background: rgba(255, 255, 255, 0.22);
    border-radius: 18px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    color: #fff;
    font-size: 22px;
    font-weight: 700;
    border: 1px solid rgba(255,255,255,0.4);
    text-shadow: 1px 1px 4px rgba(0,0,0,0.7);
    transition: 0.3s ease-in-out;
    box-shadow: 0px 5px 20px rgba(0,0,0,0.25);
    backdrop-filter: blur(10px);
}

.card:hover {
    background: rgba(255, 255, 255, 0.35);
    transform: translateY(-7px) scale(1.05);
    box-shadow: 0px 8px 25px rgba(0,0,0,0.4);
}

/* ================== Back Button ================== */
.back-btn {
    margin-top: 40px;
}

.back-btn a {
    text-decoration: none;
    padding: 12px 25px;
    background: rgba(0,0,0,0.5);
    color: #fff;
    border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.4);
    font-size: 18px;
    font-weight: 600;
    transition: 0.3s ease;
}

.back-btn a:hover {
    background: rgba(0,0,0,0.7);
    transform: translateY(-3px);
}

/* ================== Footer ================== */
.footer {
    margin-top: 50px;
    font-size: 14px;
    color: #fff;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
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
        <div class="nav-title">Admin Panel</div>
    </div>
</div>

<!-- ================== MAIN PANEL ================== -->
<div class="container">
    <h2>Manage System Access & Data</h2>

    <div class="options">

        <div class="card" onclick="location.href='adminownerapprove.jsp'">
            Approve Owner
        </div>

        <div class="card" onclick="location.href='adminuserapprove.jsp'">
            Approve User
        </div>

        <div class="card" onclick="location.href='adminsearchrequests.jsp'">
            Pending Requests
        </div>

        <div class="card" onclick="location.href='AdminOwnerDataServlet'">
            Owner Data
        </div>

        <div class="card" onclick="location.href='AdminUserDataServlet'">
            User Data
        </div>

    </div>

    <div class="back-btn">
        <a href="index.jsp">Back</a>
    </div>
</div>

<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
