<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<html>
    <head>
        <title>Get Users</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="../../static/css/groupchat.css" rel="stylesheet" type="text/css">
        <link href="../../static/css/chat.css" rel="stylesheet" type="text/css">

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
                        <a class="nav-link" href="signUp">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>

        <h3 class="header">Users List</h3>
        <div class="shadow p-3 mb-5 bg-white rounded table-div">
            <table class="table table-borderles get-table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Country</th>
                        <th scope="col">City</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <c:forEach items="${users}" var="user"  varStatus="userCount">
                    <form id="form${userCount.index}" action="editUser" method="post" modelAttribute="user">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <tbody>
                            <tr>
                                <th scope="row">
                                    <span>${user.username}</span>
                                    <input type="text" class="form-control hide input-text" name="username" value="${user.username}"/>
                                </th>
                                <td>
                                    <span>${user.email}</span>
                                    <input type="text" class="form-control hide input-text" name="email" value="${user.email}"/>
                                </td>
                                <td>
                                    <span>${user.phone}</span>
                                    <input type="text" class="form-control hide input-text" name="phone" value="${user.phone}"/>
                                </td>
                                <td>
                                    <span>${user.country}</span>
                                    <input type="text" class="form-control hide input-text" name="country" value="${user.country}"/>
                                </td>
                                <td>
                                    <span>${user.city}</span>
                                    <input type="text" class="form-control hide input-text" name="city" value="${user.city}"/>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-dark custom-width edit">Edit</button>
                                    <button type="button" class="btn btn-dark custom-width delete" value="form${userCount.index}">Delete</button>
                                    <button type="submit" class="btn btn-dark custom-width hide apply">Apply</button>
                                </td>
                            </tr>
                        </tbody>
                    </form>
                </c:forEach>
            </table>
        </div>

    </body>
</html>