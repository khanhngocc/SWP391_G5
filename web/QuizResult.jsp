<%-- 
    Document   : QuizList
    Created on : Sep 24, 2021, 10:51:13 PM
    Author     : Admin
    Fix        : 22/10/2021
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
        <title>Quiz Result</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">     
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        <jsp:include page="Header.jsp" />  

        <div class="container" style="margin-bottom: 100px">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div class="signup-form">
                        <center><h2>Quiz Result</h2></center>                        
                        <div style="background-color: #F0F3F2">
                            <c:if test="${history.status eq 'Pass'}">
                                <center><h3 style="color: green; padding-top: 20px;padding-bottom: 20px">Pass</h3></center>
                                </c:if>
                                <c:if test="${history.status eq 'Fail'}">
                                <center><h3 style="color: red; padding-top: 20px;padding-bottom: 20px">Fail</h3></center>
                                </c:if>
                            <center><h4 style="padding-bottom: 20px">Quiz: ${x.title}</h4></center>
                            <p><text style="font-size: 16px;padding-left: 160px">Total Question:<text style="font-size: 16px;padding-left: 70px">${listCheckAnswer.size()}
                            <p><text style="font-size: 16px;padding-left: 125px">Answered Question:<text style="font-size: 16px;padding-left: 70px">${listAnswer.size()}
                            <p><text style="font-size: 16px;padding-left: 107px">Unanswered Question:<text style="font-size: 16px;padding-left: 70px">${listUnanswer.size()}
                            <p><text style="font-size: 16px;padding-left: 143px">Correct Question:<text style="font-size: 16px;padding-left: 70px">${count}
                            <p><text style="font-size: 16px;padding-left: 192px">Pass Rate:<text style="font-size: 16px;padding-left: 70px">${x.rate}
                            <center><h4 style="padding-bottom: 20px">Details: </h4></center>
                            <center>
                                <table  class="table" id="myTable">
                                    <tr>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(0)">Sub-Category</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(1)">#Question</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(2)">Correct</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(3)">Rate</a></strong></th>                                   
                                    </tr>

                                    <%
                                        int[] array = (int[]) request.getAttribute("array");
                                        int[] arrayCorrect = (int[]) request.getAttribute("arrayCorrect");
                                        int count = 0;
                                    %>
                                    <c:forEach begin="0" end="${listCategory.size()-1}" var="i">
                                        <tr>
                                            <td>${listCategory.get(i).getValue()}</td>
                                            <td>${array[i]}</td>                                        
                                            <td>${arrayCorrect[i]}</td>                                            
                                            <td><%= array[count] == 0 ? "100" : arrayCorrect[count] * 100 / array[count]%>%</td>
                                            <%count++;%>
                                        </tr>     
                                    </c:forEach>
                                </table>
                            </center>
                        </div>    
                        <div style="float: right; padding-top: 10px">
                            <a href="QuizReview?id=${id}"><text style="font-size: 16px">More information in Quiz Review</a>
                        </div>
                        <br><br>
                    </div>
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