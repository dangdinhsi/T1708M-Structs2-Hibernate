<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/9/2019
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function validate() {
            var name = document.forms["myForm"]["student.name"].value;
            var email = document.forms["myForm"]["student.email"].value;
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
<h1>Update Student</h1>
<s:if test="message!=null">
    <p style="color: coral"><s:property value="message"/></p>
    <a href="list.action">Back to list</a>
</s:if>
<s:if test="errormessage!=null">
    <p style="color: red"><s:property value="errormessage"/></p>
</s:if>
<s:form action="update" method="POST" name="myForm" onsubmit="return(validate());">
    <div><s:textfield name="student.rollNumber" label="ROLL NUMBER" readonly="true"/></div>
    <div><s:textfield name="student.name" label="UPDATE NAME"/></div>
    <div><s:textfield name="student.email" label="UPDATE EMAIL"/></div>
    <div>
        <s:submit value="UPDATE"/>
        <s:reset value="RESET"/>
    </div>
</s:form>
</body>
</html>
