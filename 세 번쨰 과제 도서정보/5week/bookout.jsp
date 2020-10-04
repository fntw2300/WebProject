<%@ page import="week05.BookBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
</head>
<body>
	<h2>도서정보</h2>
	<jsp:useBean id="book" class="week05.BookBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="book" />
	
	제목 : <c:out value="${book.title }"></c:out> 
	<br> 작가 : <c:out value="${book.author }"></c:out>
	<br> 출판사 : <c:out value="${book.publisher }"></c:out>
	<br>
</body>
</html>