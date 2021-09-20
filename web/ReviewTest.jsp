<%-- 
    Document   : Home
    Created on : Sep 12, 2021, 8:32:26 PM
    Author     : dell
--%>

<%@page import="model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Homepage</title>
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
                                <a href="Home"><img src="images/home/partner1.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                
                                <ul class="nav navbar-nav">                                   
                                    <li><a href="DoTest?testId=1">Take Test</a></li>
                                    <li><a href="">Review Test</a></li>
                                    <li><a href="">Blog</a></li>
                                    <li><a href="Personal?email=${user.email}">Account</a></li>
                                    <li><a href="Logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->
            
        </header><!--/header-->

        <div class="shopper-informations">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <form action="DoTest" method="post">
                        <input type="text" name="test_id" value="${test.id}" hidden="">
                        <p>${test.title}      
                        <p>${mark}/10.00
                        <%int j =1;%>
                        <%ArrayList<Quiz> quiz = (ArrayList<Quiz>) request.getAttribute("quiz");%>
                        <%String[] answer = (String[]) request.getAttribute("anwser");%>
                        
                        <c:forEach items="${quiz}" var="i">
                            <p><%="Question "+j+": "%>${i.question}</p>
                            <p> ${anwser[j-1]}</p>
                            <p><input type="radio" name="${i.id}" id="a1" value="1" <%=quiz.get(j-1).getAnswer1().equals(answer[j-1])?"checked":""%>>
                            <label for="a1" ${i.answer1.equals(i.correct)?"style=\"color: green\"":""} <%=quiz.get(j-1).getAnswer1().equals(answer[j-1])?"style=\"color: red\"":""%> >${i.answer1}</label>
                            <p><input type="radio" name="${i.id}" id="a2" value="2" <%=quiz.get(j-1).getAnswer2().equals(answer[j-1])?"checked":""%>>
                            <label for="a2" ${i.answer2.equals(i.correct)?"style=\"color: green\"":""} <%=quiz.get(j-1).getAnswer2().equals(answer[j-1])?"style=\"color: red\"":""%> >${i.answer2}</label>
                            <p><input type="radio" name="${i.id}" id="a3" value="3" <%=quiz.get(j-1).getAnswer3().equals(answer[j-1])?"checked":""%>>
                            <label for="a3" ${i.answer3.equals(i.correct)?"style=\"color: green\"":""} <%=quiz.get(j-1).getAnswer3().equals(answer[j-1])?"style=\"color: red\"":""%> >${i.answer3}</label>
                            <p><input type="radio" name="${i.id}" id="a4" value="4" <%=quiz.get(j-1).getAnswer4().equals(answer[j-1])?"checked":""%>>
                            <label for="a4" ${i.answer4.equals(i.correct)?"style=\"color: green\"":""} <%=quiz.get(j-1).getAnswer4().equals(answer[j-1])?"style=\"color: red\"":""%> >${i.answer4}</label>
                            <%j++;%>
                        </c:forEach>                          
                    </form>
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
    </body>
</html>
