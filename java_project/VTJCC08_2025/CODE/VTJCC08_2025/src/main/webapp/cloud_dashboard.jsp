<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Cloud Server Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================= GLOBAL ================= */
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
    display: flex;
    flex-direction: column;
    align-items: center;
    color: #fff;
}

/* ================= HEADER ================= */
.header-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 999;
}

.page-title {
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    padding: 12px 0;
    background: rgba(0,0,0,0.7);
    text-shadow: 1px 1px 4px rgba(0,0,0,0.8);
}

.header-bar {
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(12px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}

.nav-title {
    font-size: 18px;
    font-weight: 700;
}

/* ================= DASHBOARD MODULE ================= */
.dashboard-container {
    width: 90%;
    max-width: 420px;
    margin: 30px auto;
    padding: 25px 20px;
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(12px);
    border-radius: 18px;
    box-shadow: 0 10px 35px rgba(0,0,0,0.4);
    text-align: center;
    animation: fadeIn 1s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(15px); }
    to { opacity: 1; transform: translateY(0); }
}

.dashboard-container h2 {
    font-size: 22px;
    margin-bottom: 20px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}

/* ================= OPTIONS / CARDS ================= */
.options {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.card {
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    background: rgba(255,255,255,0.25);
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.4);
    cursor: pointer;
    transition: 0.3s;
    backdrop-filter: blur(6px);
}

.card:hover {
    background: rgba(255,255,255,0.35);
    transform: scale(1.04);
}

/* Secret Key Request Button */
.key-btn {
    display: block;
    text-decoration: none;
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 12px;
    background: linear-gradient(45deg, #3498db, #2c80b4);
    color: #fff;
    transition: 0.3s;
}

.key-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 0 12px rgba(52,152,219,0.7);
}

/* ================= BACK BUTTON ================= */
.back-btn {
    margin-top: 20px;
}

.back-btn a {
    text-decoration: none;
    padding: 10px 20px;
    font-size: 15px;
    font-weight: 600;
    background: rgba(0,0,0,0.5);
    border-radius: 10px;
    color: #fff;
    border: 1px solid rgba(255,255,255,0.4);
    transition: 0.3s;
}

.back-btn a:hover {
    background: rgba(0,0,0,0.7);
}

/* ================= FOOTER ================= */
.footer {
    margin-top: 30px;
    text-align: center;
    font-size: 13px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header-wrapper">
    <div class="page-title">
        SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS
    </div>
    <div class="header-bar">
        <div class="nav-title">Cloud Server Dashboard</div>
    </div>
</div>

<!-- DASHBOARD MODULE -->
<div class="dashboard-container">
    <h2>Select Cloud</h2>

    <div class="options">
        <div class="card" onclick="location.href='ViewCloudServlet?cloud=1'">Cloud 1</div>
        <div class="card" onclick="location.href='ViewCloudServlet?cloud=2'">Cloud 2</div>
        <div class="card" onclick="location.href='ViewCloudServlet?cloud=3'">Cloud 3</div>
		<div class="card" onclick="location.href='ViewKeyRequestsServlet'">Secret Key Requests</div>
        <!-- <a href="ViewKeyRequestsServlet" class="key-btn">🔑 Secret Key Requests</a>
    </div> -->
    	 <!-- <a href="ViewKeyRequestsServlet" class="card" style="background: rgba(52,152,219,0.25); border:1px solid rgba(52,152,219,0.4);">
        🔑 Secret Key Requests
    </a> -->

    <div class="back-btn">
        <a href="index.jsp">Logout</a>
    </div>
</div>

<!-- FOOTER -->
<div class="footer">© 2025 VTJCC08 Cloud Security System</div>

</body>
</html>
