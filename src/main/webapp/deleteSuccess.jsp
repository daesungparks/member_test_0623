<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 완료</title>
</head>
<body>
	<%
		String name = (String)session.getAttribute("name");
	%>
	<%= name %>님 빠이 다시회원가입은 링크 고고 <br>
	<a href="join.jsp">회원가입바로가기
</body>
</html>