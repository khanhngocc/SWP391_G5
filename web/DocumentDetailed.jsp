<%-- 
    Document   : DocumentDetailed
    Created on : Sep 24, 2021, 9:53:09 PM
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
        <title>Document Detailed</title>
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
                                    <div class="col-md-6">
                                        <img class="featuresBlog" src="${i.img_url}" alt=""><br>
                                        <i><a href="DocumentDetailed?id=${i.id}">${i.title}</a></i>

                                    </div>
                                </c:forEach>
                            </div>   


                        </div>
                    </div> 
                    <div class="col-sm-9 padding-right">
                        <div class="blog-post-area">
                            <h2 class="title text-center">Documents</h2>
                            <div class="single-blog-post">
                                <h3>${blog.title}</h3>

                                <div class="post-meta">
                                    <ul>
                                        <li><i class="fa fa-key"></i>${blog.category}</li>
                                        <li><i class="fa fa-user"></i>${blog.author}</li>
                                        <li><i class="fa fa-clock-o"></i>${blog.time}</li>
                                        <li><i class="fa fa-calendar"></i>${blog.date}</li>
                                    </ul>

                                </div>
                                        <img src="${blog.img_url}" alt="" class="centerImgBlog" />

                                <p class="desc-blog">${blog.description}</p>
                                <c:if test="${blog.attach_url ne ''}">
                                    <c:if test="${sessionScope.user ne null}">
                                        <a href="${blog.attach_url}" download>
                                            <i class="fa fa-download" style="color: #FE980F;margin-top: 30px"></i> ${blog.attachName}
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope.user eq null}">
                                        <a href="#" class="isDisabled">
                                            <i class="fa fa-download" style="color: #FE980F;margin-top: 30px"></i> ${blog.attachName}
                                        </a>
                                        <p class="text-tooltip">Hint: Please login to download attached file! <a href="Login">Login</a></p>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>








                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="Footer.jsp" />  
        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
