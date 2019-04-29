<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Registration</title>
    <style type="text/css">
        .error {
            color: red;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            border-spacing: 0px;
        }
        table td {
            border: 1px solid #565454;
            padding: 20px;
        }

        .p {
             margin: 0;
             position: absolute;
             top: 50%;
             left: 50%;
             -ms-transform: translate(-50%, -50%);
             transform: translate(-50%, -50%);
        }

    </style>
    <script>
        $(document).ready(function() {

            $( ".logr" ).click(function() {
                $("#logForm").submit();
            });

        });


    </script>
</head>
<body style="background-image: url(https://images.wallpaperscraft.com/image/apple_iphone_smartphone_bw_108546_2560x1440.jpg);">

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

<div class="panel p" style="width: 14%; min-width: 300px; background-color: rgba(0,0,0,0.5); border-radius: 9px; padding-top: 50px; padding-bottom: 50px;">
    <div>
        <form:form action="addUser" method="post" modelAttribute="user" class="form-signin" style="margin: auto; width: 90%; text-align:center;">
                    <form:input path="username" class="form-control" placeholder="Username" style="margin: auto; width: 80%;" /> <br/>
                            <%--<form:errors path="name" cssClass="error" />--%>
                    <form:input path="password" class="form-control" placeholder="Password" style="margin: auto; width: 80%;" /> <br/>
                    <form:input path="email" class="form-control" placeholder="Email" style="margin: auto; width: 80%;"/> <br/>
                    <form:input path="phone" class="form-control" placeholder="Phone" style="margin: auto; width: 80%;"/> <br/>
                    <form:input path="country" class="form-control" placeholder="Country" style="margin: auto; width: 80%;"/> <br/>
                    <form:input path="city" class="form-control" placeholder="City" style="margin: auto; width: 80%;"/> <br/>
                    <button type="submit" class="btn btn-dark custom-width" style="width: 40%;">Register</button>
            </table>
        </form:form>
    </div>
</div>
</body>
</html>