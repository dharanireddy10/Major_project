<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>

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
    overflow: hidden;
    position: relative;
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

/* ==================== LOGIN CONTAINER ==================== */
.login-container {
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
    font-size: 32px;
    color: #fff;
    font-weight: 700;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
    margin-bottom: 25px;
}

/* ==================== INPUT GROUP ==================== */
label {
    display: block;
    text-align: left;
    font-size: 15px;
    color: #fff;
    font-weight: 600;
    margin-bottom: 5px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.5);
}

.input-box {
    width: 100%;
    margin-bottom: 20px;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    font-size: 15px;
    border-radius: 10px;
    border: none;
    outline: none;
    background: rgba(255,255,255,0.25);
    color: #fff;
    backdrop-filter: blur(6px);
    border: 1px solid rgba(255,255,255,0.35);
    transition: 0.3s ease;
}

input[type="email"]::placeholder,
input[type="password"]::placeholder {
    color: #e8e8e8;
}

input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #fff;
    background: rgba(255,255,255,0.35);
    transform: scale(1.02);
    box-shadow: 0 0 10px rgba(255,255,255,0.5);
}

/* ==================== LOGIN BUTTON ==================== */
button {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #0057ff, #0039cc);
    color: #fff;
    font-size: 18px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s ease;
    box-shadow: 0px 5px 18px rgba(0,0,0,0.35);
}

button:hover {
    transform: translateY(-4px) scale(1.03);
    box-shadow: 0px 8px 25px rgba(0,0,0,0.45);
}

/* ==================== FOOTER ==================== */
.footer {
    margin-top: 18px;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}
</style>

</head>

<body>

<!-- Floating Cloud Layers -->
<div class="cloud"></div>
<div class="cloud"></div>
<div class="cloud"></div>

<!-- Login Card -->
<div class="login-container">
    <h2>Admin Login</h2>

    <form action="AdminLoginServlet" method="post">

        <div class="input-box">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-box">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required>
        </div>

        <button type="submit">Login</button>

    </form>

    <div class="footer">© 2025 Cloud Security System</div>
</div>

</body>
</html>
