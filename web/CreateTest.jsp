<%-- 
    Document   : Home
    Created on : Sep 12, 2021, 8:32:26 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Create Test</title>
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
                                <a href="Home"><img src="images/home/partner1.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                
                                <ul class="nav navbar-nav">
                                    <li><a href="">Create Test</a></li>
<!--                                    <li><a href="">Edit Test</a></li>-->
                                    <li><a href="">Blog</a></li>
                                    <li><a href="Personal?email=${user.email}">Account</a></li>
                                    <li><a href="Logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->
        </header><!--/header-->

        <div class="shopper-informations">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <form id="create-test" action="createTest" method="post">
                        <p><input type="submit" value="Add new Test" style="background-color: orange; color: white; border-radius: 12px; height: 200%;font-weight: bold">
                        <p><input type="text" name="title" placeholder="Give a title">
                        <p><input type="number" name="duration" placeholder="Duration in minute">
                        <h4> Question:</h4>
                        <p><input type="text" name="question" placeholder="Question:">
                        <p><input type="text" name="answer1" placeholder="Answer 1">
                        <p><input type="text" name="answer2" placeholder="Answer 2">
                        <p><input type="text" name="answer3" placeholder="Answer 3">
                        <p><input type="text" name="answer4" placeholder="Answer 4">
                        <p>Correct Answer:
                        <p>                           
                            <select name="correct" id="correct">
                                <option value="1"> Answer 1</option>
                                <option value="2"> Answer 2</option>
                                <option value="3"> Answer 3</option>
                                <option value="4"> Answer 4</option>                               
                            </select>
                        </p>                        
                    </form>
                    <center><button onclick="addQuiz()" style="background-color: orange;height: 200%;width: 50%;color: white; border: none;font-weight: bold">Add</button> 
                    <button id="count" style="cursor: not-allowed; border-radius: 50%">1</button></center>
                </div>
            </div>
        </div>
        
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


        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>
            function addQuiz(){                
                var elem = document.getElementById("create-test");
                elem.insertAdjacentHTML("beforeend",'<h4> Question:</h4><p><input type="text" name="question" placeholder="Question:"><p><input type="text" name="answer1" placeholder="Answer 1"><p><input type="text" name="answer2" placeholder="Answer 2"><p><input type="text" name="answer3" placeholder="Answer 3"><p><input type="text" name="answer4" placeholder="Answer 4"><p>Correct Answer:<p><select name="correct" id="correct"><option value="1"> Answer 1</option><option value="2"> Answer 2</option><option value="3"> Answer 3</option><option value="4"> Answer 4</option></select></p>');                
                var count = parseInt(document.getElementById("count").innerHTML);
                count++;
                var cout = document.getElementById("count");
                cout.innerHTML=count;
            }
        </script>
    </body>
</html>
