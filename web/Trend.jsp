<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Data Statistic</title>
        <link href="css/customize.css" rel="stylesheet">
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
    </head>
    <!--/head-->

    <body>

        <c:if test="${sessionScope.user.rollId eq 3}">
            <jsp:include page="HeaderAdmin.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 4}">
            <jsp:include page="HeaderExpert.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 5}">
            <jsp:include page="HeaderManager.jsp" />  
        </c:if>

        <section style="margin-top: 30px;margin-bottom: 250px;">
            <div class="container">
                <div class="row">
                    <jsp:include page="SidebarForDashBoard.jsp" /> 
                    <div class="col-sm-9 padding-right">

                        <div class="col-sm-6">
                            <form name="myForm" action="Trend" onsubmit="return validformDashboard()">
                                <div style="position: relative">
                                    <div style="display: inline-block;margin-left: 2px">
                                        <p>From-Date</p>
                                        <input name="dateFrom" type="date" value="${dateFrom}">
                                    </div>
                                    <div style="display: inline-block;margin-left: 10px">
                                        <p>To-Date</p>
                                        <input name="dateTo" type="date" value="${dateTo}">
                                    </div>
                                    <input style="margin-left:5px" class="btn btn-default" type="submit" value="Filter">
                                </div>
                            </form>

                            <p id="createStatistic" style="margin-top: 4px" class="text-primary"></p>
                            <table class="table" id="myTable" style="margin-top: 20px">
                                <thead>
                                    <tr>
                                        <th scope="col"><a href="javascript:void(0);" onclick="sort(0)">Date</a></th>
                                        <th scope="col"><a href="javascript:void(0);" onclick="sort(1)">Free Test Taken</a></th>
                                        <th scope="col"><a href="javascript:void(0);" onclick="sort(2)">User Practice Taken</a></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listDataTrend}" var="list">
                                        <tr>
                                            <td>${list.date}</td>
                                            <td>${list.statisticFreeTest}</td>
                                            <td>${list.statisticUserPractice}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="Footer.jsp" /> 

        <script src="js/validation.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>