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
        <jsp:include page="HeaderCustomer.jsp" />  

        <div class="container" style="margin-bottom: 100px">
            <div class="row">
                <div class="col-sm-3">
                    <center><h5 style="padding-top: 60px">Correct Question</h5></center>
                    <center><div class="pagination-area">
                        <ul class="pagination">  
                            <c:forEach begin="1" end="${listCheckAnswer.size()}" var="i">
                                <c:if test="${listCheckAnswer.get(i-1).answer eq qq.getQuestionById(String.valueOf(listCheckAnswer.get(i-1).getQuestion_id())).getOption_correct() && listCheckAnswer.get(i-1).answer ne ''}">
                                    <li><a href="QuizReview?id=${id}&page=${i}" class="${page==i?"active":""}">${i}</a></li>
                                </c:if>
                            </c:forEach>                                        
                        </ul>
                    </div></center>
                    <center><h5>Incorrect Question</h5></center>
                    <center><div class="pagination-area">
                        <ul class="pagination">   
                            <c:forEach begin="1" end="${listCheckAnswer.size()}" var="i">
                                <c:if test="${listCheckAnswer.get(i-1).answer ne qq.getQuestionById(String.valueOf(listCheckAnswer.get(i-1).getQuestion_id())).getOption_correct() && listCheckAnswer.get(i-1).answer ne ''}">
                                    <li><a href="QuizReview?id=${id}&page=${i}" class="${page==i?"active":""}">${i}</a></li>
                                </c:if> 
                            </c:forEach>
                        </ul>
                    </div></center>
                    <center><h5>Unanswered Question</h5></center>
                    <center><div class="pagination-area">
                        <ul class="pagination">      
                            <c:forEach begin="1" end="${listCheckAnswer.size()}" var="i">
                                <c:if test="${listCheckAnswer.get(i-1).answer eq ''}">
                                    <li><a href="QuizReview?id=${id}&page=${i}" class="${page==i?"active":""}">${i}</a></li>
                                </c:if>
                            </c:forEach>                                   
                        </ul>
                    </div></center>
                </div>

                <div class="col-sm-6">
                    <div class="signup-form">
                        <center><h2>Quiz Review</h2></center>                        
                        <div style="background-color: #F0F3F2" >
                            <center><h4 style="padding-bottom: 20px; padding-top: 20px">Quiz: ${x.title}</h4></center>
                            <p><text style="font-size: 16px;padding-left: 20px">Question ${page}: ${quest.content}
                            <p style="padding-left: 40px" ><input disabled="true" type="radio" id="a1" name="rd" ${quest.option1 eq CheckAnswer.answer?"checked":""}>
                                <label for="a1" ${quest.option1 eq quest.option_correct?"style=\"color: green\"":""} ${quest.option1 eq CheckAnswer.answer?"style=\"color: red\"":""}>${quest.option1}</label>
                            <p style="padding-left: 40px" ><input disabled="true" type="radio" id="a2" name="rd" ${quest.option2 eq CheckAnswer.answer?"checked":""}>
                                <label for="a2" ${quest.option2 eq quest.option_correct?"style=\"color: green\"":""} ${quest.option2 eq CheckAnswer.answer?"style=\"color: red\"":""}>${quest.option2}</label>
                            <p style="padding-left: 40px" ><input disabled="true" type="radio" id="a3" name="rd" ${quest.option3 eq CheckAnswer.answer?"checked":""}>
                                <label for="a3" ${quest.option3 eq quest.option_correct?"style=\"color: green\"":""} ${quest.option3 eq CheckAnswer.answer?"style=\"color: red\"":""}>${quest.option3}</label>
                            <p style="padding-left: 40px" ><input disabled="true" type="radio" id="a4" name="rd" ${quest.option4 eq CheckAnswer.answer?"checked":""}>
                                <label for="a4" ${quest.option4 eq quest.option_correct?"style=\"color: green\"":""} ${quest.option4 eq CheckAnswer.answer?"style=\"color: red\"":""}>${quest.option4}</label>
                            </p> 
                            <br>
                        </div>    
                    </div>
                </div>

                <div class="col-sm-3">
                    <center><h5 style="padding-top: 60px">Question Navigation</h5></center>
                    <center><div class="pagination-area">
                        <ul class="pagination">      
                            <c:forEach begin="1" end="${listCheckAnswer.size()}" var="i">
                                <c:choose>
                                <c:when test="${page==i}">
                                    <li><a href="QuizReview?id=${id}&page=${i}" class="active">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="QuizReview?id=${id}&page=${i}">${i}</a></li> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>                                         
                        </ul>
                    </div></center>
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
    </body>
</html>