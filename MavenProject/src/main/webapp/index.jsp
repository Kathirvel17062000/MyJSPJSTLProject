<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.text.ParseException, java.util.Date" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Employees Data</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 30px;
      line-height: 1.6;
      background:linear-gradient(skyblue,yellow);
    }
     .forme {
  width: 500px;
  margin: 40px auto;
  padding: 20px;
  border: 2px solid black;
  border-radius: 8px;
  background: lightblue;
  font-family: Arial, sans-serif;
}

.field-row {
  display: flex;
  align-items: center;
  gap: 10px; /* space between items */
  margin: 10px 0;
  font-family: Arial, sans-serif;
}

.field-row label {
  margin-right: 5px;
}

.field-row input[type="text"] {
  padding: 5px;
  width:200px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

    form {
      border: 2px solid red;
      padding: 20px;
      margin-bottom: 30px;
      border-radius: 8px;
      width: 350px;
      margin:0px auto 30px auto;
        }

    input[type="text"],
    input[type="number"],
    input[type="datetime-local"] {
      width: 100%;
      margin: 5px 0 10px 0;
      border:none;
      border-bottom:1px solid green;
      padding: 8px;
      box-sizing: border-box;
      outline:none;
    }

    input[type="submit"] {
      background-color: #007BFF;
      color: white;
      border: none;
      padding: 10px 15px;
      cursor: pointer;
      border-radius: 5px;
    }

    input[type="submit"]:hover {
      background-color: red;
    }

    h1 {
      color: #333;
    }
  </style>
</head>
<body>

  <!-- Insert Form -->
  <form action="insertemployees.jsp" method="POST">
    <h1>Insert Employee</h1>
    <input type="text" name="FirstName" placeholder="First Name" required><br>
    <input type="text" name="lastName" placeholder="Last Name" required><br>
    <input type="number" name="Age" placeholder="Age" required><br>
    <input type="text" name="PhoneNumber" placeholder="PhoneNumber" required><br>
    <input type="datetime-local" name="joiningdate" required><br>
    <input type="submit" value="Submit">
  </form>

  <!-- Update Form -->
  <sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/new_schema" user="root" password="kathir007$"/>
<sql:query dataSource="${myDB}" var="ids">
select EmployeeID from employees
</sql:query>
  

    <form action="updateemployees.jsp" method="POST" class="forme">
    
    
<label>Id:</label>
<select name="myId" style="margin-top:0px;">

<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.EmployeeID}">${myId.EmployeeID}</option>
</c:forEach>
</select>  
    
<h1>UPdate Record Form
</h1>
<div class="field-row">
<label>Field</label><input type="checkbox" name="myField" value="FirstName">firstName<label>value</label> <input type="text" name="FirstNameInput"> <br>
</div><div class="field-row">
<label>Field</label><input type="checkbox" name="myField" value="lastName">lastNam<label>value</label> <input type="text" name="lastNameInput"> <br>
</div><div class="field-row">
<label>Field</label><input type="checkbox" name="myField" value="PhoneNumber">phone_number<label>value</label> <input type="text" name="PhoneNumberInput"> <br>
</div><div class="field-row">
<label>Field</label><input type="checkbox" name="myField" value="Age">age<label>value</label> <input type="text" name="AgeInput"> <br>
</div><div class="field-row">
<label>Field</label><input type="checkbox"name="myField" value="JoiningDate">join_date<label>value</label> <input type="datetime-local" name="JoiningDateInput"> <br>
</div>
    <input type="submit" value="Submit">
</form>


<form action="selectemployees.jsp" method="post">
<h2> List record employees
</h2>
    <input type="submit" value="Submit">
</form>

<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/new_schema" user="root" password="kathir007$"/>
<sql:query dataSource="${myDB}" var="ids">
select EmployeeID from employees
</sql:query>

 <form action="deleteemployees.jsp" method="POST" class="forme">
    
    
<label>Id:</label>
<select name="myId" style="margin-top:0px;">

<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.EmployeeID}">${myId.EmployeeID}</option>
</c:forEach>
</select>  
<h2> Delete record employees
</h2>
    <input type="submit" value="Submit">
</form>>






</body>

</html>