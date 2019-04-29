<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Spring5 MVC Hibernate Demo</title>
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
    </style>
</head>
<body>

<h1>Input Form</h1>
<form:form action="addUser" method="post" modelAttribute="user">
    <table class="table table-hover">
        <tr>
            <td>Username</td>
            <td><form:input path="username" /> <br />
                <%--<form:errors path="name" cssClass="error" />--%>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td><form:input path="password" /> <br />
        </tr>
        <tr>
            <td>Email</td>
            <td><form:input path="email" /> <br /></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><form:input path="phone" /> <br /></tr>
        <tr>
            <td>Country</td>
            <td><form:input path="country" /> <br />
        </tr>
        <tr>
            <td>City</td>
            <td><form:input path="city" /> <br />
        </tr>
        <tr>
            <td colspan="2"><button type="submit" class="btn btn-success custom-width">Submit</button></td>
        </tr>
    </table>
</form:form>


</body>
</html>