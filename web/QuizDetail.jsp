<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
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
                                <a href="HomeAdmin"><img src="images/home/partner1.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">


                                    <li><a href="QuizList">Quiz</a></li>
                                    <li><a href="Personal?email=${user.email}">Account</a></li>
                                    <li><a href="Logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->


        </header>
        <section>
            <div>

                <div class="container">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Quiz Detailed</h2>
                        <p class="text-primary">${mess}</p>
                        <form enctype="multipart/form-data" id="myForm" action="" method="post">
                            <img id="profile-ava" class="imageAvatar" src="${quiz.getThumbnail()}">
                            <br>
                           
                            Title
                            <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.getTitle()}" />
                            Description
                            <textarea name="description"type="text" readonly>${quiz.getDescription()}</textarea>

                            Subject
                            
                            <input name="subject" type="text" placeholder="Tittle" readonly value="${quiz.subject_id}" />

                            Level
                            <input name="level"type="number" placeholder="Level" value="${quiz.getLevel()}" readonly />							
                            User ID:
                            <input readonly placeholder="${quiz.getUser_id()}"/>							
                            Type
                            <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.type}" />
                            
                            Number of Questions: 
                            <input readonly placeholder="${quiz.getNumber_of_question()}"/>
                            Duration
                            <input name="duration"type="number" placeholder="Duration" value="${quiz.getDuration()}" />	
                            Rate
                            <input name="rate"type="text" placeholder="rate" value="${quiz.getRate()}" />
                            
                            
                            <a href="javascript:void(0)" onclick="Show('myTable')"><h2>List of Question</h2></a>
               
                            <table  class="table" id="myTable" style="display: none">
                                <tr>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(0)">ID</a></strong></th>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(1)">Content</a></strong></th>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(2)">Category</a></strong></th>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(3)">Status</a></strong></th>
                                    <th><strong><a href="javascript:void(0);" onclick="sort(4)">Level</a></strong></th>
                                    <th><strong><a href="javascript:void(0);">Option 1</a></strong></th>
                                    <th><strong><a href="javascript:void(0);">Option 2</a></strong></th>
                                    <th><strong><a href="javascript:void(0);">Option 3</a></strong></th>
                                    <th><strong><a href="javascript:void(0);">Option 4</a></strong></th>
                                    <th><strong><a href="javascript:void(0);">Correct Option</a></strong></th>
                                   
                                </tr>

                                <c:forEach items="${question}" var="i">
                                    <tr>
                                        <td>${i.id}</td>
                                        <td>${i.content}</td>
                                        <td>${i.category}</td>
                                        <td>${i.status}</td>
                                        <td>${i.level}</td>
                                        <td>${i.option1}</td>
                                        <td>${i.option2}</td>
                                        <td>${i.option3}</td>
                                        <td>${i.option4}</td>
                                        <td>${i.option_correct}</td>
                                        
                                    </tr>     
                                </c:forEach>
                            </table>
                            
                        </form>
                            
                    </div>                       
                </div>





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
