<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secret Key Approval</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
/* ================== GLOBAL ================== */
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
    color: #fff;
}

/* ================== HEADER ================== */
.header-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
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
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}

.nav-title {
    font-size: 18px;
    font-weight: 700;
}

/* ================== MAIN CONTAINER ================== */
.container {
    width: 90%;
    max-width: 900px;
    margin: 30px auto;
    padding: 30px;
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(12px);
    border-radius: 18px;
    box-shadow: 0 10px 35px rgba(0,0,0,0.4);
    animation: fadeIn 1s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(15px); }
    to { opacity: 1; transform: translateY(0); }
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    font-size: 24px;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}

/* ================== TABLE ================== */
table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}

th, td {
    padding: 12px 10px;
    border-bottom: 1px solid rgba(255,255,255,0.3);
}

th {
    background: rgba(255,255,255,0.3);
}

tr:hover td {
    background: rgba(255,255,255,0.15);
}

/* ================== BUTTONS ================== */
button {
    padding: 6px 14px;
    border-radius: 8px;
    border: none;
    font-weight: 600;
    cursor: pointer;
    color: #fff;
    background: linear-gradient(45deg, #3498db, #2c80b4);
    transition: 0.3s;
}

button:hover {
    transform: scale(1.05);
    box-shadow: 0 0 10px rgba(52,152,219,0.7);
}

/* ================== BACK LINK ================== */
.back-link-container {
    margin-top: 20px;
    text-align: center;
}

.back-link {
    display: inline-block;
    text-decoration: none;
    padding: 10px 20px;
    font-weight: 600;
    border-radius: 10px;
    background: rgba(0,0,0,0.5);
    border: 1px solid rgba(255,255,255,0.3);
    color: #fff;
    transition: 0.3s;
}

.back-link:hover {
    background: rgba(0,0,0,0.7);
}

/* ================== FOOTER ================== */
.footer {
    margin-top: 30px;
    text-align: center;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 2px 6px rgba(0,0,0,0.6);
}
</style>
</head>
<body>

<!-- ================== HEADER ================== -->
<div class="header-wrapper">
    <div class="page-title">SECURE KEYWORD SEARCH AND KEY MANAGEMENT SCHEME IN CLOUD ENVIRONMENTS</div>
    <div class="header-bar">
        <div class="nav-title">Secret Key Requests</div>
    </div>
</div>

<!-- ================== MAIN CONTAINER ================== -->
<div class="container">
    <h2>🔑 Secret Key Requests</h2>

    <table>
        <tr>
            <th>User Email</th>
            <th>Category</th>
            <th>Keyword</th>
            <th>Trapdoor Key</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <c:forEach var="req" items="${requestList}">
            <tr>
                <td>${req.user_email}</td>
                <td>${req.category}</td>
                <td>${req.keyword}</td>
                <td>${req.trapdoor_key}</td>
                <td>${req.status}</td>
                <td>
                    <form action="ApproveSecretKeyServlet" method="post">
                        <input type="hidden" name="request_id" value="${req.id}">
                        <input type="hidden" name="keyword" value="${req.keyword}">
                        <input type="hidden" name="trapdoor_key" value="${req.trapdoor_key}">
                        <input type="hidden" name="category" value="${req.category}">
                        <button type="submit">Approve</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="back-link-container">
        <a href="cloud_dashboard.jsp" class="back-link">← Back</a>
    </div>
</div>

<!-- ================== FOOTER ================== -->
<div class="footer">© 2025 Cloud Security System</div>

</body>
</html>
