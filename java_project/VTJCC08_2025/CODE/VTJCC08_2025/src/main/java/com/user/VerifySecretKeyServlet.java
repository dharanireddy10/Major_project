package com.user;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/VerifySecretKeyServlet")
public class VerifySecretKeyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String enteredKey = req.getParameter("entered_key");
        String originalKey = req.getParameter("original_key");
        String keyword = req.getParameter("keyword");
        String table = req.getParameter("category");

        if (!enteredKey.equals(originalKey)) {
            req.setAttribute("message", "Invalid Secret Key!");
            req.getRequestDispatcher("message.jsp").forward(req, resp);
            return;
        }

        try (Connection con = Database.getConnection()) {

            String sql = "SELECT filename, encrypted_data FROM " + table + " WHERE keyword=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, keyword);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                req.setAttribute("message", "File not found!");
                req.getRequestDispatcher("message.jsp").forward(req, resp);
                return;
            }

            req.setAttribute("filename", rs.getString("filename"));
            req.setAttribute("encrypted_data", rs.getString("encrypted_data"));
            req.setAttribute("secret_key", originalKey);

            req.getRequestDispatcher("downloadOriginal.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}