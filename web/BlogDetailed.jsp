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
        <title>Blog Detailed</title>
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

        <section style="margin-bottom: 100px"><!--slider-->
            <div class="container centerImgLanding" >

                <div class="col-sm-9">
                    <div class="blog-post-area">


                        <div class="single-blog-post">
                            <h3>${blog.title}</h3>

                            <div class="post-meta">
                                <ul>
                                    <li><i class="fa fa-key"></i>${blog.category}</li>
                                    <li><i class="fa fa-user"></i>${blog.author}</li>
                                    <li><i class="fa fa-clock-o"></i>${blog.time}</li>
                                    <li><i class="fa fa-calendar"></i>${blog.date}</li>
                                </ul>
                                <span>
                                    <c:if test="${blog.status eq 1}">
                                        <a href="javascript:void(0);" onclick="changeBlogStatus(${blog.id}, '0')"><i class="fa fa-chain"></i> Deactivate</a>
                                    </c:if>
                                    <c:if test="${blog.status eq 0}">
                                        <a href="javascript:void(0);" onclick="changeBlogStatus(${blog.id}, '1')"><i class="fa fa-chain"></i> Activate</a>
                                    </c:if>
                                    <a href="UpdateBlog?id=${blog.id}"><i class="fa fa-pencil"></i> Edit</a>

                                </span>
                            </div>
                            <img src="${blog.img_url}" alt="" class="centerImgBlog"/>
                            <p class="desc-blog">${blog.description}</p>
                            <c:if test="${blog.attach_url ne ''}">
                                <a href="${blog.attach_url}" download>
                                    <i class="fa fa-download" style="color: #FE980F;margin-bottom: 50px"></i> ${blog.attachName}
                                </a>
                            </c:if>





                        </div>



                    </div>
                </div>
            </div>


        </section><!--/slider-->


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
