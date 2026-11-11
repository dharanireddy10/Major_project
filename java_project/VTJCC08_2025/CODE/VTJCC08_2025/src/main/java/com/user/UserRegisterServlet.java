package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;


@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mobileno = request.getParameter("mobileno");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		Connection con = null;
		String insert = "Insert into userdetails(name,email,password,mobileno,gender,address) values (?,?,?,?,?,?)";
		
		if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
			 request.setAttribute("error", "Invalid email format!");
			 request.getRequestDispatcher("ownerRegister.jsp").forward(request, response);
	            return;
	        }

	        // PASSWORD VALIDATION
	        String passwordRegex = "^(?=.*[A-Z])(?=.*[a-z]+)(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$";
	        if (!password.matches(passwordRegex)) {
	        	request.setAttribute("error",
	                "Password must contain 1 uppercase letter, lowercase letters, numbers and a special character!");
	        	request.getRequestDispatcher("ownerRegister.jsp").forward(request, response);
	            return;
	        }

	        // MOBILE NUMBER VALIDATION
	        if (!mobileno.matches("^89\\d{8}$")) {
	        	request.setAttribute("error", "Phone number must start with 89 and contain exactly 10 digits!");
	        	request.getRequestDispatcher("ownerRegister.jsp").forward(request, response);
	            return;
	        }
	        
		try {

			con = Database.getConnection();
			PreparedStatement pst = con.prepareStatement(insert);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, password);
			pst.setString(4, mobileno);
			pst.setString(5, gender);
			pst.setString(6, address);

			int row = pst.executeUpdate();

			if (row > 0) {
				request.setAttribute("success", "Application submitted! Wait for admin approval.");
			}
			 request.getRequestDispatcher("userregister.jsp").forward(request, response);
		} catch (MySQLIntegrityConstraintViolationException e) {
			 request.setAttribute("error", "❌ Email already exists! Try another.");
			 request.getRequestDispatcher("userregister.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
