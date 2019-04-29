<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Spring Security Tutorial</title>
    <link rel="stylesheet" type="text/css" th:href="@{/css/login.css}" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
</head>

<body>


<div class="panel panel-primary" style="width: 14%; margin: auto; margin-top: 17%">
    <div class="panel-heading regr">
        <form action="signUp" id="regForm" method="get" class="form-signin">
            Go To Registration Page
        </form>
    </div>
    <div class="panel-body">
    <form action="login" method="post" class="form-signin" style="margin: auto; width: 90%; text-align:center;">
            <input type="text" id="username" name="username" placeholder="Username" class="form-control" style="margin: auto; width: 80%;"/> <br/>
            <input type="password" id="password" name="password" placeholder="Password" class="form-control" style="margin: auto; width: 80%;"/> <br/>
        <%--<div align="center"">
            <p style="font-size: 20px; color: #FF1C19;">Username or Password invalid, please verify</p>
        </div>--%>
        <button class="btn btn-primary" name="Submit" value="Login" type="Submit" text="Login" style="width: 40%;">Login</button>
    </form>
    </div>
</div>
</body>
</html>