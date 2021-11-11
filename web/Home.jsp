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

                                    <div class="item <c:if test="${list.id eq maxId}">active</c:if>">
                                            <div class="col-sm-6">
                                                <h1><span>Mega</span>-Deal</h1>
                                                <h2>${list.title}</h2>
                                            <p>${list.note}</p>
                                        </div>
                                        <div class="col-sm-6">
                                            <a href="${list.backlink}" >
                                                <img style="width: 400px;height: 400px" src="${list.image_Url}" class="girl img-responsive" alt="" />
                                            </a>

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
        <section style="margin-bottom: 100px">
            <div class="container">
                <div class="row">
                    <jsp:include page="SideBarForExam.jsp" />  
                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Latest free exams</h2>

                          <c:forEach items="${freetest}" var="i">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">

                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="${i.thumbnail}" alt="" />

                                                 <h4>${i.title}</h4>

                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">

                                                    <h4><a href="FreeTestDetail?id=${i.id}">${i.title}</a></h4>
                                                    <a href="QuizHandle?id=${i.id}" class="btn btn-default add-to-cart"><i class="fa fa-pencil"></i>Take</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </div><!--features_items-->



                        <div class="recommended_items" style="margin-top: 40px"><!--recommended_items-->
                            <h2 class="title text-center">latest posts</h2>
                            <div class="col-sm-12">
                                <ul class="media-list">
                                    <c:forEach items="${list_all_blogs}" var="list">
                                        <li class="media" style="margin-top: 20px">

                                            <a class="pull-left" href="DocumentDetailed?id=${list.id}">
                                                <img class="media-object" src="${list.img_url}" style="width: 130px;height: 130px" alt="">
                                            </a>
                                            <div class="media-body">
                                                <h4>${list.title} </h4>
                                                <ul class="sinlge-post-meta">
                                                    <li><i class="fa fa-key"></i>${list.category}</li>
                                                    <li><i class="fa fa-user"></i>${list.author}</li>
                                                    <li><i class="fa fa-clock-o"></i>${list.time}</li>
                                                    <li><i class="fa fa-calendar"></i>${list.date}</li>
                                                </ul>
                                                <div class="block-ellipsis">${list.description}</div>

                                                <a class="btn btn-primary" href="DocumentDetailed?id=${list.id}">Read more</a>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                        </div><!--/recommended_items-->

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