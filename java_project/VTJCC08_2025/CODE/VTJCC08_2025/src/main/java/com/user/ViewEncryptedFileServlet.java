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

import com.DB.Database;


@WebServlet("/ViewEncryptedFileServlet")
public class ViewEncryptedFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        String trapdoor = req.getParameter("trapdoor");

        try (Connection con = Database.getConnection()) {

            // ✅ STEP 1: Validate trapdoor key
            String verifySql =
                "SELECT 1 FROM search_requests WHERE keyword=? AND trapdoor_key=?";

            PreparedStatement vps = con.prepareStatement(verifySql);
            vps.setString(1, keyword);
            vps.setString(2, trapdoor);

            ResultSet vrs = vps.executeQuery();

            if (!vrs.next()) {
                req.setAttribute("message", "Invalid Trapdoor Key!");
                req.getRequestDispatcher("message.jsp").forward(req, resp);
                return;
            }

            // ✅ STEP 2: Fetch encrypted file by keyword ONLY
            String[] tables = { "uploaded_table1", "uploaded_table2", "uploaded_table3" };

            for (String table : tables) {
                String fileSql =
                    "SELECT encrypted_data FROM " + table + " WHERE keyword=?";

                PreparedStatement fps = con.prepareStatement(fileSql);
                fps.setString(1, keyword);

                ResultSet frs = fps.executeQuery();
                if (frs.next()) {
                	
                	req.setAttribute("table", table);
                    req.setAttribute("keyword", keyword);
                    req.setAttribute("trapdoor_key", trapdoor);
                    req.setAttribute("encrypted_data", frs.getString("encrypted_data"));

                    req.getRequestDispatcher("showEncrypted.jsp")
                       .forward(req, resp);
                    return;
                }
            }

            req.setAttribute("message", "File not found!");
            req.getRequestDispatcher("message.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
