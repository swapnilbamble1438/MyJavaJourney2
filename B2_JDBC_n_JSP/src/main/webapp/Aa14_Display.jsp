<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
		PreparedStatement ps=con.prepareStatement("select * from signup;");
		
		ResultSet rs=ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();


%>
	<table border>
	<%
		out.println("<tr>");
			for(int i = 1; i <= rsmd.getColumnCount(); i++)
			{
				out.println("<th>" + rsmd.getColumnLabel(i) + "</th>");
				
			}
		out.println("</tr>");
	
		out.println("<tr>");
			while(rs.next() == true)
			{
				out.println("<tr>");
					for(int i = 1; i <= rsmd.getColumnCount(); i++)
					{
						out.println("<td>" + rs.getString(i) + "</td>");
					}
					
					
					
      out.println("<td><a href='Aa14_Delete.jsp?id="+rs.getString(1) +"'><img src='Images/Delete.jpg' alt = Delete height=50px width=50px></td>");
			
   
				out.println("</tr");
			}
		out.println("</tr>");
	%>
	</table>
<%
	con.close();    
	}catch(Exception ex){
	   out.println(ex.getMessage());
	}
%>
	
</body>
</html>