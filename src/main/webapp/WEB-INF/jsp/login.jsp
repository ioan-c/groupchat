<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Spring Security Tutorial</title>
    <link rel="stylesheet" type="text/css" th:href="@{/css/login.css}" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() {

            var pathname = window.location.href;
            if(pathname == "http://localhost:8080/login?error=true"){
                alert("Username or Password incorect!\nPlease try again.");
            }

            $( ".regr" ).click(function() {
                $("#regForm").submit();
            });


        });


    </script>

    <style>
        .p {
            margin: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
    </style>
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
                <a class="nav-link" href="signUp">Sign Up</a>
            </li>
        </ul>
    </div>
</nav>

<div class="panel p" style="width: 14%; min-width: 300px; background-color: rgba(0,0,0,0.5); border-radius: 9px; padding-top: 50px; padding-bottom: 50px;">
    <div>
    <form action="login" method="post" class="form-signin" style="margin: auto; width: 90%; text-align:center;">
            <input type="text" id="username" name="username" placeholder="Username" class="form-control" style="margin: auto; width: 80%;"/> <br/>
            <input type="password" id="password" name="password" placeholder="Password" class="form-control" style="margin: auto; width: 80%;"/> <br/>
        <%--<div align="center"">
            <p style="font-size: 20px; color: #FF1C19;">Username or Password invalid, please verify</p>
        </div>--%>
        <button class="btn btn-dark" name="Submit" value="Login" type="Submit" text="Login" style="width: 40%;">Login</button>
    </form>
    </div>
</div>
</body>
</html>