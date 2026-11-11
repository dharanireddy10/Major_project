<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Approval Message</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
    /* 🎨 Global Styles - Matching Admin Panel Background */
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        /* Use the same background image for consistency */
        background: url('images/cloud.jpg') no-repeat center center/cover;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #fff; /* Default text color for the glass background */
    }

    /* 📦 Message Box Styles - Glassmorphism Container */
    .box {
        width: 90%;
        max-width: 400px; /* Slightly smaller for a message */
        padding: 30px;
        text-align: center;
        /* Glass Effect */
        background: rgba(255, 255, 255, 0.15); 
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
        font-size: 18px;
        
        /* Animation */
        opacity: 0;
        animation: fadeIn 1.2s ease-in-out forwards;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* 📝 Message Text Styles */
    .message {
        margin-bottom: 25px;
        padding: 20px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 22px;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.5); /* Text shadow for legibility */

        /* Flexbox for centering icon and text */
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .message i {
        /* Spacing for the icon */
        margin-right: 15px;
        font-size: 1.8em; /* Larger icon */
    }

    .success {
        /* Success colors matching the Admin Panel's 'Approve' button */
        color: #2ecc71; 
        background-color: rgba(46, 204, 113, 0.2); 
        border: 1px solid #27ae60;
    }

    .error {
        /* Error colors matching the Admin Panel's 'Reject' button */
        color: #e74c3c; 
        background-color: rgba(231, 76, 60, 0.2);
        border: 1px solid #c0392b;
    }

    /* 🔙 Back Link Styles - Matching Admin Panel Button Look */
    a {
        margin-top: 25px;
        display: inline-block;
        text-decoration: none;
        color: #fff;
        font-weight: 600;
        padding: 12px 25px;
        background: rgba(0,0,0,0.4);
        border-radius: 10px;
        transition: 0.3s;
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    a:hover {
        background: rgba(0,0,0,0.6);
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }
</style>

</head>
<body>

<div class="box">

    <%
        String msg = request.getParameter("msg");
        String iconClass = "";
        String textMessage = "No message found. Please check the URL.";
        String className = "error";

        if (msg != null) {
            textMessage = msg;
            if (msg.contains("Approved")) {
                className = "success";
                iconClass = "fas fa-check-circle"; // Success icon
            } else {
                className = "error";
                iconClass = "fas fa-times-circle"; // Error icon
            }
        }
    %>

    <p class="message <%= className %>">
        <i class="<%= iconClass %>"></i> 
        <%= textMessage %>
    </p>

    <a href="adminuserapprove.jsp">← Back to User Approval Page</a>

</div>

</body>
</html>