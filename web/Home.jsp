<%-- 
    Document   : Home
    Created on : Sep 12, 2021, 8:32:26 PM
    Author     : dell
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <c:forEach var = "i" begin = "0" end = "${sliderListSize-1}">
                                    <li data-target="#slider-carousel" data-slide-to="${i}" <c:if test="${i eq 0}">class="active"</c:if>></li>
                                </c:forEach>
                               
                            </ol>

                            <div class="carousel-inner">
                                <c:forEach items="${sliderList}" var="list">
                                    <div class="item <c:if test="${list.id eq 1}">active</c:if>">
                                        <div class="col-sm-6">
                                            <h1><span>Mega</span>-Deal</h1>
                                            <h2>${list.title}</h2>
                                            <p>${list.note}</p>

                                        </div>
                                        <div class="col-sm-6">
                                            <img style="width: 400px;height: 400px" src="${list.image_Url}" class="girl img-responsive" alt="" />

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section><!--/slider-->

        <jsp:include page="Footer.jsp" /> 

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
