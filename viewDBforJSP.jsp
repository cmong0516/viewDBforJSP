<!-- Jsp파일에선 <% %> 기호로 Java 코드를 실행할수 있다.
이를 이용하여 DB table 에 연결하여 해당 내용을 ResultSet에 저장
while 반복문을 통하여 resultset에 저장된 내용을 출력할수 있다. -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>TableView02</title>
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/testSQL";
	String user = "root";
	String password = "apple0516";
	conn = DriverManager.getConnection(url, user, password);
	Statement statement = conn.createStatement();
	ResultSet resultset = statement.executeQuery("select * from Test01");
	%>

	<h2>Test01 Table의 내용을 출력해보자</h2>

	<%
	while (resultset.next()) {	%>
	<%=resultset.getInt(1)%>
	<%=resultset.getString(2)%>
   <%=resultset.getString(3)%> <br>
	<%	}
	resultset.close();
	statement.close();
	conn.close();
	%>
	
</body>
</html>