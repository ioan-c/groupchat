<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>Register</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>
        $(document).ready(function() {

            $( "button.edit" ).click(function() {
                $(this).parent().siblings().find("span").toggle();
                $(this).parent().siblings().find("input").toggle();
                $(this).siblings(".apply").toggle();
            });

            $("button.delete").on('click', function(e) {
                e.preventDefault();
                var form = "#".concat($(this).val());
                $(form).prop("action", "deleteUser");
                $(form).submit();
            });

        });


    </script>
</head>

<body>
    <nav class="navbar navbar-expand-lg">

        <ul class="navbar-nav">
            <li class="active">
                <a href="getUsers" class="nav-link">Get Users</a>
            </li>
            <li class="nav-item">
                <a href="signUp" class="nav-link">Sign Up</a>
            </li>

            <li class="nav-item">
                <a href="logout" class="nav-link">Log Out</a>
            </li>
        </ul>
        </div>
    </nav>
<h2>Users List</h2>
<table class="table table-hover">
    <tr>
        <td><strong>Username</strong></td>
        <td><strong>Password</strong></td>
        <td><strong>Email</strong></td>
        <td><strong>Phone</strong></td>
        <td><strong>Country</strong></td>
        <td><strong>City</strong></td>
    </tr>
    <c:forEach items="${users}" var="user"  varStatus="userCount">
        <form id="form${userCount.index}" action="addUser" method="post" modelAttribute="user">
            <input type="hidden" name="id" value="${user.id}"/>
            <tr>
                <td>
                    <span>${user.username}</span>
                    <input type="text" name="username" value="${user.username}" style="display: none"/>
                </td>
                <td>
                    <span>${user.password}</span>
                    <input type="text" name="password" value="${user.password}" style="display: none"/>
                </td>
                <td>
                    <span>${user.email}</span>
                    <input type="text" name="email" value="${user.email}" style="display: none"/>
                </td>
                <td>
                    <span>${user.phone}</span>
                    <input type="text" name="phone" value="${user.phone}" style="display: none"/>
                </td>
                <td>
                    <span>${user.country}</span>
                    <input type="text" name="country" value="${user.country}" style="display: none"/>
                </td>
                <td>
                    <span>${user.city}</span>
                    <input type="text" name="city" value="${user.city}" style="display: none"/>
                </td>
                <td>
                    <button type="button" class="btn btn-success custom-width edit">Edit</button>
                    <button type="button" class="btn btn-danger custom-width delete" value="form${userCount.index}">Delete</button>
                    <button type="submit" class="btn btn-primary custom-width apply" style="display: none">Apply</button>
                </td>
            </tr>
        </form>
    </c:forEach>

</table>

</body>
</html>