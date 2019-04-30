<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../../static/css/groupchat.css" rel="stylesheet" type="text/css">

        <script>
            $(document).ready(function() {

                $( ".logr" ).click(function() {
                    $("#logForm").submit();
                });

            });
        </script>

    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="getUsers">Get Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login">Log In</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="panel back-panel">
            <div>
                <form:form action="addUser" method="post" modelAttribute="user" class="form-signin form-log-reg ">
                    <form:input path="username" class="form-control form-input" placeholder="Username"/> <br/>
                    <form:input path="password" class="form-control form-input" placeholder="Password"/> <br/>
                    <form:input path="email" class="form-control form-input" placeholder="Email"/> <br/>
                    <form:input path="phone" class="form-control form-input" placeholder="Phone"/> <br/>
                    <form:input path="country" class="form-control form-input" placeholder="Country"/> <br/>
                    <form:input path="city" class="form-control form-input" placeholder="City"/> <br/>
                    <button type="submit" class="btn btn-dark custom-width form-button">Register</button>
                </form:form>
            </div>
        </div>

    </body>
</html>