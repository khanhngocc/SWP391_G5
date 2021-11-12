<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Subject List</title>
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

        <jsp:include page="HeaderManager.jsp" /> 

        <section><!--slider-->
            <div class="container" style="height: auto; margin-bottom: 40px">



                <div style="margin-top: 30px; margin-bottom: 20px">
                    <a href="AddSubject"><i class="fa fa-plus"></i> Create a subject</a> 
                </div>

                <table class="table" id="myTable">
                    <thead>
                        <tr>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(0)">ID</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(1)">Title</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(3)">Author</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(4)">Status</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(5)">Price</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(6)">Sale Price</a></th>
                            <th scope="col" style="width: auto;" colspan="3"><a href="javascript:void(0);" onclick="sort(2)">Action</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list_all_subjects}" var="list">
                            <tr>
                                <th scope="row">${list.id}</th>
                                <td>${list.title}</td>
                                <td>${list.author_name}</td>
                                <td>${list.status}</td>
                                <td>${list.price}</td>
                                <td>${list.salePrice}</td>

                                <td>
                                    <c:if test="${list.status eq 'Published'}">
                                        <a href="javascript:void(0);" onclick="changeStatus(${list.id}, 'Unpublished')"><i class="fa fa-chain"></i> Unpublish</a>
                                    </c:if>
                                    <c:if test="${list.status eq 'Unpublished'}">
                                        <a href="javascript:void(0);" onclick="changeStatus(${list.id}, 'Published')"><i class="fa fa-chain"></i> Publish</a>
                                    </c:if>
                                    <a href="SubjectDetailed?id=${list.id}"><i class="fa fa-eye"></i> View</a> 
                                    <a href="UpdateSubject?id=${list.id}"><i class="fa fa-pencil"></i> Update</a> 

                                </td> 

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="SubjectList?page=1">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="SubjectList?page=${pageindex -i}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="SubjectList?page=${pageindex + i}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="SubjectList?page=${pagecount}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
            </div>
        </section><!--/slider-->


        <jsp:include page="Footer.jsp" /> 

        <script src="js/subjectHelper.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>