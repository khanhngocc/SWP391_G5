
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            function sendRedirect(url)
            {
                window.location.href = url;
            }
        </script>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="row">
                <div class="col-lg-3 mt-5">
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-3">
                            <h3>Sort</h3>
                        </div>
                        <div class="col-md-8">
                            <form action="filter" method="post">
                                <select onchange="this.form.submit()" name="rid" class="form-control form-control-lg">
                                    <option value="-1">----------All----------</option>
                                <c:forEach items="${requestScope.listRoll}" var="r">
                                    <option ${rid == r.id?"selected":""} value="${r.id}">${r.name}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="container mt-5">
                    <form action="searchUser" method="post">
                        <h3>Search person</h3>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Full Name</label>
                            <input name="name" type="text" class="form-control" id="exampleInputEmail1" value="${param.name}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input name="email" type="text" class="form-control" id="exampleInputEmail1" value="${param.email}">
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>
                <div class="container mt-5">
                    <input type="button" value="Create Person"
                             class="btn btn-primary" onclick="sendRedirect('addUser')"
                               />
                </div>
            </div>
            <div class="col-lg-9">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Full Name</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Password</th>
                            <th scope="col">Created Date</th>
                            <th scope="col">Roll Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listUser}" var="o" varStatus="i">
                            <tr>
                                <th scope="row">${o.id}</th>
                                <td>${o.fullname}</td>
                                <c:if test="${o.gender == true}">
                                    <td class="text-primary">
                                        <i class="fa fa-male" aria-hidden="true"></i>
                                        Male
                                    </td>
                                </c:if>
                                <c:if test="${o.gender == false}">
                                    <td class="text-success">
                                        <i class="fa fa-female" aria-hidden="true"></i>
                                        Female
                                    </td>
                                </c:if>
                                <td>${o.email}</td>
                                <td>${o.phone}</td>
                                <td>${o.password}</td>
                                <td>${o.createDate}</td>
                                <td>${o.roll.name}</td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/admin/editUser?email=${o.email}">
                                        <button type="button" class="btn btn-primary">Edit</button>
                                    </a>

                                    <a href="<%=request.getContextPath()%>/admin/deleteUser?id=${o.id}">
                                        <button type="button" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
