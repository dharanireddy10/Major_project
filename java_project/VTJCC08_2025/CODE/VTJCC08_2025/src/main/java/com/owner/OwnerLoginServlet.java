package com.owner;

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


@WebServlet("/OwnerLoginServlet")
public class OwnerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		

		Connection con = null;
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		session.setAttribute("ownerEmail", email);
		String Query = "Select * from ownerdetails where email = ? and password = ? ";
		
		try {
		con = Database.getConnection();
		PreparedStatement ps = con.prepareStatement(Query);
		ps.setString(1, email);
		ps.setString(2, password);

		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			response.sendRedirect("ownerupload.jsp");
		} else {
			response.sendRedirect("ownerlogin.jsp");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
