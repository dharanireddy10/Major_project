//package com.user;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
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
//@WebServlet("/UserSearchResultServlet")
//public class UserSearchResultServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		HttpSession session = req.getSession(false);
//
//		if (session == null || session.getAttribute("email") == null) {
//			resp.sendRedirect("login.jsp");
//			return;
//		}
//
//		String loggedUserEmail = (String) session.getAttribute("email");
//
//		String category = req.getParameter("category");
//		String keyword = req.getParameter("keyword");
//		String trapdoorKey = req.getParameter("trapdoorKey");
//
//		String targetTable = switch (category) {
//		case "TABLE1" -> "uploaded_table1";
//		case "TABLE2" -> "uploaded_table2";
//		case "TABLE3" -> "uploaded_table3";
//		default -> "uploaded_table1";
//		};
//
//		String sql = "SELECT id, owner_email, filename, filetype, encrypted_data, trapdoor_status FROM " + targetTable
//				+ " WHERE keywords LIKE ? AND trapdoor_key = ?";
//
//		try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
//
//			ps.setString(1, "%" + keyword + "%");
//			ps.setString(2, trapdoorKey);
//
//			ResultSet rs = ps.executeQuery();
//			req.setAttribute("results", rs);
//			req.setAttribute("category", category); // pass category for download form
//			req.getRequestDispatcher("usersearchresults.jsp").forward(req, resp);
//
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

@WebServlet("/UserSearchResultServlet")
public class UserSearchResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String filename = req.getParameter("filename");
        String trapdoorKey = req.getParameter("trapdoorKey");

        // Tables to check automatically
        String[] tables = { "uploaded_table1", "uploaded_table2", "uploaded_table3" };

        ResultSet rs = null;
        String matchedTable = null;

        try (Connection con = Database.getConnection()) {

            for (String table : tables) {

                String sql = "SELECT id, owner_email, filename, filetype, encrypted_data, trapdoor_status "
                           + "FROM " + table + " WHERE filename = ? AND trapdoor_key = ?";

                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, filename);
                ps.setString(2, trapdoorKey);

                rs = ps.executeQuery();

                if (rs != null && rs.next()) {
                    matchedTable = table;
                    req.setAttribute("result", rs);
                    req.setAttribute("table", matchedTable);
                    req.getRequestDispatcher("usersearchresults.jsp").forward(req, resp);
                    return;
                }
            }

            // If no table matched
            req.setAttribute("message", "No encrypted file found with given filename and trapdoor key.");
            req.getRequestDispatcher("usersearchresults.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}


//@WebServlet("/UserSearchResultServlet")
//public class UserSearchResultServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////        String category = req.getParameter("category");
////        String keyword = req.getParameter("keyword");
////        String trapdoorKey = req.getParameter("trapdoorKey");
//        
//        HttpSession session = req.getSession(false);
//
//        if (session == null || session.getAttribute("email") == null) {
//            resp.sendRedirect("login.jsp");
//            return;
//        }
//
//        String loggedUserEmail = (String) session.getAttribute("email");
//
//        // 🔹 User Input
//        String category = req.getParameter("category");
//        String filename = req.getParameter("filename");
//        String trapdoorKey = req.getParameter("trapdoorKey");
//        
//        String targetTable = switch (category) {
//            case "TABLE1" -> "uploaded_table1";
//            case "TABLE2" -> "uploaded_table2";
//            case "TABLE3" -> "uploaded_table3";
//            default -> "uploaded_table1";
//        };
//
//        String sql = "SELECT * FROM " + targetTable +
//                " WHERE filename LIKE ? AND trapdoor_key=?";
//
//
//        try (Connection con = Database.getConnection())
//             {
//
//         
//            
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, "%" + filename + "%");
//            ps.setString(2, trapdoorKey);
//
//
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                req.setAttribute("fileId", rs.getInt("id"));
//                req.setAttribute("filename", rs.getString("filename"));
//                req.setAttribute("owner", rs.getString("owner_email"));
//                req.setAttribute("secret_key", rs.getString("secret_key"));
//                req.setAttribute("encrypted_data", rs.getString("encrypted_data"));
//                req.setAttribute("uploaded_at", rs.getString("uploaded_at"));
//                
//                req.setAttribute("category", category);
//                req.setAttribute("loggedUser", loggedUserEmail);
//                req.getRequestDispatcher("download.jsp").forward(req, resp);
//            } else {
//                req.setAttribute("message", "No matching file found.");
//                req.setAttribute("loggedUser", loggedUserEmail);
//                req.getRequestDispatcher("message.jsp").forward(req, resp);
//            }
//
//        } catch (Exception e) {
//            throw new ServletException(e);
//        }
//    }
//}
