<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Cloud Computing</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #dbe8f3, #f7fbff);
        background-image: url('images/cloud.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    /* --- Top Navigation --- */
    .navbar {
        width: 100%;
        padding: 20px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: rgba(0, 0, 0, 0.4);
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        border-radius: 0 0 20px 20px;
    }

    .nav-title {
        color: #fff;
        font-size: 32px;
        font-weight: 700;
        letter-spacing: 1px;
    }

    .nav-links a {
        color: #fff;
        font-size: 18px;
        margin-left: 25px;
        text-decoration: none;
        cursor: pointer;
        transition: 0.3s;
    }

    .nav-links a:hover {
        color: #d1e8ff;
    }

    /* --- Hero Section --- */
    .hero {
        text-align: center;
        margin-top: 80px;
        margin-bottom: 40px;
    }

    .hero h1 {
        font-family: Georgia, serif;
        color: #ffffff;
        font-size: 65px;
        font-weight: 900;
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
    }

    .hero h2 {
        font-family: "Times New Roman", serif;
        color: #f0f0f0;
        font-size: 32px;
        margin-top: 10px;
        text-shadow: 1px 1px 6px rgba(0,0,0,0.5);
    }

    /* --- Main Boxes Section --- */
    .options {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin-top: 50px;
        gap: 30px;
    }

    .container-box {
        width: 250px;
        height: 140px;
        background: rgba(255,255,255,0.85);
        border-radius: 18px;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        font-size: 22px;
        font-weight: 700;
        border: 2px solid #000;
        transition: 0.3s;
        box-shadow: 4px 4px 14px rgba(0,0,0,0.25);
    }

    .container-box:hover {
        background: #eff3f6;
        transform: translateY(-6px) scale(1.03);
        box-shadow: 6px 6px 20px rgba(0,0,0,0.35);
    }

    /* --- Footer --- */
    .footer {
        margin-top: auto;
        padding: 20px;
        text-align: center;
        font-size: 14px;
        color: #ffffff;
        text-shadow: 1px 1px 4px rgba(0,0,0,0.6);
    }
</style>
</head>
<body>

    <!-- Top Navigation -->
    <div class="navbar">
        <div class="nav-title">Cloud Computing</div>
        <div class="nav-links">
            <a onclick="location.href='adminlogin.jsp'">Admin</a>
            <a onclick="location.href='owner.jsp'">Owner</a>
            <a onclick="location.href='user.jsp'">User</a>
            <a onclick="location.href='cloud_login.jsp'">Cloud</a>
        </div>
    </div>

    <!-- Main Hero Title -->
    <div class="hero">
<!--         <h1>Welcome to VTJCC08</h1>
 -->
         <h2>SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS</h2>
    </div>

    <!-- Main Options Boxes -->
   <!--  <div class="options">
        <div class="container-box" onclick="location.href='adminlogin.jsp'">Admin</div>
        <div class="container-box" onclick="location.href='owner.jsp'">Owner Data</div>
        <div class="container-box" onclick="location.href='user.jsp'">User Data</div>
    </div> -->

    <!-- Footer -->
    <div class="footer">
        © 2025 Cloud Security System. All Rights Reserved.
    </div>

</body>
</html>
