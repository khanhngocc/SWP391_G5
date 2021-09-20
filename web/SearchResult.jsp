<%@page import="java.util.List"%>
<%@page import="model.Test"%>
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
                                    <li><form action="" method="post">
                                            <input type="text" id="search" name="title" style="width: 70%">
                                            <input type="submit" value="Search">
                                        </form></li>
                                    <li><a href="linkTest">Take Test</a></li>
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

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">

                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Result</h2>
                            <%!int count=0;%>
                            <%List<Test> test = (List<Test>)request.getAttribute("test");                
                            for (Test elem : test) {%>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <!--                                        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fcahub.in%2Fquiz%2Fauditing-standard-530-quiz-4&psig=AOvVaw2qs3PC2zL7B9NnkjZChuCu&ust=1632148732580000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCID04IGii_MCFQAAAAAdAAAAABAJ" alt="" />-->                                                
                                                <h2><%=elem.getDuration() %> mins</h2>
                                                <p><%=elem.getTitle()%></p>
                                                <a href="DoTest?testId=<%=elem.getId()%>" class="btn btn-default add-to-cart"><i class="fa fa-pencil"></i>Take this Test</a>
                                            </div>                                    
                                        </div>                                
                                    </div>
                                </div>
                            <% count++;%>
                                <%if(count==3){%> <div class="col-md-12"></div> <%count=0;}%>
                                <% } %>
                                <%count=0;%>
                            <div class="store-filter clearfix">
                                
                                <ul class="store-pagination" style="display: inline-block">
                                    <c:forEach begin="1" end="${pagesize}" var="i">
                                        <c:choose>
                                            <c:when test="${page==i}">
                                                <li class="active">${i}</li>
                                            </c:when>

                                            <c:otherwise>
                                                <li><a href="searchTest?title=${title}&page=${i}">${i}</a></li> 
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div><!--features_items-->
                    </div>
                </div>
            </div>
        </section>

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
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>