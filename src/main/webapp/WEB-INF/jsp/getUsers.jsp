<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


<html>
<head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="../../static/css/groupchat.css" rel="stylesheet" type="text/css">

    <title>Get Users</title>
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

    <%@ include file="./navigation.jsp" %>
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