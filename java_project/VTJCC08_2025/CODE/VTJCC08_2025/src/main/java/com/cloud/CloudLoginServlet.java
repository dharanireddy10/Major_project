package com.cloud;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CloudLoginServlet")
public class CloudLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String u = req.getParameter("username");
        String p = req.getParameter("password");

        if(u.equals("cloud") && p.equals("cloud123")) {
            HttpSession session = req.getSession();
            session.setAttribute("cloud", "cloud");
            resp.sendRedirect("cloud_dashboard.jsp");
        } else {
            resp.sendRedirect("cloud_login.jsp?msg=Invalid");
        }
    }
}
