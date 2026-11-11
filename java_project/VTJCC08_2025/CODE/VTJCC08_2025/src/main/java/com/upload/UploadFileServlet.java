//package com.upload;
//
//import java.io.InputStream;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.Part;
//
//import com.DB.Database;
//import com.algo.AESUtil;
//
//@WebServlet("/UploadFileServlet")
//@MultipartConfig
//public class UploadFileServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
//		try {
//			// 🔹 Validate owner session
//			HttpSession session = request.getSession(false);
//			if (session == null || session.getAttribute("ownerEmail") == null) {
//				response.sendRedirect("owner_login.jsp");
//				return;
//			}
//
//			// 🔹 Owner email comes ONLY from session (secure)
//			String ownerEmail = (String) session.getAttribute("ownerEmail");
//			String tableChoice = request.getParameter("tableChoice"); // TABLE1/TABLE2/TABLE3
//
//			Part filePart = request.getPart("file");
//			String filename = filePart.getSubmittedFileName();
//			String filetype = filePart.getContentType();
//			InputStream is = filePart.getInputStream();
//			byte[] originalBytes = is.readAllBytes();
//
//			String base64Key = AESUtil.generateBase64Key();
//			String encryptedBase64 = AESUtil.encryptBase64(originalBytes, base64Key);
//
//			String targetTable;
//			switch (tableChoice) {
//			case "TABLE1":
//				targetTable = "uploaded_table1";
//				break;
//			case "TABLE2":
//				targetTable = "uploaded_table2";
//				break;
//			case "TABLE3":
//				targetTable = "uploaded_table3";
//				break;
//			default:
//				targetTable = "uploaded_table1";
//			}
//
//			String sql = "INSERT INTO " + targetTable
//					+ "(owner_email, filename, filetype, original_data, encrypted_data, secret_key) VALUES (?,?,?,?,?,?)";
//
//			try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
//
//				ps.setString(1, ownerEmail);
//				ps.setString(2, filename);
//				ps.setString(3, filetype);
//				ps.setBytes(4, originalBytes);
//				ps.setString(5, encryptedBase64);
//				ps.setString(6, base64Key); // owner-only
//				
//				ps.executeUpdate();
//			}
//
//			request.setAttribute("message",
//					"File uploaded to " + tableChoice + " and encrypted. Owner retains secret key.");
//			request.getRequestDispatcher("uploadmessage.jsp").forward(request, response);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			try {
//				request.setAttribute("message", "Upload failed: " + e.getMessage());
//				request.getRequestDispatcher("uploadmessage.jsp").forward(request, response);
//			} catch (Exception ex) {
//				/* ignore */ }
//		}
//	}
//}

package com.upload;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.Database;
import com.algo.AESUtil;

@WebServlet("/UploadFileServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 50) // 50MB limit
public class UploadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		try {
			// Validate owner session
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("ownerEmail") == null) {
				response.sendRedirect("owner_login.jsp");
				return;
			}

			String ownerEmail = (String) session.getAttribute("ownerEmail");
			String tableChoice = request.getParameter("tableChoice");

			// Get custom keyword
			String keyword = request.getParameter("keyword");
			if (keyword != null) {
				keyword = keyword.trim();
			}

			// File input
			Part filePart = request.getPart("file");
			if (filePart == null || filePart.getSize() == 0) {
				throw new Exception("No file selected");
			}

			String filename = filePart.getSubmittedFileName(); // original filename
			String filetype = filePart.getContentType();
			InputStream is = filePart.getInputStream();
			byte[] originalBytes = is.readAllBytes();

			// Encrypt file
			String base64Key = AESUtil.generateBase64Key();
			String encryptedBase64 = AESUtil.encryptBase64(originalBytes, base64Key);
//			String encryptedBase64 = AESUtil.encryptBase64(originalBytes, "TEMP");
			
			// Determine table
			String targetTable;
			switch (tableChoice) {
			case "TABLE1":
				targetTable = "uploaded_table1";
				break;
			case "TABLE2":
				targetTable = "uploaded_table2";
				break;
			case "TABLE3":
				targetTable = "uploaded_table3";
				break;
			default:
				targetTable = "uploaded_table1";
			}

//			 Insert into DB
			String sql = "INSERT INTO " + targetTable
					+ " (owner_email, filename, filetype, keyword, original_data, encrypted_data, secret_key) "
					+ "VALUES (?,?,?,?,?,?,?)";
//			String sql1 = "INSERT INTO " + targetTable
//					+ " (owner_email, filename, filetype, keyword, original_data, encrypted_data) "
//					+ "VALUES (?,?,?,?,?,?)";

			try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

				ps.setString(1, ownerEmail);
				ps.setString(2, filename);
				ps.setString(3, filetype);
				ps.setString(4, keyword);
				ps.setBytes(5, originalBytes);
				ps.setString(6, encryptedBase64);
				ps.setString(7, base64Key);

				ps.executeUpdate();
			}

			request.setAttribute("message",
					"File uploaded and encrypted successfully. Keyword: " + (keyword == null ? "None" : keyword));
			request.getRequestDispatcher("uploadmessage.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			try {
				request.setAttribute("message", "Upload failed: " + e.getMessage());
				request.getRequestDispatcher("uploadmessage.jsp").forward(request, response);
			} catch (Exception ex) {
				/* ignore */ }
		}
	}
}
