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
                                    <li><a href="">Take test</a></li>
                                    <li><a href="">Review Test</a></li>
                                    <li><a href="Blog">Blog</a></li>
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

                <div class="col-sm-9">
                    <a href="AddBlog"><i class="fa fa-book"></i> Create blog</a>
                    <br>
                    <br>
                    <form action="Blog" class="searchform">
                        <input type="text" placeholder="Search" name="searchName" value="${name_search}"/>
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </form>
                    <br>
                    <br>
                    <div class="blog-post-area">
                        <h2 class="title text-center">Latest From our Blog</h2>
                        <c:forEach items="${list_all_blogs}" var="list">
                            <div class="single-blog-post">
                                <h3>${list.title}</h3>
                                <div class="post-meta">
                                    <ul>
                                        <li><i class="fa fa-user"></i>${list.author}</li>

                                        <li><i class="fa fa-calendar"></i>${list.date}</li>
                                    </ul>
                                    <span>
                                        <a href=""><i class="fa fa-pencil"></i> Edit</a>
                                        <a href=""><i class="fa fa-trash-o"></i> Delete</a>
                                    </span>
                                </div>

                                        <p class="block-ellipsis">${list.description}</p>
                                <a  class="btn btn-primary" href="">Read More</a>
                            </div>
                        </c:forEach>

                        <div class="pagination-area">
                            <ul class="pagination">

                                <c:if test="${pageindex gt gap}">
                                    <li class="page-item"><a class="page-link" href="Blog?page=1&searchName=${name_search}">First</a></li>
                                    </c:if>
                                    <c:forEach var = "i" begin = "${gap}" end = "1">
                                        <c:if test="${pageindex - gap gt 0}">
                                        <li class="page-item"><a class="page-link" href="Blog?page=${pageindex -i}&searchName=${name_search}">${pageindex - i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach var = "i" begin = "1" end = "${gap}">
                                        <c:if test="${pageindex + gap le pagecount}">
                                        <li class="page-item"><a class="page-link" href="Blog?page=${pageindex + i}&searchName=${name_search}">${pageindex + i}</a></li> 
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${pageindex + gap lt pagecount}">
                                    <li class="page-item"><a class="page-link" href="Blog?page=${pagecount}&searchName=${name_search}">Last</a></li> 
                                    </c:if>
                            </ul>

                        </div>
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
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
