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
        <title>Blog List</title>
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
                            <option value="${list.value}" ${list.value == category ? 'selected':''}>${list.value}</option>
                        </c:forEach>
                    </select>   
                </form>
                <div style="margin-top: 30px; margin-bottom: 20px">
                    <a href="AddBlog"><i class="fa fa-plus"></i> Create a blog</a> 
                </div>

                <table class="table" id="myTable">
                    <thead>
                        <tr>

                            <th scope="col"><a href="javascript:void(0);" onclick="sort(0)">ID</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(1)">Title</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(2)">Thumbnail</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(3)">Category</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(4)">Author</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(5)">Status</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(6)">TimeCreated</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(7)">DateCreated</a></th>
                            <th scope="col" style="width: auto;text-align: center" colspan="3"><a href="javascript:void(0);" >Action</a></th>
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
                                    <td>Activate</td>
                                </c:if>
                                <c:if test="${list.status eq 0}">
                                    <td>Deactivate</td>
                                </c:if>
                                <td>${list.time}</td>
                                <td>${list.date}</td>

                                <td style="width: 250px">
                                    <c:if test="${list.status eq 1}">
                                        <a href="javascript:void(0);" onclick="changeBlogStatus(${list.id}, '0')"><i class="fa fa-chain"></i> Deactivate</a>
                                    </c:if>
                                    <c:if test="${list.status eq 0}">
                                        <a href="javascript:void(0);" onclick="changeBlogStatus(${list.id}, '1')"><i class="fa fa-chain"></i> Activate</a>
                                    </c:if>
                                    <a href="BlogDetailed?id=${list.id}"><i class="fa fa-eye"></i> View</a> 
                                    <a href="UpdateBlog?id=${list.id}"><i class="fa fa-pencil"></i> Update</a> 
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


        <jsp:include page="Footer.jsp" /> 
        <script src="js/blogHander.js"></script>
        <script src="js/sortHelper.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
