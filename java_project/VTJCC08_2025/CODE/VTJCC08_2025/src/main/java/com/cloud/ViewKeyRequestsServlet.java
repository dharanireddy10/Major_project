package com.cloud;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;

@WebServlet("/ViewKeyRequestsServlet")
public class ViewKeyRequestsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try (Connection con = Database.getConnection()) {

            String sql = "SELECT * FROM search_request_approvals WHERE status='PENDING'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            List<Map<String, String>> list = new ArrayList<>();

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", rs.getString("id"));
                map.put("user_email", rs.getString("user_email"));
                map.put("category", rs.getString("category"));
                map.put("keyword", rs.getString("keyword"));
                map.put("trapdoor_key", rs.getString("trapdoor_key"));
                map.put("status", rs.getString("status"));
                list.add(map);
            }
            System.out.println(">>> ViewKeyRequestsServlet EXECUTED <<<");

            req.setAttribute("requestList", list);
            req.getRequestDispatcher("cloudApprove.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
