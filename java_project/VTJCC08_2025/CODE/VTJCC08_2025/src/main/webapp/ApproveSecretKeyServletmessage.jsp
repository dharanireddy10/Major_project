<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notification</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    /* Global Styles */
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        /* Using a placeholder background image for consistency */
        background: url('images/cloud.jpg') no-repeat center center/cover;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center; /* Center vertically */
        color: #fff; /* Default text color is white */
    }

    /* Container - Glass-morphism Effect */
    .container {
        width: 90%;
        max-width: 450px;
        background: rgba(255, 255, 255, 0.15); /* Translucent background */
        padding: 40px;
        border-radius: 15px;
        backdrop-filter: blur(10px); /* Glass effect */
        box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
        text-align: center;
        animation: fadeIn 1.2s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }

    h2 {
        font-size: 30px;
        font-weight: 600;
        margin-bottom: 20px;
        text-shadow: 0 2px 6px rgba(0,0,0,0.6);
    }
    
    /* Message Content */
    .message-content {
        background: rgba(255, 255, 255, 0.95); /* Light background for clear text */
        color: #333; /* Dark text */
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 30px;
        min-height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 16px;
        font-weight: 500;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    
    /* Home Link Button */
    .home-link-btn {
        text-decoration: none;
        display: block;
    }
    .home-link-btn button {
        background: linear-gradient(45deg, #3498db, #5dade2); /* Blue gradient */
        color: white;
        padding: 12px 30px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        width: 100%;
        font-size: 18px;
        font-weight: 600;
        transition: background 0.3s, transform 0.3s;
        box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
    }

    .home-link-btn button:hover {
        background: linear-gradient(45deg, #2980b9, #5499c7);
        transform: translateY(-2px);
    }

    /* Cloud Graphic Area */
    .graphic-area {
        margin-bottom: 30px;
    }
    .graphic-area p {
        margin-top: 5px;
        font-size: 14px;
        font-weight: 300;
        text-shadow: 0 1px 3px rgba(0,0,0,0.5);
    }
</style>
</head>
<body>

<div class="container">
    <h2>☁️ Application Notification</h2>

    <div class="graphic-area">
        
        <p>System message delivered via **Cloud.jsp**</p>
    </div>
    
    <div class="message-content">
        <p><%= request.getAttribute("message") %></p>
    </div>

    <!-- <p style="margin-bottom: 20px; font-weight: 300;">Click below to continue.</p> -->

    <a href="cloud_dashboard.jsp" class="home-link-btn">
        <button>Back</button>
    </a>
</div>

</body>
</html>