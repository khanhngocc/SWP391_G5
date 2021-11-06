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
        <title>Document List</title>
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


        <section style="margin-top: 20px;margin-bottom: 100px"><!--slider-->

            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Category</h2>
                            <form action="DocumentList">
                                <div class="search_box centerSearch">
                                    <input type="text" placeholder="Search" name="categories" value="${categories}" hidden=""/>
                                    <input name="searchName" type="text" placeholder="Search" value="${name_search}" onchange="this.form.submit()"/>
                                </div>
                            </form>
                            <div class="panel-group category-products" id="accordian">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="DocumentList">All</a></h4>
                                    </div>
                                </div>
                                <c:forEach items="${listCategories}" var="list">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a href="DocumentList?searchName=${name_search}&categories=${list.value}">${list.value}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--/category-products-->
                             <h2 class="title text-center">Hot Featured</h2>
                            <div class="panel-group category-products" class ="container" style="border:none">
                                <c:forEach items="${list5}" var="i">
                                    <div class="col-md-6" style="margin-bottom: 10px">
                                        <img class="featuresBlog" src="${i.img_url}" alt=""><br>
                                        <div style="margin-top: 5px"><a href="DocumentDetailed?id=${i.id}">${i.title}</a></div>

                                    </div>
                                </c:forEach>
                            </div>   


                        </div>
                    </div> 
                    <div class="col-sm-9 padding-right">
                        <div class="recommended_items"><!--recommended_items-->
                            <h2 class="title text-center">Documents</h2>
                            <div class="col-sm-12">
                                <ul class="media-list">
                                    <c:forEach items="${list_all_blogs}" var="list">
                                        <li class="media" style="margin-top: 20px">

                                            <a class="pull-left" href="DocumentDetailed?id=${list.id}">
                                                <img class="media-object" src="${list.img_url}" style="width: 130px;height: 130px" alt="">
                                            </a>
                                            <div class="media-body">
                                                <h4 >${list.title} </h4>
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

                        </div>
                        <div class="pagination-area">
                            <ul class="pagination">

                                <c:if test="${pageindex gt gap}">
                                    <li class="page-item"><a class="page-link" href="DocumentList?page=1&searchName=${name_search}&categories=${category}">First</a></li>
                                    </c:if>
                                    <c:forEach var = "i" begin = "${gap}" end = "1">
                                        <c:if test="${pageindex - gap gt 0}">
                                        <li class="page-item"><a class="page-link" href="DocumentList?page=${pageindex -i}&searchName=${name_search}&categories=${category}">${pageindex - i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach var = "i" begin = "1" end = "${gap}">
                                        <c:if test="${pageindex + gap le pagecount}">
                                        <li class="page-item"><a class="page-link" href="DocumentList?page=${pageindex + i}&searchName=${name_search}&categories=${category}">${pageindex + i}</a></li> 
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${pageindex + gap lt pagecount}">
                                    <li class="page-item"><a class="page-link" href="DocumentList?page=${pagecount}&searchName=${name_search}&categories=${category}">Last</a></li> 
                                    </c:if>
                            </ul>

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
