<%-- 
    Document   : AdminHome
    Created on : Sep 24, 2021, 10:51:13 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Users List</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>

        <jsp:include page="HeaderAdmin.jsp" /> 

        <div class="container">

            <form action="UserList" class="searchform">
                <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                <input type="text" placeholder="Search" name="roll" value="${roll}" hidden=""/>
                <input type="text" placeholder="Search" name="searchName" value="${searchName}"/>
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </form>

            <div style="margin-top: 20px; margin-bottom: 10px">

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Status</p>
                <form style ="float: left;margin-right: 15px;margin-left: 5px" action="UserList" >
                    <input type="text" placeholder="Search" name="roll" value="${roll}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>

                    <select name="status" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listAllStatus}" var="list">
                            <option value="${list}" ${list == status ? 'selected':''}>${list}</option>
                        </c:forEach>
                    </select>   
                </form>

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Roll</p>
                <form style ="float: left;margin-left: 4px" action="UserList" >
                    <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="roll" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listAllRolls}" var="list">
                            <option value="${list.id}" ${list.id == roll ? 'selected':''}>${list.name}</option>
                        </c:forEach>
                    </select>   
                </form>

            </div>
            <br>
            <div style="margin-top: 30px; margin-bottom: 20px">
                <a href="AddUserAdmin"><i class="fa fa-plus"></i> Add new User</a></div>
            <div>
                <table class="table" id="myTable">
                    <tr>
                        <th><strong><a href="javascript:void(0);" onclick="sort(0)">ID</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(1)">Full Name</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(2)">Title</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(3)">Email</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(4)">Phone</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(5)">Role</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(6)">Status</a></strong></th>                                
                        <th scope="col" style="width: auto" colspan="2"><a href="javascript:void(0);">Action</a></th>

                    </tr>

                    <c:forEach items="${listAllUsers}" var="i">
                        <tr>
                            <td>${i.id}</td>
                            <td>${i.fullname}</td>
                            <td>${i.title}</td>
                            <td>${i.email}</td>
                            <td>${i.phone}</td>
                            <td>${i.rollName}</td>
                            <td>${i.status}</td>
                            <td style="width: 210px">
                                <c:if test="${i.status eq 'Active'}">
                                    <a href="javascript:void(0);" onclick="changeUserStatus(${i.id}, 'Deactive')"><i class="fa fa-chain"></i> Deactive</a> 
                                </c:if>
                                <c:if test="${i.status eq 'Deactive'}">
                                    <a href="javascript:void(0);" onclick="changeUserStatus(${i.id}, 'Active')"><i class="fa fa-chain"></i> Active</a> 
                                </c:if>
                                <a href="EditUser?email=${i.email}"><i class="fa fa-pencil"></i> Edit</a>
                            </td>


                        </tr>     
                    </c:forEach>
                </table>

                <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="UserList?page=1&searchName=${searchName}&roll=${roll}&status=${status}">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="UserList?page=${pageindex -i}&searchName=${searchName}&roll=${roll}&status=${status}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="UserList?page=${pageindex + i}&searchName=${searchName}&roll=${roll}&status=${status}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="UserList?page=${pagecount}&searchName=${searchName}&roll=${roll}&status=${status}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
            </div>


        </div>

        <jsp:include page="Footer.jsp" /> 
        <script src="js/userHelper.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>


        </script>
        <script>
            function sort(number) {
                var in_num, table, rows, switching, i, x, y, shouldSwitch;
                in_num = parseInt(number);
                table = document.getElementById("myTable");
                switching = true;
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < rows.length - 1; i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("td")[in_num];
                        y = rows[i + 1].getElementsByTagName("td")[in_num];
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }
        </script>
    </body>
</html>