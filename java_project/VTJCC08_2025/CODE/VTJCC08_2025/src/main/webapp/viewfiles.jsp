<%@ page import="java.sql.*"%>
<%@ page import="com.DB.Database"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>View Files</title>
</head>
<body>
	<h3>Uploaded Files (All Tables)</h3>
	<table border="1" cellpadding="6">
		<tr>
			<th>Table</th>
			<th>ID</th>
			<th>Owner</th>
			<th>Filename</th>
			<th>Keywords</th>
			<th>Trapdoor</th>
			<th>Status</th>
		</tr>
		<%
		String[] tables = { "uploaded_table1", "uploaded_table2", "uploaded_table3" };
		for (String t : tables) {
			try (Connection con = Database.getConnection();
			PreparedStatement ps = con
					.prepareStatement("SELECT id, owner_email, filename, keywords, trapdoor_key, trapdoor_status FROM "
							+ t + " ORDER BY uploaded_at DESC");
			ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
		%>
		<tr>
			<td><%=t%></td>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("owner_email")%></td>
			<td><%=rs.getString("filename")%></td>
			<td><%=rs.getString("keywords")%></td>
			<td><%=rs.getString("trapdoor_key")%></td>
			<td><%=rs.getString("trapdoor_status")%></td>
		</tr>
		<%
		}
		} catch (Exception e) {
		out.println("<tr><td colspan='7'>Error reading " + t + ": " + e.getMessage() + "</td></tr>");
		}
		}
		%>
	</table>
</body>
</html>
