package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;

@WebServlet("/AdminownerApprove")

public class AdminownerApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//        String action = request.getParameter("action");
//
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//
//        try {
//            Connection con = Database.getConnection();
//
//            if (action.equals("approve")) {
//
//                PreparedStatement ps = con.prepareStatement(
//                    "UPDATE ownerdetails SET status='APPROVED' WHERE id=?"
//                );
//                ps.setInt(1, id);
//                ps.executeUpdate();
//
//                out.println("<h2>Application Approved!</h2>");
//
//            } else if (action.equals("reject")) {
//
//                PreparedStatement ps = con.prepareStatement(
//                    "DELETE FROM ownerdetails WHERE id=?"
//                );
//                ps.setInt(1, id);
//                ps.executeUpdate();
//
//                out.println("<h2>Application Rejected & Deleted!</h2>");
//            }
//
//        } 
	     int id = Integer.parseInt(request.getParameter("id"));
	        String action = request.getParameter("action");

	        try {
	            Connection con = Database.getConnection();

	            String message = "";

	            if (action.equals("approve")) {
	                PreparedStatement ps = con.prepareStatement(
	                    "UPDATE ownerdetails SET status='APPROVED' WHERE id=?"
	                );
	                ps.setInt(1, id);
	                ps.executeUpdate();

	                message = "Owner Application Approved Successfully!";

	            } else if (action.equals("reject")) {
	                PreparedStatement ps = con.prepareStatement(
	                    "DELETE FROM ownerdetails WHERE id=?"
	                );
	                ps.setInt(1, id);
	                ps.executeUpdate();

	                message = "Owner Application Rejected and Deleted!";
	            }

	            // Redirect with message
	            response.sendRedirect("admin_message.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));

	        }catch (Exception e) {
            e.printStackTrace();
        }
	}

}
