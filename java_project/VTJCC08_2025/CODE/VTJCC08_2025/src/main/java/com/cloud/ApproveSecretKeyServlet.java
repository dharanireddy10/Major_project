package com.cloud;

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

@WebServlet("/ApproveSecretKeyServlet")
public class ApproveSecretKeyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(req.getParameter("request_id"));
        String keyword = req.getParameter("keyword");
        String trapdoor = req.getParameter("trapdoor_key");
        String category = req.getParameter("category"); // uploaded_table1,2,3

        try (Connection con = Database.getConnection()) {

            // 🔹 Step 1: Fetch secret key from uploaded table
            String fetchSql = "SELECT secret_key FROM " + category
                    + " WHERE keyword=? AND trapdoor_key=?";

            PreparedStatement fetchPs = con.prepareStatement(fetchSql);
            fetchPs.setString(1, keyword);
            fetchPs.setString(2, trapdoor);

            ResultSet rs = fetchPs.executeQuery();

            if (!rs.next()) {
                req.setAttribute("message", "Secret key not found in cloud");
                req.getRequestDispatcher("ApproveSecretKeyServletmessage.jsp").forward(req, resp);
                return;
            }

            String secretKey = rs.getString("secret_key");

            // 🔹 Step 2: Update approval table
            String updateSql = "UPDATE search_request_approvals "
                    + "SET status='APPROVED', secret_key=? "
                    + "WHERE id=?";

            PreparedStatement updatePs = con.prepareStatement(updateSql);
            updatePs.setString(1, secretKey);
            updatePs.setInt(2, requestId);

            updatePs.executeUpdate();

            req.setAttribute("message", "Secret key approved successfully");
            req.getRequestDispatcher("ApproveSecretKeyServletmessage.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
