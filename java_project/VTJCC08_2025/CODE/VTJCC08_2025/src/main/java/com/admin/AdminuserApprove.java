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

/**
 * Servlet implementation class AdminuserApprove
 */
@WebServlet("/AdminuserApprove")
public class AdminuserApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        try {
            Connection con = Database.getConnection();
            String message = "";

            if (action.equals("approve")) {

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE userdetails SET status='APPROVED' WHERE id=?"
                );
                ps.setInt(1, id);
                ps.executeUpdate();

                message = "User Application Approved Successfully!";

            } else if (action.equals("reject")) {

                PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM userdetails WHERE id=?"
                );
                ps.setInt(1, id);
                ps.executeUpdate();

                message = "User Application Rejected and Deleted!";
            }

            // Redirect with message
            response.sendRedirect("admin_user_message.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
