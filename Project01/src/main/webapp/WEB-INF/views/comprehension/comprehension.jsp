<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
		margin-left: 10%;
		margin-right: 10%;
		padding: 0px;
		
	}
	ul, li{ 
        list-style:none;
        text-align:center;
        padding:0;
        margin-left:10px;
        margin-right:10px;
        float: left;
        
	}	
	.table{
		border-collapse: collapse;
		width: 100%;
		border: 1px solid black;
	}
	tr{
		border: 1px solid black;
	}
	.clear{
		width: 100%;
		filter: alpha(opacity=100);
	}
</style>

<body>
	<h1>■ 이해도통계</h1>
	<table>
	<tr>
		<td>
			<table class="table">
				<tr bgcolor="#5B98FF">
					<td>질문</td>
					<% List<String> name = (List<String>) request.getAttribute("listName"); %>
					<td colspan="<%=name.size()%>">회원이름</td>
				</tr> 			
				<tr bgcolor="#A8C9FF">
					<td>질문목록</td>
					<c:forEach items="${listName}" var="name">
						<td>${name}</td>
					</c:forEach>
				</tr>
				
				<c:forEach items= "${listQuestion}" var="question">
					<tr>
						<td>${question}</td>
						<c:forEach items="${listScore}" var="score">
							<td>${score}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			
		<!-- 
				<c:forEach items="${CurriculumVO}" var="vo">
					<tr>
						<c:if test= "${vo.curri_depth == 3}">
							<td>${vo.curri_name}</td>
						</c:if>
						 
							<td>${vo.curri_no}</td>
							<td>${vo.curri_pno}</td>
							<td>${vo.curri_depth}</td>
						 
					</tr>
				</c:forEach>
		-->
			</table>
		</td>
	</table>
 	
</body>
</html>