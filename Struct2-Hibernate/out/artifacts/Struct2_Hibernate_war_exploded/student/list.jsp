
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 8/9/2019
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    function confirmDelete() {
        var message = confirm("Are you sure you want to delete?");
        if(message){
            alert("Delete Success!!!")
        }else {
           alert("Press button OK to exit !!!")
        }
        return message;
    }
</script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-4">
            <h1>List Student</h1>
            <h6><a href="create.action">Create</a></h6>
            <table class="table table-bordered text-center">
                <tr>
                    <th>Roll number</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th colspan="3">Option</th>
                </tr>
                <s:if test="list.size()==0">
                    <tr>
                        <td colspan="5"><a href="create.action">Add new Student</a></td>
                    </tr>
                </s:if>
                <s:if test="list.size()>0">
                    <c:forEach var="st" items="${list}">
                        <tr>
                            <td>${st.rollNumber}</td>
                            <td>${st.name}</td>
                            <td>${st.email}</td>
                            <td><a href="detail.action?id=${st.rollNumber}">Detail</a></td>
                            <td><a href="edit.action?id=${st.rollNumber}">Edit</a></td>
                            <td><a href="delete.action?id=${st.rollNumber}" onclick="return confirmDelete();">Delete</a></td>
                        </tr>
                    </c:forEach>
                </s:if>
            </table>
        </div>
    </div>
</div>
</body>
</html>
