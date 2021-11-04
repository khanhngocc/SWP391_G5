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

            <!--                <div class="col-sm-3"></div>-->
            <a href="AddUserAdmin"><i class="fa fa-book"></i> Add new User</a>
            <div class="searchform" style="margin-top: 20px;">
                <input type="text" id="myInput" onkeyup="searchForm(1)" placeholder="Search for name"/>
                <input type="text" id="myInput1" onkeyup="searchForm(5)" placeholder="Search for role"/>
                <input type="text" id="myInput2" onkeyup="searchForm(6)" placeholder="Search for status"/>

            </div>

            <br>
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
                        <th colspan="2"><center><strong><a href="javascript:void(0);">Action</a></strong></center></th>

                    </tr>

                    <c:forEach items="${list}" var="i">
                        <tr>
                            <td>${i.id}</td>
                            <td>${i.fullname}</td>
                            <td>${i.title}</td>
                            <td>${i.email}</td>
                            <td>${i.phone}</td>
                            <td>${i.rollId}</td>
                            <td>${i.status}</td>
                           
                            <td><a href="EditUser?email=${i.email}"><i class="fa fa-pencil"></i> Edit</a></td>
                            <td><a href="UserDetail?email=${i.email}"><i class="fa fa-eye"></i> View</a></td>
                        </tr>     
                    </c:forEach>
                </table>

                <div class="pagination-area">
                    <ul class="pagination"> 
                        <c:forEach begin="1" end="${pagesize}" var="i">
                            <c:choose>
                                <c:when test="${page==i}">
                                    <li><a href="" class="active">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="UserList?page=${i}">${i}</a></li> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                    </ul>
                </div>
            </div>


        </div>

        <jsp:include page="Footer.jsp" /> 

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>

                                function deleteUser(id) {
                                    var result = confirm("Do you want to delete this user?");
                                    if (result) {
                                        window.location.href = "Delete?id=" + id;
                                    }

                                }


                                function searchForm(number) {
                                    var input, filter, table, tr, td, i, txtValue, in_num;
                                    in_num = parseInt(number);
                                    if (in_num === 1)
                                        input = document.getElementById("myInput");
                                    if (in_num === 5)
                                        input = document.getElementById("myInput1");
                                    if (in_num === 6)
                                        input = document.getElementById("myInput2");
                                    filter = input.value.toUpperCase();
                                    table = document.getElementById("myTable");
                                    tr = table.getElementsByTagName("tr");
                                    for (i = 0; i < tr.length; i++) {
                                        td = tr[i].getElementsByTagName("td")[in_num];
                                        if (td) {
                                            txtValue = td.textContent || td.innerText;
                                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                tr[i].style.display = "";
                                            } else {
                                                tr[i].style.display = "none";
                                            }
                                        }
                                    }
                                }
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