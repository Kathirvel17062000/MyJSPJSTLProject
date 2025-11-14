<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>
<style>
#output
{
height:200px;
width:80%;
border:2px solid red;
text-align:center;
background-color:#8ef788;
margin:auto;
}
</style>
</head>
<body>

	<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/new_schema" user="root"
		password="kathir007$" />

	<sql:update dataSource="${myDB}" var="count">
    DELETE FROM employees WHERE EmployeeID = ?
    <sql:param value="${param.myId}" />
	</sql:update>

	<div id="output">
		<h2>Record Deleted Successfully!</h2>
		<button onclick="history.back()">Go Back</button>
	</div>

</body>
</html>