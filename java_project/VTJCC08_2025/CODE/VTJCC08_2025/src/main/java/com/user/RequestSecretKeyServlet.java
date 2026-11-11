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

import com.DB.Database;

//@WebServlet("/RequestSecretKeyServlet")
//public class RequestSecretKeyServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
////	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////
////		String keyword = req.getParameter("keyword");
////		String trapdoor = req.getParameter("trapdoor_key");
////
////		String[] tables = { "uploaded_table1", "uploaded_table2", "uploaded_table3" };
////
////		try (Connection con = Database.getConnection()) {
////
////			for (String table : tables) {
////				String sql = "SELECT secret_key FROM " + table + " WHERE keyword=? AND trapdoor_key=?";
////				try (PreparedStatement ps = con.prepareStatement(sql)) {
////					ps.setString(1, keyword);
////					ps.setString(2, trapdoor);
////
////					ResultSet rs = ps.executeQuery();
////					if (rs.next()) {
////						
////						
////				        String email = req.getSession().getAttribute("email").toString();
////				        String category = req.getParameter("category"); // cloud1 / cloud2
////
////				        
////				        
////				        req.setAttribute("trapdoor_key", trapdoor);
////				        req.setAttribute("category", table);
////						
////						req.setAttribute("keyword", keyword);
////						req.setAttribute("encrypted_data", req.getParameter("encrypted_data"));
////						req.setAttribute("cloud", table);
////						
////						req.getRequestDispatcher("downloadOriginal.jsp").forward(req, resp);
////						return;
////					}
////				}
////			}
////
////			req.setAttribute("message", "Secret key not available!");
////			req.getRequestDispatcher("message.jsp").forward(req, resp);
////
////		} catch (Exception e) {
////			throw new ServletException(e);
////		}
////	}
////}
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		String keyword = req.getParameter("keyword");
//		String trapdoor = req.getParameter("trapdoor_key");
//
//		String[] tables = { "uploaded_table1", "uploaded_table2" , "uploaded_table3" };
//
//		try (Connection con = Database.getConnection()) {
//
//			for (String table : tables) {
//
//				String sql = "SELECT filename, encrypted_data, secret_key " + "FROM " + table
//						+ " WHERE keyword=? AND trapdoor_key=?";
//
//				PreparedStatement ps = con.prepareStatement(sql);
//				ps.setString(1, keyword);
//				ps.setString(2, trapdoor);
//
//				ResultSet rs = ps.executeQuery();
//
//				if (rs.next()) {
//
//					// ✅ PASS REQUIRED DATA TO JSP
//					req.setAttribute("filename", rs.getString("filename"));
//					req.setAttribute("encrypted_data", rs.getString("encrypted_data"));
//					req.setAttribute("secret_key", rs.getString("secret_key"));
//
//					req.getRequestDispatcher("downloadOriginal.jsp").forward(req, resp);
//					return;
//				}
//			}
//
//// ✅ FIXED MESSAGE ATTRIBUTE
//			req.setAttribute("message", "Secret key not found");
//			req.getRequestDispatcher("message.jsp").forward(req, resp);
//
//		} catch (Exception e) {
//			throw new ServletException(e);
//		}
//	}
//}

@WebServlet("/RequestSecretKeyServlet")
public class RequestSecretKeyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        String trapdoor = req.getParameter("trapdoor_key");
        String category = req.getParameter("table");
        // Logged-in user email
        String userEmail = (String) req.getSession().getAttribute("email");

        // Optional: category / cloud name
//        String category = "table"; // or uploaded_table1 / uploaded_table2

        try (Connection con = Database.getConnection()) {

            // ✅ Check if already requested
            String checkSql = "SELECT id FROM search_request_approvals "
                            + "WHERE user_email=? AND keyword=? AND trapdoor_key=?";

            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setString(1, userEmail);
            checkPs.setString(2, keyword);
            checkPs.setString(3, trapdoor);
//            checkPs.setString(4, category);

            ResultSet checkRs = checkPs.executeQuery();

            if (checkRs.next()) {
                req.setAttribute("message", "You have already requested the secret key.");
                req.getRequestDispatcher("RequestSecretKeyServletmessage.jsp").forward(req, resp);
                return;
            }

            // ✅ Insert PENDING request
            String insertSql = "INSERT INTO search_request_approvals "
                    + "(user_email, category, keyword, trapdoor_key, status) "
                    + "VALUES (?, ?, ?, ?, 'PENDING')";

            PreparedStatement ps = con.prepareStatement(insertSql);
            ps.setString(1, userEmail);
            ps.setString(2, category);
            ps.setString(3, keyword);
            ps.setString(4, trapdoor);

            ps.executeUpdate();

            req.setAttribute("message", "Secret key request sent successfully. Please wait for approval.");
            req.getRequestDispatcher("RequestSecretKeyServletmessage.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

