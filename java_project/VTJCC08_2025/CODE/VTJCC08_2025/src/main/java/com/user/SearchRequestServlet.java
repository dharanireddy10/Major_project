//package com.user;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.DB.Database;
//
//@WebServlet("/SearchRequestServlet")
//public class SearchRequestServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////		String userEmail = req.getParameter("userEmail");
////		String category = req.getParameter("category");
////		String keyword = req.getParameter("keyword");
////		
//		HttpSession session = req.getSession(false);
//
//        if (session == null || session.getAttribute("email") == null) {
//            resp.sendRedirect("login.jsp"); // session expired
//            return;
//        }
//
//        // 🔹 Email from session
//        String userEmail = (String) session.getAttribute("email");
//
//        // Other fields
//        String category = req.getParameter("category");
//        String fileName = req.getParameter("filename");
//		
//		try (Connection con = Database.getConnection();
//				PreparedStatement ps = con.prepareStatement(
//						"INSERT INTO search_requests(user_email, category, filename) VALUES (?, ?, ?)")) {
//			ps.setString(1, userEmail);
//			ps.setString(2, category);
//			ps.setString(3, fileName);
//			ps.executeUpdate();
//
//			req.setAttribute("message", "Search request submitted. Wait for admin approval.");
//			req.getRequestDispatcher("message.jsp").forward(req, resp);
//		} catch (Exception e) {
//			throw new ServletException(e);
//		}
//
//	}
//
//}

package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.Database;

@WebServlet("/SearchRequestServlet")
public class SearchRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("email") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		String userEmail = (String) session.getAttribute("email");
		String keyword = req.getParameter("keyword");

		 String[] tables = { 
		            "uploaded_table1", 
		            "uploaded_table2", 
		            "uploaded_table3" 
		        };
		String foundTable = null;

		try (Connection con = Database.getConnection()) {

			// 🔎 Check each table automatically
			for (String table : tables) {
				String sql = "SELECT keyword FROM " + table + " WHERE keyword = ?";
				try (PreparedStatement ps = con.prepareStatement(sql)) {
					ps.setString(1, keyword);
					ResultSet rs = ps.executeQuery();

					if (rs.next()) {
						foundTable = table;
						break;
					}
				}
			}

			// ❌ File not found in any table
			if (foundTable == null) {
				req.setAttribute("message", "No file found in any table.");
				req.getRequestDispatcher("searchrequestmessage.jsp").forward(req, resp);
				return;
			}

			// ✔ Insert search request with matched table
			String insert = "INSERT INTO search_requests(user_email, category, keyword) VALUES (?, ?, ?)";
			try (PreparedStatement psInsert = con.prepareStatement(insert)) {
				psInsert.setString(1, userEmail);
				psInsert.setString(2, foundTable);
				psInsert.setString(3, keyword);
				psInsert.executeUpdate();
			}

			req.setAttribute("message", "File found in " + foundTable + ". Request submitted.");
			req.getRequestDispatcher("searchrequestmessage.jsp").forward(req, resp);

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
