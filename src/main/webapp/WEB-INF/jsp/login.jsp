<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Log In</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../../static/css/groupchat.css" rel="stylesheet" type="text/css">

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
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
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

    <div class="panel back-panel">
        <div>
        <form action="login" method="post" class="form-signin form-log-reg">
            <input type="text" id="username" name="username" placeholder="Username" class="form-control form-input"/> <br/>
            <input type="password" id="password" name="password" placeholder="Password" class="form-control form-input"/> <br/>
            <button class="btn btn-dark form-button" type="Submit" text="Login">Login</button>
        </form>
        </div>
    </div>
</body>
</html>