<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Notification</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
        background: url('images/cloud.jpg') no-repeat center center/cover;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* MAIN BOX */
    .box {
        width: 60%;
        max-width: 600px;
        padding: 40px;
        text-align: center;
        background: rgba(255, 255, 255, 0.15);
        border-radius: 20px;
        backdrop-filter: blur(12px);
        box-shadow: 0px 8px 25px rgba(0,0,0,0.25);
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* TITLE */
    h2 {
        font-size: 28px;
        font-weight: 700;
        color: #fff;
        text-shadow: 0px 2px 6px rgba(0,0,0,0.7);
        margin-bottom: 25px;
    }

    /* DYNAMIC MESSAGE COLOR */
    .success {
        color: #00FF99;
        font-size: 22px;
        font-weight: 600;
        text-shadow: 0px 2px 4px rgba(0,0,0,0.7);
    }

    .error {
        color: #CC0000;
        font-size: 22px;
        font-weight: 600;
        text-shadow: 0px 2px 4px rgba(0,0,0,0.7);
    }

    /* BACK BUTTON */
    .back-btn {
        margin-top: 30px;
    }

    .back-btn a {
        text-decoration: none;
        padding: 12px 28px;
        background: rgba(0,0,0,0.6);
        border: 1px solid rgba(255,255,255,0.4);
        color: #fff;
        font-size: 18px;
        font-weight: 600;
        border-radius: 12px;
        transition: 0.3s ease-in-out;
    }

    .back-btn a:hover {
        background: rgba(0,0,0,0.8);
        transform: translateY(-4px);
    }
</style>

</head>
<body>

    <div class="box">

        <h2>Notification</h2>

        <%
            String msg = (String) request.getAttribute("message");
            boolean approved = msg != null && msg.toUpperCase().contains("APPROVED");
        %>

        <!-- Dynamic color based on message -->
        <div class="<%= approved ? "error" : "success" %>">
            <%= msg %>
        </div>

        <div class="back-btn">
            <a href="ownerupload.jsp">Back</a>
        </div>

    </div>

</body>
</html>
