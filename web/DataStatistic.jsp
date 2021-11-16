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
                            <form name="myForm" action="DataStatistic" onsubmit="return validformDashboard()">
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

                            <c:forEach items="${listFreeTest}" var="list">
                                <input type="hidden" name="listDate" value="${list.date}">
                                <input type="hidden" name="listnew" value="${list.newRecords}">
                                <input type="hidden" name="listrecord" value="${list.allRecords}">
                            </c:forEach>

                            <c:forEach items="${listUserPractice}" var="list">
                                <input type="hidden" name="listDate" value="${list.date}">
                                <input type="hidden" name="listnewuser" value="${list.newRecords}">
                                <input type="hidden" name="listrecorduser" value="${list.allRecords}">
                            </c:forEach>

                            <c:forEach items="${listSubject}" var="list">
                                <input type="hidden" name="listnewsub" value="${list.newRecords}">
                                <input type="hidden" name="listrecordsub" value="${list.allRecords}">
                            </c:forEach>

                            <c:forEach items="${listQuestion}" var="list">
                                <input type="hidden" name="listDate" value="${list.date}">
                                <input type="hidden" name="listnewquest" value="${list.newRecords}">
                                <input type="hidden" name="listrecordquest" value="${list.allRecords}">
                            </c:forEach>

                            <canvas id="myChart" style="width:100%;max-width:700px;margin-top: 20px"></canvas>
                            <canvas id="myChart_1" style="width:100%;max-width:700px;margin-top: 20px"></canvas>
                            <canvas id="myChart_2" style="width:100%;max-width:700px;margin-top: 20px"></canvas>
                            <canvas id="myChart_3" style="width:100%;max-width:700px;margin-top: 20px"></canvas>

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
        <script>
                                var xValues = [];
                                var yValues_1 = [];
                                var yValues_2 = [];
                                var yValues_1_1 = [];
                                var yValues_1_2 = [];
                                var yValues_2_1 = [];
                                var yValues_2_2 = [];
                                var yValues_3_1 = [];
                                var yValues_3_2 = [];
                                var size = ${listsizeFreeTest};
                                var x = document.getElementsByName('listDate');
                                console.log(x);
                                var y_1 = document.getElementsByName('listnew');
                                var y_2 = document.getElementsByName('listrecord');
                                var y_1_1 = document.getElementsByName('listnewsub');
                                var y_1_2 = document.getElementsByName('listrecordsub');
                                var y_2_1 = document.getElementsByName('listrecorduser');
                                var y_2_2 = document.getElementsByName('listrecorduser');
                                var y_3_1 = document.getElementsByName('listrecordquest');
                                var y_3_2 = document.getElementsByName('listrecordquest');
                                for (var i = 0; i < size; i++) {
                                    xValues[i] = x[i].value;
                                    yValues_1[i] = y_1[i].value;
                                    yValues_2[i] = y_2[i].value;
                                    yValues_1_1[i] = y_1_1[i].value;
                                    yValues_1_2[i] = y_1_2[i].value;
                                    yValues_2_1[i] = y_2_1[i].value;
                                    yValues_2_2[i] = y_2_2[i].value;
                                    yValues_3_1[i] = y_3_1[i].value;
                                    yValues_3_2[i] = y_3_2[i].value;
                                }
                                new Chart("myChart", {
                                    type: "bar",
                                    data: {
                                        labels: xValues,
                                        datasets: [{
                                                data: yValues_1,
                                                backgroundColor: "red",
                                                label: "New Free Test"
                                            }, {
                                                data: [4, 3, 5],
                                                backgroundColor: "blue",
                                                label: "All Free Test"
                                            }]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                            text: "Free Test Overview"
                                        }
                                    }
                                });
                                
                                new Chart("myChart_1", {
                                    type: "bar",
                                    data: {
                                        labels: xValues,
                                        datasets: [{
                                                data: yValues_1_1,
                                                backgroundColor: "red",
                                                label: "New Subject"
                                            }, {
                                                data: yValues_1_2,
                                                backgroundColor: "blue",
                                                label: "All Subject"
                                            }]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                            text: "Subject Overview"
                                        }
                                    }
                                });
                                new Chart("myChart_2", {
                                    type: "bar",
                                    data: {
                                        labels: xValues,
                                        datasets: [{
                                                data: yValues_2_1,
                                                backgroundColor: "red",
                                                label: "New User Practice"
                                            }, {
                                                data: yValues_2_2,
                                                backgroundColor: "blue",
                                                label: "All User Practice"
                                            }]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                            text: "User Practice Overview"
                                        }
                                    }
                                });
                                
                                new Chart("myChart_3", {
                                    type: "bar",
                                    data: {
                                        labels: xValues,
                                        datasets: [{
                                                data: yValues_3_1,
                                                backgroundColor: "red",
                                                label: "New Question"
                                            }, {
                                                data: yValues_3_2,
                                                backgroundColor: "blue",
                                                label: "All Question"
                                            }]
                                    },
                                    options: {
                                        legend: {display: false},
                                        title: {
                                            display: true,
                                            text: "Question Overview"
                                        }
                                    }
                                });
        </script>
    </body>

</html>