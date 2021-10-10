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
                        <form enctype="multipart/form-data" id="myForm" action="EditQuiz?id=${quiz.getId()}" method="post">
                            <img id="profile-ava" class="imageAvatar" src="${quiz.getThumbnail()}">
                            <br>
                            Choose a Thumbnail
                            <input type="file" name="fname">

                            <input type="hidden" value="${quiz.getThumbnail()}" name="imageurl">
                           Title
                            <input name="title" type="text" placeholder="Tittle" required="true" value="${quiz.getTitle()}" />
                            Description
                            <textarea name="description"type="text" required="true">${quiz.getDescription()}</textarea>
                       
                            Subject
                            <select name="subject" id="title" style="margin-bottom:10px">
                                <option value="1" >1</option>
                                <option value="2" >2</option>
                                <option value="3" >3</option>

                            </select>  

                           Level
                            <input name="level"type="number" placeholder="Level" value="${quiz.getLevel()}" />							
                            User ID:
                            <input readonly placeholder="${quiz.getUser_id()}"/>							
                           Type
                            <select name="type" style="margin-bottom:10px">
                                <option value="Free Test" ${quiz.getType() eq 'Free Test'?"selected":""}>Free Test</option>
                                <option value="Simulation Test" ${quiz.getType()eq"Simulation Test"?"selected":""}>Simulation Test</option>
                               
                            </select>
                                Number of Questions: 
                            <input readonly placeholder="${quiz.getNumber_of_question()}"/>
                            Duration
                            <input name="duration"type="number" placeholder="Duration" value="${quiz.getDuration()}" />	
                            Rate
                            <input name="rate"type="text" placeholder="rate" value="${quiz.getRate()}" />
                        </form>
                        <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px" onclick="Submit()">Update</button>
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
        <script>
                                function Submit() {
                                    var form;
                                    form = document.getElementById("myForm");
                                    form.submit();
                                }
        </script>
    </body>

</html>
