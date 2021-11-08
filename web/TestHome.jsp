<%-- 
    Document   : TestHome
    Created on : Oct 30, 2021, 9:46:52 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>

        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Test Free</title>
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
        
        <c:if test="${sessionScope.user eq null}">
            <jsp:include page="HeaderFree.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 1}">
            <jsp:include page="HeaderCustomer.jsp" />  
        </c:if>

        <section style="margin-bottom: 100px">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">

                            <h2>SIDE-BAR</h2>
                            <div class="panel-group category-products">
                                <form action="TestControl" method="POST"><div class="search_box centerSearch">
                                        <input type="text" name="search" placeholder="Search" value="${search}"/>

                                    </div></form>
                            </div>
                            <div class="panel-group category-products" id="accordian"style="border:none"><!--category-productsr-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Test Categories
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="sportswear" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul><c:forEach var="i" items="${lists}">
                                                    <li><a href="TestByCategory?type=${i.value}">${i.value} </a></li>
                                                    </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-group category-products" class ="container" style="border:none">
                                    <c:forEach items="${list5}" var="i">
                                        <div class="col-md-6">
                                            <img id="img-left-side" src="${i.thumbnail}" alt=""><br>
                                            <i><a href="FreeTestDetail?id=${i.id}">${i.title}</a></i>

                                        </div>
                                    </c:forEach>
                                </div>   



                            </div><!--/category-productsr-->






                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Test List</h2>







                            <c:forEach var="i" items="${lq}">	
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img class="imgTestHome"  src="${i.thumbnail}" alt="" />
                                                <h2>${(i.getDuration()-i.getDuration()%60)/60} min  ${i.getDuration()%60}  secs</h2>
                                                <p>${i.title}</p>

                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2>${i.getDuration()} secs </h2>
                                                    <p><a href="FreeTestDetail?id=${i.id}">${i.title}</a></p>
                                                    <a href = "Login?id=${i.id}" class="btn btn-default add-to-cart"><i class="fa fa-pencil"></i>Do Test</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li style="color:orange;text-align:center">${i.type}</li>
                                                <li style="color:orange;text-align:center">${i.getNumber_of_question()} questions</li>
                                            </ul>
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
                                                <li><a href="TestControl?page=${i}">${i}</a></li> 
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