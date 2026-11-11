package com.download;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;
import com.algo.AESUtil;

/**
 * Servlet implementation class DownloadServlet
 */

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String category = req.getParameter("category");
		int fileId = Integer.parseInt(req.getParameter("fileId"));
		String providedSecret = req.getParameter("secretKey");

		String targetTable = switch (category) {
		case "TABLE1" -> "uploaded_table1";
		case "TABLE2" -> "uploaded_table2";
		case "TABLE3" -> "uploaded_table3";
		default -> "uploaded_table1";
		};

		String sql = "SELECT filename, filetype, encrypted_data, secret_key FROM " + targetTable + " WHERE id=?";

		try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, fileId);
			try (ResultSet rs = ps.executeQuery()) {
				if (!rs.next()) {
					req.setAttribute("message", "File not found.");
					req.getRequestDispatcher("message.jsp").forward(req, resp);
					return;
				}

				String filename = rs.getString("filename");
				String filetype = rs.getString("filetype");
				String encryptedBase64 = rs.getString("encrypted_data");
				String storedSecret = rs.getString("secret_key");

				if (!storedSecret.equals(providedSecret)) {
					req.setAttribute("message", "Invalid secret key. Contact the owner.");
					req.getRequestDispatcher("message.jsp").forward(req, resp);
					return;
				}

				byte[] originalBytes = AESUtil.decryptFromBase64(encryptedBase64, providedSecret);

				resp.setContentType(filetype != null ? filetype : "application/octet-stream");
				resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
				resp.setContentLength(originalBytes.length);

				OutputStream os = resp.getOutputStream();
				os.write(originalBytes);
				os.flush();
			}

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
