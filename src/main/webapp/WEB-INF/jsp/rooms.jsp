<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
    <title>Rooms</title>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="../../static/css/groupchat.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script>
    </script>

</head>

<body style="overflow-x: hidden;">
<%@ include file="./navigation.jsp" %>
<%--<div class="wrapper">
    <!-- Sidebar -->
    &lt;%&ndash;<nav id="sidebar">
        <div class="sidebar-header">
            <h3>Conversations</h3>
            <div class="panel">
                 <ul class="list-group">
                    <c:forEach items="${rooms}" var="room"  >
                        <li class="list-group-item">
                            <div class="room">
                                Room : ${room.name}
                            </div>
                        </li>
                    </c:forEach>
                     <li class="list-group-item">
                        <form:form action="addRoom" method="post" modelAttribute="room" class="form-signin form-log-reg ">
                            <form:input path="name" class="form-control form-input" placeholder="Room name"/> <br/>
                            <button type="submit" class="btn btn-dark custom-width form-button">Create</button>
                        </form:form>
                    </li>
                 </ul>
            </div>
        </div>

    </nav>&ndash;%&gt;

</div>--%>
<div class="d-flex" id="wrapper">
<div class="bg-light border-right" id="sidebar-wrapper">
    <div class="sidebar-heading">Start Bootstrap </div>
    <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
    </div>
</div>
</div>

</body>
</html>