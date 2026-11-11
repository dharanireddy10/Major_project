<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Encrypted File Details</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
	rel="stylesheet">

<style>
/* ================== GLOBAL STYLES ================== */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	background: url('images/cloud.jpg') no-repeat center center/cover;
	padding-top: 110px; /* space for fixed header */
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
}

/* ================== HEADER WRAPPER ================== */
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
	height: 60px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 40px;
	background: rgba(0, 0, 0, 0.5);
	backdrop-filter: blur(10px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
}

.nav-title {
	font-size: 18px;
	font-weight: 700;
	color: #fff;
}

/* ================== MAIN CONTAINER ================== */
.container {
	width: 90%;
	max-width: 700px;
	background: rgba(255, 255, 255, 0.15);
	padding: 40px;
	border-radius: 20px;
	backdrop-filter: blur(10px);
	box-shadow: 0px 10px 40px rgba(0, 0, 0, 0.5);
	text-align: center;
	animation: fadeIn 1.2s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h2 {
	font-size: 30px;
	font-weight: 600;
	margin-bottom: 25px;
	text-shadow: 0 2px 6px rgba(0, 0, 0, 0.6);
}

.status-info {
	font-size: 14px;
	margin-bottom: 25px;
	opacity: 0.85;
}

/* Graphic area */
.graphic-area {
	margin-bottom: 25px;
}

.graphic-area p {
	font-size: 14px;
	font-weight: 300;
	text-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
}

/* File Information Section */
.file-details {
	background: rgba(0, 0, 0, 0.3);
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 25px;
}

.file-details p {
	margin: 5px 0;
	font-size: 16px;
	font-weight: 300;
}

.file-details b {
	font-weight: 600;
	color: #f39c12; /* Amber highlight */
}

/* Encrypted Data Textarea */
textarea {
	width: 100%;
	min-height: 180px;
	padding: 15px;
	border: 1px solid rgba(255, 255, 255, 0.4);
	border-radius: 8px;
	background: rgba(0, 0, 0, 0.4); /* Darker background */
	color: #ccffcc; /* Light green font for encrypted data */
	box-sizing: border-box;
	font-family: monospace;
	font-size: 14px;
	resize: vertical;
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.5);
}

/* Request Secret Key Button */
button[type="submit"] {
	background: linear-gradient(45deg, #3498db, #5dade2);
	color: white;
	padding: 12px 25px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
	font-weight: 600;
	transition: background 0.3s, transform 0.3s;
	margin-top: 25px;
	box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
}

button[type="submit"]:hover {
	background: linear-gradient(45deg, #2980b9, #5499c7);
	transform: translateY(-2px);
}

/* Back link */
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
	background: rgba(0, 0, 0, 0.4);
	border-radius: 10px;
	transition: 0.3s;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.back-link:hover {
	background: rgba(0, 0, 0, 0.6);
}

/* Footer */
.footer {
	margin-top: 30px;
	text-align: center;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 2px 6px rgba(0, 0, 0, 0.6);
}
</style>
</head>
<body>

	<!-- ================= HEADER ================= -->
	<div class="header-wrapper">
		<div class="page-title">SECURE KEYWORD SEARCH AND KEY MANAGEMENT
			SCHEME IN CLOUD ENVIRONMENTS</div>

		<div class="header-bar">
			<div class="nav-title">Encrypted File Details</div>
		</div>
	</div>

	<!-- ================= MAIN CONTAINER ================= -->
	<div>
		<div class="container">
			<h2>☁️ Encrypted File Details</h2>

			<div class="status-info">Logged in as:
				**${sessionScope.email}**</div>

			<div class="graphic-area">
				<p>Encrypted data retrieved. Request key from **Cloud.jsp** for
					decryption.</p>
			</div>

			<div class="file-details">
				<p>
					<b>Keyword:</b> ${keyword}
				</p>
				<p>
					<b>table:</b> ${table}
				</p>
				<p>
					<b>Trapdoor Key:</b> ${trapdoor_key}
				</p>
			</div>

			<p style="margin-bottom: 8px; font-weight: 500;">Encrypted
				Content:</p>
			<textarea readonly>${encrypted_data}</textarea>

			<form action="RequestSecretKeyServlet" method="post">
				<input type="hidden" name="keyword" value="${keyword}">
				<input type="hidden" name="table" value="${table}">
				 <input
					type="hidden" name="trapdoor_key" value="${trapdoor_key}">
				<input type="hidden" name="encrypted_data" value="${encrypted_data}">
				<button type="submit">Request Secret Key for Decryption</button>
			</form>

			<div class="back-link-container">
				<a href="results.jsp" class="back-link">← Back to
					Activities</a>
			</div>
		</div>

		<!-- ================= FOOTER ================= -->
		<div class="footer">© 2025 Cloud Security System</div>
	</div>
</body>
</html>
