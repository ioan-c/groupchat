<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>Register</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script>
        $(document).ready(function() {
            $( "button" ).click(function() {
               //alert("hello");
                $(this).parent().siblings().find("span.email").hide();
                $(this).parent().siblings().find("span.username").hide();
                $(this).parent().siblings().find("input.email").show();
                $(this).parent().siblings().find("input.username").show();
//                $("span.username").before( $(this) ).hide();
//                $("input.username").before( $(this) ).show();
            });
        });
    </script>
</head>

<body>
<h2>Users List</h2>
<table class="table table-hover">
    <tr>
        <td><strong>Username</strong></td>
        <td><strong>Email</strong></td>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td><span class="username">${user.username}</span> <input type="text" class="username" value="${user.username}" style="display: none"/></td>
            <td><span class="email">${user.email}</span> <input type="text" class="email" value="${user.email}" style="display: none"/></td>
            <td class="edit"><button type="button" class="btn btn-success custom-width">Edit</button></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>