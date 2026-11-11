<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Upload File to Cloud</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== Global Styles ================== */
body {
    margin: 0;
    padding: 120px 0 0 0; /* space for page-title + header-bar */
    font-family: 'Poppins', sans-serif;
    background: url('images/cloud.jpg') no-repeat center center/cover;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    color: #fff;
}

/* ================== Header Wrapper ================== */
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
    background: rgba(0,0,0,0.7);
}

/* Header Bar */
.header-bar {
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(10px);
}

/* Title */
.nav-title {
    font-size: 18px;
    font-weight: 700;
    color: #fff;
}

/* Top Navigation */
.top-nav a {
    text-decoration: none;
    padding: 8px 15px;
    background: rgba(255,255,255,0.2);
    color: #fff;
    font-weight: 600;
    border-radius: 6px;
    border: 1px solid rgba(255,255,255,0.4);
    transition: 0.3s;
}

.top-nav a:hover {
    background: rgba(255,255,255,0.4);
    transform: scale(1.05);
}

/* ================== Upload Container ================== */
.container {
    width: 90%;
    max-width: 480px;
    background: rgba(255,255,255,0.15);
    padding: 40px;
    border-radius: 15px;
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 30px rgba(0,0,0,0.4);
    animation: fadeIn 1.2s ease-in-out;
    margin-top: 30px;
}

/* Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.9); }
    to   { opacity: 1; transform: scale(1); }
}

h2 {
    text-align: center;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 20px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}

.status-info {
    text-align: center;
    margin-bottom: 30px;
    font-size: 14px;
    font-weight: 500;
    opacity: 0.85;
}

form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.input-group {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
    font-weight: 400;
    font-size: 15px;
    text-shadow: 0 1px 2px rgba(0,0,0,0.5);
}

form select,
form input[type="file"],
form input[type="text"] {
    width: 100%;
    padding: 12px;
    border: 1px solid rgba(255,255,255,0.5);
    border-radius: 8px;
    background: rgba(255,255,255,0.95);
    color: #333;
}

form input[type="file"]::-webkit-file-upload-button {
    background: #5dade2;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

form input[type="file"]::-webkit-file-upload-button:hover {
    background: #3498db;
}

button[type="submit"] {
    background: linear-gradient(45deg,#2ecc71,#58d68d);
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
    font-weight: 600;
    box-shadow: 0 4px 10px rgba(46,204,113,0.4);
    margin-top: 15px;
}

button[type="submit"]:hover {
    background: linear-gradient(45deg,#27ae60,#48c9b0);
    transform: translateY(-2px);
}

/* Back Link */
.back-link-container {
    text-align: center;
    margin-top: 30px;
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
}

.back-link:hover {
    background: rgba(0,0,0,0.6);
}
</style>
</head>

<body>

<!-- ================= HEADER ================= -->
<div class="header-wrapper">
    <div class="page-title">
        SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS
    </div>

    <div class="header-bar">
        <div class="nav-title">Owner Panel</div>
       
    </div>
</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="container">
    <h2>⬆️ Encrypt & Upload File</h2>

    <div class="status-info">
        Logged in as: <b>${sessionScope.ownerEmail}</b>
    </div>

    <form action="UploadFileServlet" method="post" enctype="multipart/form-data">

        <div class="input-group">
            <label for="tableChoice">Choose Cloud Destination:</label>
            <select name="tableChoice" id="tableChoice" required>
                <option value="TABLE1">☁️ Cloud Storage 1 (Primary)</option>
                <option value="TABLE2">☁️ Cloud Storage 2 (Backup)</option>
                <option value="TABLE3">☁️ Cloud Storage 3 (Archive)</option>
            </select>
        </div>

        <div class="input-group">
            <label for="keyword">Custom Keyword (optional):</label>
            <input type="text" name="keyword" id="keyword" placeholder="Enter keyword">
        </div>

        <div class="input-group">
            <label for="file">Select File to Upload:</label>
            <input type="file" name="file" id="file" required>
        </div>

        <button type="submit">Upload & Encrypt File</button>
    </form>

    <div class="back-link-container">
        <a href="owner.jsp" class="back-link">← Back to Owner Portal</a>
    </div>
</div>

</body>
</html>
