<%-- 
    Document   : QuizList
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
        <header id="header"><!--header-->
            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="HomeExpert"><img src="images/home/partner1.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="QuizList">Quiz</a></li>                                    
                                    <li><a href="Personal?email=${user.email}">Account</a></li>
                                    <li><a href="Logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->


        </header><!--/header-->

        <div class="container">

            <!--                <div class="col-sm-3"></div>-->
            <a href="AddQuiz"><i class="fa fa-book"></i> Add new Quiz</a>
            <div class="searchform" style="margin-top: 20px;">
                <input type="text" id="myInput" onkeyup="searchForm(1)" placeholder="Search for title"/>
            </div>

            <br>
            <div>
                <table class="table" id="myTable">
                    <tr>
                        <th><strong><a href="javascript:void(0);" onclick="sort(0)">ID</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(1)">Title</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(2)">Subject</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(3)">Level</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(4)">Type</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(5)">Author</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(6)"># Question</a></strong></th>                                
                        <th colspan="3"><center><strong><a href="javascript:void(0);">Action</a></strong></center></th>

                    </tr>

                    <c:forEach items="${list}" var="i">
                        <tr>
                            <td>${i.id}</td>
                            <td>${i.title}</td>
                            <td>${sdao.getSubject(i.subject_id,"Published").title}</td>
                            <td>${i.level}</td>
                            <td>${i.type}</td>
                            <td>${i.user_id}</td>
                            <td>${i.number_of_question}</td>
                            <c:choose>
                                <c:when test="${i.type eq 'User Practice'}">
                                    <td></td>
                                    <td><a href="QuizDetail?id=${i.id}"><i class="fa fa-eye"></i> View</a></td>
                                </c:when>                                
                                        <c:otherwise>
                                        <td><a href="#" onclick="deleteQuiz(${i.id})"><i class="fa fa-trash-o"></i> Delete</a></td>
                                        <td><a href="EditQuiz?id=${i.id}"><i class="fa fa-pencil"></i>Edit</a></td>
                                        <td><a href="QuizDetail?id=${i.id}"><i class="fa fa-eye"></i> View</a></td>
                                        </c:otherwise>
                            </c:choose>
                            
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
                                    <li><a href="QuizList?page=${i}">${i}</a></li> 
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>


        </div>

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="companyinfo">
                                <h2><span>Mega</span>-Deal</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2021 Mega-Deal Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Group 5</a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->


        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>

                                function deleteQuiz(id) {
                                    var result = confirm("Do you want to delete this quiz?");
                                    if (result) {
                                        window.location.href = "DeleteQuiz?id=" + id;
                                    }

                                }


                                function searchForm(number) {
                                    var input, filter, table, tr, td, i, txtValue, in_num;
                                    in_num = parseInt(number);
                                    if (in_num === 1)
                                        input = document.getElementById("myInput");                                    
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