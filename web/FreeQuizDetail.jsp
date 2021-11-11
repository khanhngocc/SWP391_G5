<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
    Fix        : 22/10/2021
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <style>

            #img-left-side{
                height: 50px;
                width: 70px;
                border-radius: 10%;
            }
        </style>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>User Detailed</title>
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
        <c:if test="${sessionScope.user eq null}">
            <jsp:include page="HeaderFree.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 1}">
            <jsp:include page="HeaderCustomer.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 2}">
            <jsp:include page="HeaderMarketing.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 3}">
            <jsp:include page="HeaderAdmin.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 4}">
            <jsp:include page="HeaderExpert.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 5}">
            <jsp:include page="HeaderManager.jsp" />  
        </c:if>
        <section style="margin-top: 20px;margin-bottom: 100px">
            <div>

                <div class="container">
                    <jsp:include page="SideBarForExam.jsp" />  
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-6">
                            <div class="view-product">
                                <img src="${quiz.getThumbnail()}" alt="" />

                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="product-information"><!--/product-information-->
                                <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                <h2>${quiz.getTitle()}</h2>
                                <p>${quiz.getDescription()}</p>
                                <img src="images/product-details/rating.png" alt="" />
                                <p><b>Subject:</b> ${sub.title}</p>
                                <p><b>Category:</b> ${quiz.category}</p>
                                <p><b>Level:</b> ${quiz.getLevel()}</p>
                                <p><b>Type:</b> ${quiz.type}</p>
                                <p><b>Number of question:</b> ${quiz.getNumber_of_question()}</p>
                                <p><b>Duration:</b> ${quiz.getDuration()}</p>
                                <p><b>Rate:</b> ${quiz.getRate()}</p>
                                <c:choose>
                                    <c:when test="${sessionScope.user==null}">

                                        <a href="Login?id=${quiz.id}" class="btn btn-primary">Login To Take The Test</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="QuizHandle?id=${quiz.id}" class="btn btn-primary">Take The Test</a>
                                    </c:otherwise>
                                </c:choose>

                            </div><!--/product-information-->
                        </div>
                    </div>

                </div>
            </div>

        </section>
        <jsp:include page="Footer.jsp" />  

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>