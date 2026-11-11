package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/GetTrapdoorKeyServlet")
public class GetTrapdoorKeyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        String userEmail = (String) req.getSession().getAttribute("email");

        try (Connection con = Database.getConnection()) {

            String sql = "SELECT trapdoor_key FROM search_requests "
                       + "WHERE keyword=? AND user_email=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, keyword);
            ps.setString(2, userEmail);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("keyword", keyword);
                req.setAttribute("trapdoor_key", rs.getString("trapdoor_key"));
                req.getRequestDispatcher("showTrapdoor.jsp")
                   .forward(req, resp);
            } else {
                req.setAttribute("message", "Trapdoor key not found for this keyword");
                req.getRequestDispatcher("message.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
