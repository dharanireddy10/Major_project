<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cloud Files</title>

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
    flex-direction: column;
    align-items: center;
    padding-top: 130px;
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

/* ===== HEADER ===== */
.header-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    display: flex;
    flex-direction: column;
}

/* Page Title */
.page-title {
    width: 100%;
    text-align: center;
    font-size: 20px;
    font-weight: 600;
    padding: 12px 0;
    color: #fff;
    background: rgba(0, 0, 0, 0.7);
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8);
}

/* Header Bar */
.header-bar {
    width: 100%;
    height: 90px;
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
    font-size: 32px;
    font-weight: 700;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
    letter-spacing: 1px;
}

/* ===== DASHBOARD CONTAINER ===== */
.container {
    width: 90%;
    max-width: 1000px;
    padding: 30px;
    border-radius: 18px;
    background: rgba(255, 255, 255, 0.12);
    backdrop-filter: blur(10px);
    box-shadow: 0px 8px 25px rgba(0,0,0,0.25);
    animation: fadeIn 1.1s ease-in-out;
    text-align: center;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    color: #fff;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 30px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.7);
}

/* ===== TABLE STYLING ===== */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    color: #fff;
}

th, td {
    padding: 12px 15px;
    border: 1px solid rgba(255,255,255,0.3);
    text-align: left;
}

th {
    background: rgba(0,0,0,0.3);
    font-weight: 600;
}

tr:nth-child(even) {
    background: rgba(255,255,255,0.05);
}

tr:hover {
    background: rgba(255,255,255,0.15);
    transform: scale(1.01);
    transition: 0.2s ease-in-out;
}

/* ===== BACK BUTTON ===== */
.back-btn {
    margin-top: 30px;
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

<!-- Floating Clouds -->
<div class="cloud"></div>
<div class="cloud"></div>
<div class="cloud"></div>

<!-- HEADER -->
<div class="header-wrapper">
    <div class="page-title">
        SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS
    </div>
    <div class="header-bar">
        <div class="nav-title">Cloud <%= request.getAttribute("cloud") %> Files</div>
    </div>
</div>

<!-- DASHBOARD CONTAINER -->
<div class="container">
    <h2>Cloud <%= request.getAttribute("cloud") %> Files</h2>

    <table>
        <tr>
            <th>Owner Email</th>
            <th>Filename</th>
            <th>File Type</th>
            <th>Keyword</th>
        </tr>
        <%
            java.util.List<java.util.Map<String,String>> files =
                (java.util.List<java.util.Map<String,String>>) request.getAttribute("files");

            if (files != null && !files.isEmpty()) {
                for (java.util.Map<String,String> f : files) {
        %>
        <tr>
            <td><%= f.get("owner") %></td>
            <td><%= f.get("filename") %></td>
            <td><%= f.get("filetype") %></td>
            <td><%= f.get("keyword") %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No files found</td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="back-btn">
        <a href="cloud_dashboard.jsp">Back</a>
    </div>
</div>

<!-- FOOTER -->
<div class="footer">© 2025 VTJCC08 Cloud Security System</div>

</body>
</html>
