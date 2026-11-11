package com.user;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/SearchFileServlet")
public class SearchFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        String email = (String) req.getSession().getAttribute("email");

        try (Connection con = Database.getConnection()) {

            String sql = "SELECT * FROM search_request_approvals "
                       + "WHERE user_email=? AND keyword=? AND status='APPROVED'";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, keyword);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                req.setAttribute("message", "Your request is not approved yet!");
                req.getRequestDispatcher("message.jsp").forward(req, resp);
                return;
            }

            // Approved
            req.setAttribute("keyword", keyword);
            req.setAttribute("category", rs.getString("category"));
            req.setAttribute("secret_key", rs.getString("secret_key"));

            req.getRequestDispatcher("enterSecretKey.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}