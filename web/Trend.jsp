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
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
    </head>
    <!--/head-->

    <body>

        <jsp:include page="Header.jsp" />  

        <section style="margin-top: 30px;margin-bottom: 100px;">
            <div class="container">
                <div class="row">
                    <jsp:include page="SidebarForDashBoard.jsp" /> 
                    <div class="col-sm-9 padding-right">

                        <div class="col-sm-9">
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
                            <p>Note: </p>
                            <div class="square_red"><h5 style="margin-left: 20px; margin-top: 2px; width: 70px">Free Test</h5></div>
                            <div class="square_blue"><h5 style="margin-left: 20px; margin-top: 2px; width: 120px">User Practice</h5></div>
                            
                            <canvas id="myChart" style="width:100%;max-width:700px;margin-top: 20px"></canvas>

                        </div>
                    </div>
                </div>
                <c:forEach items="${listDataTrend}" var="list">
                    <input type="hidden" name="listDate" value="${list.date}">
                    <input type="hidden" name="listFree" value="${list.statisticFreeTest}">
                    <input type="hidden" name="listPractice" value="${list.statisticUserPractice}">
                </c:forEach>
                <input type="hidden" id="xlistsize" value="${listsize}">
                
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
        <script>
                                                var xValues = [];
                                                var yValues_1 = [];
                                                var yValues_2 = [];
                                                var size = ${listsize};
                                                var x = document.getElementsByName('listDate');
                                                console.log(x);
                                                var y_1 = document.getElementsByName('listFree');
                                                var y_2 = document.getElementsByName('listPractice');
                                                   for (var i = 0; i< size; i++) {
                                                    xValues[i] = x[i].value;
                                                    yValues_1[i] = y_1[i].value;                                                    
                                                    yValues_2[i] = y_2[i].value;                                                    
                                                }
                                                console.log(xValues);

                                            new Chart("myChart", {
                                                type: "line",
                                                data: {
                                                    labels: xValues,
                                                    datasets: [{
                                                            data: yValues_1,
                                                            borderColor: "red",
                                                            fill: false
                                                        }, {
                                                            data: yValues_2,
                                                            borderColor: "blue",
                                                            fill: false
                                                        }]
                                                },
                                                options: {
                                                    legend: {display: false}
                                                }
                                            });
        </script>
    </body>

</html>