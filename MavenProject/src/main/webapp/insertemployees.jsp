<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*"%>
    <%@ page import="java.text.SimpleDateFormat,java.text.ParseException,java.util.Date" %>
     
    <%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql"%>
    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
String firstName=request.getParameter("FirstName");
String lastName=request.getParameter("lastName");
int age=Integer.parseInt(request.getParameter("Age"));
String phone_number=request.getParameter("PhoneNumber");
String jDate=request.getParameter("joiningdate");
java.util.Date join_date=null;
SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
SimpleDateFormat sqlFormat=new SimpleDateFormat("yyyy-MM-dd");
try
{
	join_date=sd.parse(jDate);
}
catch(ParseException pe)
{
	pe.printStackTrace();
	
}
String joinDateStr = sqlFormat.format(join_date);



%>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/new_schema" user="root" password="kathir007$"/>
<sql:update dataSource="${myDB}" var="count">
insert into employees(FirstName,LastName,Age,PhoneNumber,JoiningDate) values(?,?,?,?,?)

<sql:param value="<%=firstName%>"></sql:param>
<sql:param value="<%=lastName%>"></sql:param>
<sql:param value="<%=age%>"></sql:param>
<sql:param value="<%=phone_number%>"></sql:param>
<sql:param value="<%=join_date%>"></sql:param>

</sql:update>

<div id="output">
<H1>Record inserted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>

</body>
</html>