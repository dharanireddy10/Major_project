package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.Database;

@WebServlet("/SendCloudAccessServlet")
public class SendCloudAccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String userEmail = (String) session.getAttribute("email");

        String fileId = req.getParameter("id");
        String cloud = req.getParameter("cloud");

        try (Connection con = Database.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO cloud_access_requests(user_email, file_id, cloud) VALUES (?,?,?)");
            ps.setString(1, userEmail);
            ps.setInt(2, Integer.parseInt(fileId));
            ps.setString(3, cloud);
            ps.executeUpdate();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        req.setAttribute("message", "Cloud access request sent successfully");
        req.getRequestDispatcher("message.jsp").forward(req, resp);
    }
}
