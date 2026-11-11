package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;

/**
 * Servlet implementation class AdminOwnerDataServlet
 */

@WebServlet("/AdminOwnerDataServlet")
public class AdminOwnerDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminOwnerDataServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection con = null;
		PrintWriter out = resp.getWriter();

		try {
			con = Database.getConnection();

			String sql = "SELECT o.NAME, o.email, o.mobileno, o.gender, o.address,"
					+ " COALESCE(f.files_uploaded,0) AS files_uploaded,"
					+ " COALESCE(s.secret_key,'NOT ASSIGNED') AS secret_key" + " FROM ownerdetails o" + " LEFT JOIN ("
					+ "   SELECT owner_email, COUNT(*) AS files_uploaded" + "   FROM ("
					+ "       SELECT owner_email FROM uploaded_table1" + "       UNION ALL"
					+ "       SELECT owner_email FROM uploaded_table2" + "       UNION ALL"
					+ "       SELECT owner_email FROM uploaded_table3" + "   ) t1 GROUP BY owner_email"
					+ " ) f ON o.email = f.owner_email" + " LEFT JOIN (" + "   SELECT owner_email, secret_key"
					+ "   FROM (" + "       SELECT owner_email, secret_key FROM uploaded_table1" + "       UNION ALL"
					+ "       SELECT owner_email, secret_key FROM uploaded_table2" + "       UNION ALL"
					+ "       SELECT owner_email, secret_key FROM uploaded_table3" + "   ) t2 GROUP BY owner_email"
					+ " ) s ON o.email = s.owner_email";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			req.setAttribute("ownerData", rs);
			req.getRequestDispatcher("admin_ownerdata.jsp").forward(req, resp);

		} catch (Exception e) {
			out.println("Error: " + e);
		}
	}
}