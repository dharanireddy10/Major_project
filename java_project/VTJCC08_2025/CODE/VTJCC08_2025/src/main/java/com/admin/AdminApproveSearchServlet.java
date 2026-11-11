//package com.admin;
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
//
//import com.DB.Database;
//
//@WebServlet("/AdminApproveSearchServlet")
//public class AdminApproveSearchServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int requestId = Integer.parseInt(req.getParameter("id"));
//		String action = req.getParameter("action");
//
//		try (Connection con = Database.getConnection()) {
//			if ("approve".equalsIgnoreCase(action)) {
//				// generate trapdoor
//				String trapdoor = "TDK-" + System.currentTimeMillis();
//
//				// update search_requests with trapdoor
//				try (PreparedStatement ps1 = con
//						.prepareStatement("UPDATE search_requests SET status='APPROVED', trapdoor_key=? WHERE id=?")) {
//					ps1.setString(1, trapdoor);
//					ps1.setInt(2, requestId);
//					ps1.executeUpdate();
//				}
//
//				// fetch category and keyword
//				String category = null;
//				String keyword = null;
//				try (PreparedStatement ps2 = con
//						.prepareStatement("SELECT * FROM search_requests WHERE id=?")) {
//					ps2.setInt(1, requestId);
//					try (ResultSet rs = ps2.executeQuery()) {
//						if (rs.next()) {
//							category = rs.getString("category");
//							keyword = rs.getString("keyword");
//						}
//					}
//				}
//
//				// determine table name
//				category = category.trim().replace(" ", "").toUpperCase();
//
//				String targetTable = switch (category) {
//				    case "TABLE1", "1" -> "uploaded_table1";
//				    case "TABLE2", "2" -> "uploaded_table2";
//				    case "TABLE3", "3" -> "uploaded_table3";
//				    default -> "uploaded_table1";
//				};
//
//
//				// apply trapdoor to matching rows in that table
////				try (PreparedStatement ps3 = con.prepareStatement("UPDATE " + targetTable
////						+ " SET trapdoor_key=?, trapdoor_status='APPROVED' WHERE LOWER(keyword) LIKE LOWER(?)")) {
////					ps3.setString(1, trapdoor);
////					ps3.setString(2, "%" + keyword + "%");
////					ps3.executeUpdate();
////				}
//
//				try (PreparedStatement ps3 = con.prepareStatement(
//				        "UPDATE " + targetTable +
//				        " SET trapdoor_key=?, trapdoor_status='APPROVED' " +
//				        " WHERE LOWER(filename) LIKE LOWER(?)")) {
//
//				    ps3.setString(1, trapdoor);
//				    ps3.setString(2, "%" + keyword + "%");
//
//				    int updated = ps3.executeUpdate();
//				    System.out.println("Rows updated in " + targetTable + ": " + updated);
//				}
//
//
//				req.setAttribute("message", "Search request approved. Trapdoor key: " + trapdoor);
//				req.getRequestDispatcher("adminnotification.jsp").forward(req, resp);
//
//
//			} else {
//				try (PreparedStatement ps = con
//						.prepareStatement("UPDATE search_requests SET status='REJECTED' WHERE id=?")) {
//					ps.setInt(1, requestId);
//					ps.executeUpdate();
//				}
//				req.setAttribute("message", "Search request rejected.");
//				req.getRequestDispatcher("adminnotification.jsp").forward(req, resp);
//
//			}
//		}
//		catch (Exception e) {
//			throw new ServletException(e);
//		}
//	}
//
//}

//package com.admin;
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
//
//import com.DB.Database;
//
//@WebServlet("/AdminApproveSearchServlet")
//public class AdminApproveSearchServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        int requestId = Integer.parseInt(req.getParameter("id"));
//        String action = req.getParameter("action");
//
//        try (Connection con = Database.getConnection()) {
//
//            // =========================
//            // APPROVE REQUEST
//            // =========================
//            if ("approve".equalsIgnoreCase(action)) {
//
//                // 1. Generate Trapdoor Key
//                String trapdoor = "TDK-" + System.currentTimeMillis();
//
//                // 2. Update search_requests table
//                PreparedStatement ps1 = con.prepareStatement(
//                        "UPDATE search_requests SET status='APPROVED', trapdoor_key=? WHERE id=?");
//                ps1.setString(1, trapdoor);
//                ps1.setInt(2, requestId);
//                ps1.executeUpdate();
//
//                // 3. Fetch category & keyword
//                String category = null;
//                String keyword = null;
//
//                PreparedStatement ps2 = con.prepareStatement(
//                        "SELECT category, keyword FROM search_requests WHERE id=?");
//                ps2.setInt(1, requestId);
//                ResultSet rs = ps2.executeQuery();
//
//                if (rs.next()) {
//                    category = rs.getString("category");
//                    keyword = rs.getString("keyword");
//                }
//
//                // 4. Decide target cloud table
//                category = category.toLowerCase().trim();
//                String targetTable;
//
//                if (category.contains("1")) {
//                    targetTable = "uploaded_table1";
//                }
//                else if (category.contains("2")) {
//                    targetTable = "uploaded_table2";
//                }
//                else if (category.contains("3")) {
//                    targetTable = "uploaded_table3";
//                }
//                else {
//                    throw new ServletException("Invalid category: " + category);
//                }
//
//                // Debug logs (VERY IMPORTANT)
//                System.out.println("Target Table  : " + targetTable);
//                System.out.println("Search Keyword: " + keyword);
//
//                // 5. Update uploaded_table (trapdoor)
//                PreparedStatement ps3 = con.prepareStatement(
//                        "UPDATE " + targetTable +
//                        " SET trapdoor_key=?, trapdoor_status='APPROVED' " +
//                        " WHERE LOWER(filename) LIKE LOWER(?)");
//
//                ps3.setString(1, trapdoor);
//                ps3.setString(2, "%" + keyword + "%");
//
//                int rows = ps3.executeUpdate();
//                System.out.println("Rows updated in " + targetTable + ": " + rows);
//
//                // 6. Response
//                req.setAttribute("message",
//                        "Search request approved successfully.<br>Trapdoor Key: <b>" + trapdoor + "</b>");
//                req.getRequestDispatcher("adminnotification.jsp").forward(req, resp);
//
//            }
//            // =========================
//            // REJECT REQUEST
//            // =========================
//            else {
//
//                PreparedStatement ps = con.prepareStatement(
//                        "UPDATE search_requests SET status='REJECTED' WHERE id=?");
//                ps.setInt(1, requestId);
//                ps.executeUpdate();
//
//                req.setAttribute("message", "Search request rejected.");
//                req.getRequestDispatcher("adminnotification.jsp").forward(req, resp);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new ServletException(e);
//        }
//    }
//}



