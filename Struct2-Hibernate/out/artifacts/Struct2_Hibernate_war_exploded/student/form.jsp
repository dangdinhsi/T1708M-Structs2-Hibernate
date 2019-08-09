<%@ page import="com.t1708m.entity.Student" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/9/2019
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Student student = (Student) request.getAttribute("student");
%>
<html>
<head>
    <title>Title</title>
    <script>
        function validate() {
            var rollNumber= document.forms["myForm"]["student.rollNumber"].value;
            var name = document.forms["myForm"]["student.name"].value;
            var email = document.forms["myForm"]["student.email"].value;
            if(rollNumber.length==0){
                alert("Roll number must be filled out!!!");
                return false;
            }
            if(name.length==0){
                alert("Name must be filled out!!!");
                return false;
            }
            if(email.length==0){
                alert("Email must be filled out!!!");
                return false;
            }
        }
    </script>
</head>
<body>
<h1>Create Student</h1>
<a href="list.action">Back to list</a>
<s:form action="save" method="POST" name="myForm" onsubmit="return(validate());">
    <s:textfield name="student.rollNumber" label="Roll Number"/>
    <s:textfield name="student.name" label="Name"/>
    <s:textfield name="student.email" label="Email"/>
    <s:submit value="Create"/>
    <s:reset value="Reset"/>
</s:form>
</body>
</html>
