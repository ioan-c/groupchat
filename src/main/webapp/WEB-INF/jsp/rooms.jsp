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
        $(document).ready(function() {
                       $( "#btn_send" ).click(function() {
                           var roomId = window.location.search.split("=")[1];
                           var rId= $("#hiddenRoomId").attr('value', roomId);
                           alert(rId);
                       });

                      /*  $("a").click(function() {
                            var href = $(this).attr('href');

                            $("#btn_send").attr('value', href);
                        });*/
                });

            </script>

        </head>

        <body style="overflow-x: hidden;">
        <%@ include file="./navigation.jsp" %>
            <div class="d-flex" id="wrapper">
                <div class="bg-dark border-right" id="sidebar-wrapper">
                    <div class="sidebar-heading" style="color: white;">Rooms</div>
                    <div class="list-group list-group-flush">
                        <c:forEach items="${rooms}" var="room"  >
                            <a href="/rooms?id=${room.id}" class="list-group-item list-group-item-action bg-dark" style="color: white;">${room.name}</a>
                        </c:forEach>
                        <form:form action="addRoom" method="post" modelAttribute="room" class="form-signin form-log-reg ">
                            <form:input path="name" class="list-group-item list-group-item-action bg-light" placeholder="Room name"/><br/>
                            <button type="submit" class="btn btn-light custom-width form-button">Create</button>
                        </form:form>
                    </div>
                </div>
                <div id="page-content-wrapper" style="background-color: #c8c8c8">
                    <div class="container-fluid">
                        <%--<c:forEach items="${messages}" var="message"  >
                            <a href="#" id="${message.id}" class="list-group-item list-group-item-action bg-dark" style="color: white;">${message.content}</a>
                        </c:forEach>--%>
            </div>
<%--                    <form id="form${userCount.index}" action="addMessage" method="post" modelAttribute="message" class="form-signin form-log-reg ">--%>
<%--                        <input type="text" class="list-group-item list-group-item-action bg-light" name="content" value=""/>--%>
<%--                    </form>--%>
            <form:form action="addMessage" method="post" modelAttribute="message" class="form-signin form-log-reg ">
                <form:hidden path="room.id" value="" id="hiddenRoomId"/>
                <form:input path="content" class="list-group-item list-group-item-action bg-light" placeholder="Type message..."/><br/>
                <button type="submit" id="btn_send" value="" class="btn btn-light custom-width form-button">Send</button>
            </form:form>
        </div>



    </div>

</body>
</html>