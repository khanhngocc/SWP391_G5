<%-- 
    Document   : Home
    Created on : Sep 12, 2021, 8:32:26 PM
    Author     : dell
--%>
<%@page import="model.Blog"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head><!--/head-->

    <body>

         <jsp:include page="Header.jsp" />   

        <section style="margin-bottom: 100px"><!--slider-->
            <div class="container centerImgLanding" >

                <div class="col-sm-9">
                    <div class="blog-post-area">


                        <div class="single-blog-post">
                            <h3>${blog.title}</h3>
                            <input id="isFeatured" type="hidden" value="${blog.isFeatured}">
                            <div class="post-meta">
                                <ul>
                                    <li><i class="fa fa-key"></i>${blog.category}</li>
                                    <li><i class="fa fa-user"></i>${blog.author}</li>
                                    <li><i class="fa fa-clock-o"></i>${blog.time}</li>
                                    <li><i class="fa fa-calendar"></i>${blog.date}</li>
                                </ul>
                                <span>


                                    <span id="starFeature" onclick="markStar(${blog.id})" class="styleStarBlog fa fa-star" <c:if test="${blog.isFeatured eq 0}">style="cursor:pointer;"</c:if> <c:if test="${blog.isFeatured eq 1}">style="cursor:pointer;color:#FE980F;"</c:if>></span>


                                    </span>
                                </div>
                                    <img src="${blog.img_url}" alt="" class="centerImgBlog"/>
                            <div class="desc-blog">${blog.description}</div>
                            <c:if test="${blog.attach_url ne ''}">
                                <a href="${blog.attach_url}" download>
                                    <i class="fa fa-download" style="color: #FE980F;margin-top: 30px"></i> ${blog.attachName}
                                </a>
                            </c:if>





                        </div>



                    </div>
                </div>
            </div>


        </section><!--/slider-->


        <jsp:include page="Footer.jsp" />  
        <script>


            function markStar(id) {
                
                var current_status = document.getElementById("isFeatured").value;
                var status;

                if (current_status == "1")
                    status = "0";
                else
                    status = "1";

                $.ajax({
                    url: "MarkStarBlog",
                    type: 'GET',
                    dataType: 'json',
                    data: {id: id, status: status},
                    success: function (data) {

                        document.getElementById("isFeatured").value = data;

                        if (data == "1")
                        {
                            document.getElementById("starFeature").style = "cursor:pointer;color:#FE980F;";
                        } else
                        {
                            document.getElementById("starFeature").style = "cursor:pointer;";
                        }

                    }
                });

            }
        </script>
        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
