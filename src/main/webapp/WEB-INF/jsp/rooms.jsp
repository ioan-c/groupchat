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
                       });
                });

            </script>

        </head>

        <body style="overflow-x: hidden;">
        <%@ include file="./navigation.jsp" %>
            <div class="d-flex" id="wrapper">
                <div class="border-right" style="background-color: #e3f2fd;" id="sidebar-wrapper">
                    <div class="sidebar-heading">Rooms</div>
                    <div class="list-group list-group-flush">
                        <c:forEach items="${rooms}" var="room"  >
                            <a href="/rooms?id=${room.id}" class="list-group-item list-group-item-action" style="background-color: #e3f2fd;">${room.name}</a>
                        </c:forEach>
                        <form:form action="addRoom" method="post" modelAttribute="room" class="form-signin form-log-reg ">
                            <form:input path="name" class="list-group-item list-group-item-action bg-light" style="width: 31vh;" placeholder="Room name"/><br/>
                            <button type="submit" class="btn btn-light custom-width form-button">Create</button>
                        </form:form>
                    </div>
                </div>
             
				
				<div id="page-content-wrapper" style="background-color: #c8c8c8">
                    <div class="container-fluid">
                        <c:forEach items="${messages}" var="message"  >
                            <p id="${message.messageId}" class="list-group-item list-group-item-action bg-light" >${message.user.username}: ${message.content}</p>
                        </c:forEach>
					</div>
<%--                    <form id="form${userCount.index}" action="addMessage" method="post" modelAttribute="message" class="form-signin form-log-reg ">--%>
<%--                        <input type="text" class="list-group-item list-group-item-action bg-light" name="content" value=""/>--%>
<%--                    </form>--%>
   
                    <div id="footer">
                        <form:form action="addMessage" method="post" modelAttribute="message" class="form-signin form-log-reg ">
                            <form:hidden path="room.id" value="" id="hiddenRoomId"/>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 80%">
                                    <form:input path="content" class="list-group-item list-group-item-action bg-light" placeholder="Type message..."/>
                                    </td>
                                    <td style="width: 20%">
                                    <button type="submit" id="btn_send" value="" class="btn btn-light form-button" style="min-width: 30px">Send</button>
                                    </td>
                                </tr>
                            </table>
                        </form:form>
                    </div>
				</div>
			</div>


</body>
</html>