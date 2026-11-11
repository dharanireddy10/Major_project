package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;

/**
 * Servlet implementation class AdminUserDataServlet
 */

@WebServlet("/AdminUserDataServlet")
public class AdminUserDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserDataServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Connection con = null;
		PrintWriter out = resp.getWriter();

		try {
			con = Database.getConnection();
			String sql = "SELECT u.name, u.email, u.mobileno, u.gender, u.address,"
					+ " sr.keyword AS keyword, COUNT(sr.id) AS search_requests" + " FROM userdetails u"
					+ " LEFT JOIN search_requests sr ON u.email = sr.user_email" + " GROUP BY u.email";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			req.setAttribute("userData", rs);
			req.getRequestDispatcher("admin_userdata.jsp").forward(req, resp);

		} catch (Exception e) {
			out.println("Error: " + e);
		}
	}
}