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

        
        <jsp:include page="Header.jsp" />  
        
        <section style="margin-top: 20px;margin-bottom: 100px">
            <div class="container">
                <div class="row">
                    <jsp:include page="SideBarForExam.jsp" />  

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Test List</h2>
                            <c:forEach items="${listAllFreeQuizzes}" var="i">
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
                        <div class="pagination-area">
                            <ul class="pagination">
                                <c:if test="${pageindex gt gap}">
                                    <li class="page-item"><a class="page-link" href="TestControl?page=1&searchName=${searchName}&category=${category}">First</a></li>
                                    </c:if>
                                    <c:forEach var = "i" begin = "${gap}" end = "1">
                                        <c:if test="${pageindex - gap gt 0}">
                                        <li class="page-item"><a class="page-link" href="TestControl?page=${pageindex -i}&searchName=${searchName}&category=${category}">${pageindex - i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach var = "i" begin = "1" end = "${gap}">
                                        <c:if test="${pageindex + gap le pagecount}">
                                        <li class="page-item"><a class="page-link" href="TestControl?page=${pageindex + i}&searchName=${searchName}&category=${category}">${pageindex + i}</a></li> 
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${pageindex + gap lt pagecount}">
                                    <li class="page-item"><a class="page-link" href="TestControl?page=${pagecount}&searchName=${searchName}&category=${category}">Last</a></li> 
                                    </c:if>
                            </ul>

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