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

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String Query = "SELECT * FROM userdetails WHERE email = ? AND PASSWORD = ?";

        try {
            con = Database.getConnection();
            PreparedStatement ps = con.prepareStatement(Query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // STORE EMAIL IN SESSION
                HttpSession session = request.getSession();
                session.setAttribute("email", email);

                response.sendRedirect("results.jsp");

            } else {
                response.sendRedirect("userlogin.jsp");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
