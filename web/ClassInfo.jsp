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
        <style>
            #top5{
                height: 200px;
                width: 200px;
                border-radius: 10px;
            }
        </style>
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

        <jsp:include page="Header.jsp" />    
        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                      

                    </div>
                </div>
            </div>
        </section><!--/slider-->
        <section style="margin-bottom: 100px">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>MORE</h2>
                            <form action="ClassShow" method="post">
                                <div class="search_box centerSearch">
                                    <input name="search" type="text" placeholder="Search"/>
                                </div>
                            </form>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->

                                <div class="panel panel-default" style="width: 150%">
                                    <div class="panel-heading">
                                        <h4 class="panel-title" style="width: 150%"><a href="ClassShow?list=All">All Classes</a></h4><br>
                                        <h4 class="panel-title" style="width: 150%"><a href="ClassShow?list=Your">Your Classes</a></h4>
                                    </div>
                                </div>
                                <h2 style="padding-top: 10px">RECENT CLASS</h2>
                                <c:forEach items="${lc5}" var="i">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <img id="top5" src="${i.getLogo()}" alt="">
                                            <h4 class="panel-title"><a href="ClassDetail?id=${i.getId()}">${i.getName()}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--/category-products-->


                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Hot Class</h2>

                            <c:forEach items="${lc}" var="i">
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">

                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="${i.getLogo()}" alt="" />

                                                <h4>${i.getName()}</h4>

                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">

                                                    <h4><a href="ClassDetail?id=${i.getId()}">Info of ${i.getName()}</a></h4>
                                                    
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </div><!--features_items-->
 <center><div class="pagination-area">
                                <ul class="pagination"> 
                                    <c:forEach begin="1" end="${pagesize}" var="i">
                                        <c:choose>
                                            <c:when test="${page==i}">
                                                <li><a href="" class="active">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li><a href="ClassManager?page=${i}">${i}</a></li> 
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                </ul>
                            </div></center>


                      

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