package com.admin;

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

@WebServlet("/AdminApproveSearchServlet")
public class AdminApproveSearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(req.getParameter("id"));
        String action = req.getParameter("action");

        try (Connection con = Database.getConnection()) {

            /* ===========================
               APPROVE SEARCH REQUEST
               =========================== */
            if ("approve".equalsIgnoreCase(action)) {

                // 1. Generate trapdoor key
                String trapdoorKey = "TDK-" + System.currentTimeMillis();

                // 2. Update search_requests table
                PreparedStatement ps1 = con.prepareStatement(
                        "UPDATE search_requests SET status='APPROVED', trapdoor_key=? WHERE id=?");
                ps1.setString(1, trapdoorKey);
                ps1.setInt(2, requestId);
                ps1.executeUpdate();

                // 3. Fetch category & keyword
                String category = null;
                String keyword = null;

                PreparedStatement ps2 = con.prepareStatement(
                        "SELECT category, keyword FROM search_requests WHERE id=?");
                ps2.setInt(1, requestId);

                ResultSet rs = ps2.executeQuery();
                if (rs.next()) {
                    category = rs.getString("category");
                    keyword = rs.getString("keyword");
                }

                if (category == null || keyword == null) {
                    throw new ServletException("Category or keyword is null");
                }

                // 4. Normalize category
                category = category.trim().toLowerCase();

                String targetTable;

                if (category.contains("table1") || category.equals("1")) {
                    targetTable = "uploaded_table1";
                }
                else if (category.contains("table2") || category.equals("2")) {
                    targetTable = "uploaded_table2";
                }
                else if (category.contains("table3") || category.equals("3")) {
                    targetTable = "uploaded_table3";
                }
                else {
                    throw new ServletException("Invalid category: " + category);
                }


                // DEBUG LOGS
                System.out.println("===== ADMIN APPROVE DEBUG =====");
                System.out.println("Request ID    : " + requestId);
                System.out.println("Category      : " + category);
                System.out.println("Target Table  : " + targetTable);
                System.out.println("Keyword       : " + keyword);
                System.out.println("Trapdoor Key  : " + trapdoorKey);

                // 5. Update cloud table (MATCH filename OR keyword)
                PreparedStatement ps3 = con.prepareStatement(
                        "UPDATE " + targetTable +
                        " SET trapdoor_key=?, trapdoor_status='APPROVED' " +
                        " WHERE LOWER(filename) LIKE LOWER(?) " +
                        " OR LOWER(keyword) LIKE LOWER(?)");

                ps3.setString(1, trapdoorKey);
                ps3.setString(2, "%" + keyword + "%");
                ps3.setString(3, "%" + keyword + "%");

                int updatedRows = ps3.executeUpdate();
                System.out.println("Rows Updated  : " + updatedRows);
                System.out.println("================================");

                // 6. Response
                req.setAttribute("message",
                        "Search request approved successfully.<br>" +
                        "Trapdoor Key: <b>" + trapdoorKey + "</b><br>" +
                        "Updated Files: " + updatedRows);

                req.getRequestDispatcher("adminnotification.jsp")
                   .forward(req, resp);
            }

            /* ===========================
               REJECT SEARCH REQUEST
               =========================== */
            else {

                PreparedStatement ps = con.prepareStatement(
                        "UPDATE search_requests SET status='REJECTED' WHERE id=?");
                ps.setInt(1, requestId);
                ps.executeUpdate();

                req.setAttribute("message", "Search request rejected.");
                req.getRequestDispatcher("adminnotification.jsp")
                   .forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Admin approval failed", e);
        }
    }
}
