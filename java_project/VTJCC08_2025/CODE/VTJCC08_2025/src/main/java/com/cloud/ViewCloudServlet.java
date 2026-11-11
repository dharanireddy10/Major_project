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

@WebServlet("/ViewCloudServlet")

public class ViewCloudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String cloud = req.getParameter("cloud"); // 1,2,3
        String table = "uploaded_table" + cloud;

        List<Map<String, String>> list = new ArrayList<>();

        try (Connection con = Database.getConnection()) {

            String sql = "SELECT owner_email, filename, filetype, keyword FROM " + table;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("owner", rs.getString("owner_email"));
                map.put("filename", rs.getString("filename"));
                map.put("filetype", rs.getString("filetype"));
                map.put("keyword", rs.getString("keyword"));
                list.add(map);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("files", list);
        req.setAttribute("cloud", cloud);
        req.getRequestDispatcher("cloud_files.jsp").forward(req, resp);
    }
}