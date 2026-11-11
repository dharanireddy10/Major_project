<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Notification</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
        background: url('images/cloud.jpg') no-repeat center center/cover;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 130px;
    }

    /* ===== FIXED HEADER ===== */
    .header-bar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 90px;
        display: flex;
        justify-content: center;
        align-items: center;
        background: rgba(0, 0, 0, 0.5);
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 15px rgba(0,0,0,0.4);
        z-index: 1000;
    }

    .nav-title {
        color: #fff;
        font-size: 32px;
        font-weight: 700;
        letter-spacing: 1px;
        text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
    }

    /* ===== MESSAGE CONTAINER ===== */
    .container {
        width: 75%;
        max-width: 900px;
        padding: 40px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        box-shadow: 0px 8px 25px rgba(0,0,0,0.25);
        text-align: center;
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* ===== MESSAGE TEXT ===== */
    .message {
        font-size: 26px;
        font-weight: 700;
        color: #ffffff;
        margin-bottom: 35px;
        text-shadow: 0 2px 6px rgba(0,0,0,0.7);
    }

    /* ===== BUTTON ===== */
    .back-btn a {
        text-decoration: none;
        padding: 14px 30px;
        background: rgba(0,0,0,0.55);
        color: #fff;
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.4);
        font-size: 18px;
        font-weight: 600;
        transition: 0.3s ease;
    }

    .back-btn a:hover {
        background: rgba(0,0,0,0.75);
        transform: translateY(-3px);
        box-shadow: 0 6px 18px rgba(0,0,0,0.4);
    }

    /* ===== FOOTER ===== */
    .footer {
        margin-top: 50px;
        font-size: 14px;
        color: #fff;
        text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
    }
</style>
</head>

<body>

    <!-- HEADER -->
    <div class="header-bar">
        <div class="nav-title">Admin Notification</div>
    </div>

    <!-- MESSAGE PANEL -->
    <div class="container">
        <div class="message">
            ${message}
        </div>

        <div class="back-btn">
            <a href="adminsearchrequests.jsp">Back</a>
        </div>
    </div>

    <div class="footer">© 2025 VTJCC08 Cloud Security System</div>

</body>
</html>
