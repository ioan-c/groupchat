<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/service/user_service.js' />"></script>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<html>
  <head>
    <title>Register</title>
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: orange;
      }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  </head>

  <body ng-app="groupChat" class="ng-cloak">
      <div class="generic-container" ng-controller="UserController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">User Registration Form </span></div>
              <div class="formcontainer" style="margin-left: 20px">
                  <form ng-submit="ctrl.submit()" name="myForm">
                      <input type="hidden" ng-model="ctrl.user.id" />
                      <div class="row">
                          <div>
                              <label for="uname">Username</label>
                              <div>
                                  <input type="text" ng-model="ctrl.user.username" id="uname" placeholder="username" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                            <div>
                                <label for="pass">Password</label>
                                <div>
                                    <input type="password" ng-model="ctrl.user.password" id="pass" placeholder="Password" required ng-minlength="6"/>
                                    <div class="has-error" ng-show="myForm.$dirty">
                                        <span ng-show="myForm.pass.$error.required">This is a required field</span>
                                        <span ng-show="myForm.pass.$error.minlength">Minimum length required is 6</span>
                                        <span ng-show="myForm.pass.$invalid">This field is invalid </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                      <div class="row">
                          <div>
                              <label for="email">Email</label>
                              <div>
                                  <input type="text" ng-model="ctrl.user.email" id="email" placeholder="email" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div>
                              <label for="phone">Phone</label>
                              <div>
                                  <input type="text" ng-model="ctrl.user.phone" id="phone" placeholder="phone" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div>
                              <label for="country">Country</label>
                              <div>
                                  <input type="text" ng-model="ctrl.user.country" id="country" placeholder="country" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div>
                              <label for="city">City</label>
                              <div>
                                  <input type="text" ng-model="ctrl.user.city" id="city" placeholder="city" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="Add" ng-disabled="myForm.$invalid">
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
              <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Users </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                      <tr>
                          <th>ID.</th>
                          <th>Name</th>
<%--                          <th>Password</th>--%>
                          <th width="20%"></th>
                      </tr>
                      </thead>
                      <tbody>
                      <tr ng-repeat="u in ctrl.users">
                          <td><span ng-bind="u.id"></span></td>
                          <td><span ng-bind="u.username"></span></td>
<%--                          <td><span ng-bind="u.password"></span></td>--%>
                          <td>
                              <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                          </td>
                      </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>


  </body>
</html>