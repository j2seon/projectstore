<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����(Join) ���� ���</title>
</head>
<body>

<center> 
	<h2>����(Join) ���� ��� </h2>
	<hr> 
	
	<table border = "1" width = "700" cellspacing="0" cellpadding="0">
		<tr> 
			<td>deptno</td>
			<td>dname </td>
			<td>loc</td>
			<td>empno </td>
			<td>ename</td>
			<td>sal </td>
		</tr>
		
		<!-- Loop ����  -->
		<c:forEach items ="${joinlist}" var="join">
		<tr> 
			<td> ${join.deptno }</td>
			<td>${join.dname } </td>
			<td> ${join.loc }</td>
			<td>${join.empno } </td>
			<td> ${join.ename }</td>
			<td>${join.sal } </td>
		</tr>
		</c:forEach>
	
	</table>

</center>


</body>
</html>