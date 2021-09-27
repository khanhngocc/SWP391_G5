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
                                <a href="HomeMarketing"><img src="images/home/partner1.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">

                                    <li><a href="BlogList">Blog</a></li>
                                    <li><a href="Personal?email=${user.email}">Account</a></li>
                                    <li><a href="Logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->


        </header><!--/header-->

        <section id="slider"><!--slider-->
            <div class="container">
                <form action="BlogList" class="searchform">
                    <input type="text" placeholder="Search" name="categories" value="${categories}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${name_search}"/>
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                </form>
                <form action="BlogList" >

                    <input type="text" placeholder="Search" name="searchName" value="${name_search}" hidden=""/>
                    <select style="width: 10%;margin-top: 10px" name="categories" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listCategories}" var="list">
                            <option value="${list}" ${list == category ? 'selected':''}>${list}</option>
                        </c:forEach>
                    </select>   
                </form>
                <div style="margin-top: 30px; margin-bottom: 20px">
                    <a href="AddBlog"><i class="fa fa-book"></i> Create a blog</a> 
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Title</th>
                            <th scope="col">Thumbnail</th>
                            <th scope="col">Category</th>
                            <th scope="col">Author</th>
                            <th scope="col" style="width: 105px">Status</th>
                            <th scope="col">TimeCreated</th>
                            <th scope="col">DateCreated</th>
                            <th scope="col" style="width: 290px;text-align: center" colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_all_blogs}" var="list">
                            <tr>
                                <th scope="row">${list.id}</th>
                                <td>${list.title}</td>
                                <td> <img class="media-object" src="${list.img_url}" style="width: 95px;height: 95px" alt=""></td>
                                <td>${list.category}</td>
                                <td>${list.author}</td>
                                <c:if test="${list.status eq 1}">
                                    <td><a href="ChangeBlogStatus?id=${list.id}&status=0"><i class="fa fa-unlock"></i> deactivated</a></td>
                                </c:if>
                                <c:if test="${list.status eq 0}">
                                    <td><a href="ChangeBlogStatus?id=${list.id}&status=1"><i class="fa fa-lock"></i> activated</a></td>
                                </c:if>
                                <td>${list.time}</td>
                                <td>${list.date}</td>

                                <td><a href="BlogDetailed?id=${list.id}"><i class="fa fa-eye"></i> View</a> 
                                    <a href="UpdateBlog?id=${list.id}"><i class="fa fa-pencil"></i> Update</a> 
                                    <a href="#" onclick="deleteBlog(${list.id})"><i class="fa fa-trash-o"></i> Delete</a> 
                                </td> 

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="BlogList?page=1&searchName=${name_search}&categories=${category}">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="BlogList?page=${pageindex -i}&searchName=${name_search}&categories=${category}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="BlogList?page=${pageindex + i}&searchName=${name_search}&categories=${category}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="BlogList?page=${pagecount}&searchName=${name_search}&categories=${category}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
            </div>
        </section><!--/slider-->


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

        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>