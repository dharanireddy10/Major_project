<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Search Request Result</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ==================== GLOBAL ==================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 100px;
    position: relative;
    overflow: hidden;
}

/* ===== Floating Cloud Animation ===== */
.cloud {
    position: absolute;
    width: 380px;
    height: 180px;
    background: url('images/cloud.png') no-repeat center/contain;
    opacity: 0.45;
    animation: floatClouds 35s linear infinite;
}

.cloud:nth-child(1) { top: 12%; left: -20%; animation-duration: 38s; }
.cloud:nth-child(2) { top: 40%; left: -25%; animation-duration: 45s; opacity: 0.55; }
.cloud:nth-child(3) { top: 70%; left: -18%; animation-duration: 50s; opacity: 0.35; }

@keyframes floatClouds {
    from { transform: translateX(-400px); }
    to   { transform: translateX(1600px); }
}

/* ===== MESSAGE CONTAINER ===== */
.message-container {
    width: 420px;
    padding: 40px;
    border-radius: 18px;
    background: rgba(255, 255, 255, 0.13);
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 35px rgba(0,0,0,0.35);
    text-align: center;
    animation: fadeIn 1.3s ease;
    position: relative;
    z-index: 10;
}

@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9) translateY(30px); }
    to { opacity: 1; transform: scale(1) translateY(0); }
}

h2 {
    font-size: 28px;
    color: #fff;
    font-weight: 700;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
    margin-bottom: 25px;
}

/* ===== MESSAGE TEXT ===== */
.message-text {
    font-size: 18px;
    color: #fff;
    margin-bottom: 25px;
    text-shadow: 0 2px 4px rgba(0,0,0,0.5);
}

/* ===== BACK BUTTON ===== */
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

/* ===== FOOTER ===== */
.footer {
	text-align: center;
    margin-top: 30px;
    font-size: 14px;
    color: #fff;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
}
</style>
</head>

<body>

<!-- Floating Clouds -->
<div class="cloud"></div>
<div class="cloud"></div>
<div class="cloud"></div>

<!-- MESSAGE CARD -->
<div>
<div class="message-container">
    <h2>Search Request Status</h2>

    <div class="message-text">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "No message." %>
    </div>

    <div class="back-btn">
        <a href="results.jsp">Back</a>
    </div>
</div>

<div class="footer">© 2025 Cloud Security System</div>
</div>
</body>
</html>
