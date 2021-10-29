<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
    Fix        : 22/10/2021
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
          <style>
            img{
                height: 200px;
                    width: 200px;
                    border-radius: 10%;
            }
            
            #img-left-side{
                height: 50px;
                width: 70px;
                border-radius: 10%;
            }
        </style>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>User Detailed</title>
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
    </head>
    <!--/head-->

    <body>
        <header id="header"><!--header-->


            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="TestControl.jsp"><img src="images/home/partner1.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->


        </header>
        <section>
            <div>

                <div class="container">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            
                            <h2>SIDE-BAR</h2>
                             <div class="panel-group category-products">
                                <form action="TestControl" method="POST"><div class="search_box pull-left">
                                        <input type="text" name="search" placeholder="Search"/>

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
                                            <img id="img-left-side"src="${i.thumbnail}" alt=""><br>
                                            <i><a href="FreeTestDetail?id=${i.id}">${i.title}</a></i>
                                            
                                        </div>
                                    </c:forEach>
                                </div>   

                               
                                
                            </div><!--/category-productsr-->
                           





                        </div>
                    </div>

                    <div class = "col-sm-9" >
                        <!--sign up form-->
                        <div class="signup-form">
                        <h2>Quiz Detailed</h2>
                        <p class="text-primary">${mess}</p>
                        <form enctype="multipart/form-data" id="myForm" action="" method="post">
                            <img id="profile-ava" class="imageAvatar" src="${quiz.getThumbnail()}">
                            <br>
                           
                            Title
                            <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.getTitle()}" />
                            Brief Information
                            <textarea name="description"type="text" readonly>${quiz.getDescription()}</textarea>

                            Subject
                            
                            <input name="subject" type="text" placeholder="Tittle" readonly value="${sub.title}" />
                            
                            Category
                            <input name="category" type="text" placeholder="Tittle" readonly value="${quiz.category}" />

                            Level
                            <input name="level"type="text" placeholder="Level" value="${quiz.getLevel()}" readonly />							
                            User ID:
                            <input readonly value="${quiz.getUser_id()}"/>							
                            Type
                            <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.type}" />
                            
                            Number of Questions: 
                            <input readonly value="${quiz.getNumber_of_question()}"/>
                            Duration
                            <input name="duration"type="number" placeholder="Duration" value="${quiz.getDuration()}" readonly="true"/>	
                            Rate
                            <input name="rate"type="text" placeholder="Rate" value="${quiz.getRate()}" readonly="true" />
                            
                            
                            <a href="javascript:void(0)" onclick="Show('myTable')"><h2>Quiz Content</h2></a>
                            
                            
                            <table  class="table" id="myTable" style="display: none">
                                <tr>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(0)">Sub-Category</a></strong></th>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(1)"># Question</a></strong></th>                                   
                                </tr>

                                <c:forEach begin="0" end="${listCategory.size()-1}" var="i">
                                    <tr>
                                        <td>${listCategory.get(i).value}</td>
                                        <td>${array[i]}</td>                                        
                                    </tr>     
                                </c:forEach>
                            </table>
                            
                        </form>
                            
                        </div>
                    </div>                       
                </div>


                            <c:choose>
                            <c:when test="${sessionScope.user==null}">

                            <center> <button type="button" class="btn btn-warning"><a href = "Login?id=${quiz.id}">Login To Take The Test</a></button></center>
                           </c:when>
                           <c:otherwise>
                           <center> <button type="button" class="btn btn-warning"><a href = "QuizHandle?id=${quiz.id}">Take The Test</a></button></center>
                           </c:otherwise>
                           </c:choose>
            </div>

        </section>
        <!--/form-->
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

        </footer>

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>