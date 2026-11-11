<%@ page import="com.algo.AESUtil" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decrypt & Download</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
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
    justify-content: center;
    align-items: center;
    color: #fff;
}

/* ================= HEADER ================= */
.header-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    display: flex;
    flex-direction: column;
}

.page-title {
    width: 100%;
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
    align-items: center;
    padding: 0 40px;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}

.nav-title {
    font-size: 18px;
    font-weight: 700;
}

/* ================= MAIN CARD ================= */
.container {
    width: 90%;
    max-width: 550px;
    background: rgba(255,255,255,0.15);
    padding: 40px 30px;
    border-radius: 20px;
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
    font-size: 28px;
    margin-bottom: 20px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}

.info-text {
    font-size: 14px;
    margin-bottom: 25px;
    opacity: 0.9;
}

.detail-box {
    text-align: left;
    font-size: 14px;
    background: rgba(0,0,0,0.3);
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.detail-box p {
    margin-bottom: 8px;
}

/* ================= BUTTON ================= */
.download-btn {
    display: inline-block;
    text-decoration: none;
}

button {
    background: linear-gradient(45deg, #27ae60, #1e8449);
    padding: 14px 25px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 4px 12px rgba(39,174,96,0.4);
}

button:hover {
    transform: translateY(-2px);
    background: linear-gradient(45deg, #1e8449, #145a32);
}

/* ================= ERROR ================= */
.error {
    color: #ff6b6b;
    font-weight: 600;
    margin-top: 20px;
}

/* Back link */
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
        <div class="nav-title">Decrypt & Download</div>
    </div>
</div>

<!-- MAIN -->
<div>
<div class="container">
    <h2>🔓 Decrypt & Download</h2>

<%
String encrypted = (String) request.getAttribute("encrypted_data");
String key = (String) request.getAttribute("secret_key");
String filename = (String) request.getAttribute("filename");

if (encrypted == null || key == null) {
%>
    <p class="error">Required data missing!</p>
<%
} else {
    byte[] decryptedBytes = null;
    try {
        decryptedBytes = AESUtil.decryptFromBase64(encrypted, key);
        String base64 = Base64.getEncoder().encodeToString(decryptedBytes);
%>

    <div class="info-text">
        File decrypted successfully using AES-256.
    </div>

    <div class="detail-box">
        <p><b>File Name:</b> <%= filename %></p>
        <p><b>Secret Key Used:</b> <%= key %></p>
    </div>

    <a class="download-btn"
       href="data:application/octet-stream;base64,<%= base64 %>"
       download="<%= filename %>">
        <button>⬇️ Download File</button>
    </a>

<%
    } catch(Exception e) {
%>
    <p class="error">Decryption failed. Invalid key or corrupted data.</p>
<%
    }
}
%>

<div class="back-link-container">
        <a href="results.jsp" class="back-link">← Back</a>
    </div>

</div>

<div class="footer">© 2025 Cloud Security System</div>
</div>

</body>
</html>

 