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
        <title>Slide List</title>
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

        <jsp:include page="HeaderMarketing.jsp" /> 

        <section id="slider"><!--slider-->
            <div class="container">
                <form action="SlideList" class="searchform">
                    <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${name_search}"/>
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                </form>
                <form action="SlideList" >

                    <input type="text" placeholder="Search" name="searchName" value="${name_search}" hidden=""/>
                    <select style="width: 10%;margin-top: 10px" name="status" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listStatus}" var="list">
                            <option value="${list}" ${list == status ? 'selected':''}>${list}</option>
                        </c:forEach>
                    </select>   
                </form>
                <div style="margin-top: 30px; margin-bottom: 20px">
                    <a href="AddSlide"><i class="fa fa-book"></i> Create a slider</a> 
                </div>

                <table class="table" id="myTable">
                    <thead>
                        <tr>

                            <th scope="col"><a href="javascript:void(0);" onclick="sort(0)">ID</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(1)">Title</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(2)">Thumbnail</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(3)">BackLink</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(4)">Status</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(5)">Author</a></th>
                            <th scope="col" style="width: auto;text-align: center" colspan="2"><a href="javascript:void(0);">Action</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_all_slides}" var="list">
                            <tr>
                                <th scope="row">${list.id}</th>
                                <td>${list.title}</td>
                                <td> <img class="media-object" src="${list.image_Url}" style="width: 95px;height: 95px" alt=""></td>
                                <td>${list.backlink}</td>
                                <td>${list.status}</td>
                                <td>${list.author_name}</td>
                                <td>
                                    <c:if test="${list.status eq 'Published'}">
                                        <a href="javascript:void(0);" onclick="changeSlideStatus(${list.id}, 'Unpublished')"><i class="fa fa-chain"></i> Unpublished</a> 
                                    </c:if>
                                    <c:if test="${list.status eq 'Unpublished'}">
                                        <a href="javascript:void(0);" onclick="changeSlideStatus(${list.id}, 'Published')"><i class="fa fa-chain"></i> Published</a> 
                                    </c:if>
                                    <a href="UpdateSlide?id=${list.id}"><i class="fa fa-pencil"></i> Update</a> 

                                </td> 

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="SlideList?page=1&searchName=${name_search}&categories=${status}">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="SlideList?page=${pageindex -i}&searchName=${name_search}&categories=${status}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="SlideList?page=${pageindex + i}&searchName=${name_search}&categories=${status}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="SlideList?page=${pagecount}&searchName=${name_search}&categories=${status}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
            </div>
        </section><!--/slider-->


        <jsp:include page="Footer.jsp" /> 
        <script src="js/sortHelper.js"></script>
        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
