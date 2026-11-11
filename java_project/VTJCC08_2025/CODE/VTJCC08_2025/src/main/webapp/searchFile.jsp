<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>

<%
    // Session check
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
    String userEmail = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search File</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
    color: #fff;
}

/* ================== HEADER ================== */
.header-bar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 110px;
    background: rgba(0,0,0,0.6);
    backdrop-filter: blur(10px);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}
.header-bar h1 {
    margin: 0;
    font-size: 22px;
    font-weight: 700;
    text-align: center;
}

/* ================== TOP NAV RIGHT ================== */
.top-nav {
    width: 100%;
    height: 55px;
    background: rgba(0,0,0,0.55);
    backdrop-filter: blur(12px);
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 0 40px;
    position: fixed;
    top: 110px;
    z-index: 999;
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
    gap: 15px;
}

.top-nav a, .top-nav span {
    text-decoration: none;
    color: #fff;
    font-size: 14px;
    font-weight: 600;
    padding: 8px 14px;
    border-radius: 8px;
    background: rgba(255,255,255,0.1);
    transition: 0.3s;
}

.top-nav a:hover {
    background: rgba(243,156,18,0.8);
    color: #fff;
}

/* ================== MAIN CONTAINER ================== */
.main-content-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 185px; /* header + top-nav */
    padding-bottom: 50px;
}

.container {
    width: 90%;
    max-width: 550px;
    background: rgba(255,255,255,0.1);
    padding: 40px 30px;
    border-radius: 25px;
    backdrop-filter: blur(12px);
    box-shadow: 0px 10px 40px rgba(0,0,0,0.5);
    text-align: center;
    animation: fadeIn 1.2s ease-in-out;
}

@keyframes fadeIn {
    from { opacity:0; transform: translateY(-30px); }
    to { opacity:1; transform: translateY(0); }
}

h2 {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 20px;
    text-shadow: 0 2px 8px rgba(0,0,0,0.8);
}

.status-info {
    font-size: 14px;
    margin-bottom: 25px;
    opacity: 0.85;
}

/* ================== FORM STYLES ================== */
form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

label {
    text-align: left;
    font-size: 14px;
    font-weight: 500;
}

input[type="text"] {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.3);
    background: rgba(255,255,255,0.1);
    color: #fff;
    font-size: 15px;
    transition: all 0.3s;
}

input::placeholder {
    color: rgba(255,255,255,0.7);
}

input:focus {
    outline: none;
    border-color: #f39c12;
    background: rgba(255,255,255,0.2);
}

/* Submit Button */
button {
    background: linear-gradient(45deg, #f39c12, #e67e22);
    padding: 12px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s;
    box-shadow: 0 4px 10px rgba(243,156,18,0.3);
}

button:hover {
    transform: translateY(-2px);
    background: linear-gradient(45deg, #e67e22, #f1c40f);
}

/* Back Link */
.back-link-container {
    margin-top: 25px;
    text-align: center;
}

.back-link {
    color: #fff;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    padding: 10px 20px;
    background: rgba(0,0,0,0.4);
    border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.3);
    transition: 0.3s;
}

.back-link:hover {
    background: rgba(0,0,0,0.6);
}

/* Footer */
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
<div class="header-bar">
    <h1>SECURE KEYWORD SEARCH AND KEY MANAGEMENT SYSTEM</h1>
</div>

<!-- TOP NAV -->
<div class="top-nav">
    <a href="results.jsp">Dashboard</a>
    <a href="usersearch.jsp">Search Requests</a>
    <a href="viewencrypted.jsp">Encrypted Data</a>
    <a href="index.jsp">Logout</a>
    <span>${userEmail}</span>
</div>

<!-- MAIN CONTENT -->
<div class="main-content-wrapper">
    <div class="container">
        <h2>🔍 Search File by Keyword</h2>

        <div class="status-info">
            Logged in as: <b>${email}</b>
        </div>

        <p>Enter a keyword to securely search encrypted files stored in the cloud.</p>

        <form action="SearchFileServlet" method="post">
            <label>Keyword</label>
            <input type="text" name="keyword" placeholder="Enter keyword" required>
            <button type="submit">Search</button>
        </form>

        <div class="back-link-container">
            <a href="user.jsp" class="back-link">← Back to Dashboard</a>
        </div>
    </div>
</div>

<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
