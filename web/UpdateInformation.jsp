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
        <title>Account</title>
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

            <c:if test="${sessionScope.user.rollId eq 1}">
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
                                        <li><a href="">Take test</a></li>
                                        <li><a href="">Review Test</a></li>
                                        <li><a href="">Blog</a></li>
                                        <li><a href="Personal?email=${user.email}">Account</a></li>
                                        <li><a href="Logout">Log out</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${sessionScope.user.rollId eq 2}">
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
                </div>
            </c:if>


            <c:if test="${sessionScope.user.rollId eq 3}">
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
                                        <li><a href="UserList">User</a></li>

                                        <li><a href="Personal?email=${user.email}">Account</a></li>
                                        <li><a href="Logout">Log out</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </header>
        <section>


            <div class="container" style="margin-bottom: 30px">
                <div class="signup-form">
                    <!--sign up form-->
                    <h2>Personal Information</h2>
                    <p class="text-primary">${mess}</p>
                    <form action="Personal" method="post">
                        <input name="email" type="hidden" placeholder="Email" required="true" value="${user.email}" />
                        <input name="name"type="text" placeholder="Full Name" required="true" value="${user.fullname}"/>  
                        <p>                           
                            <select name="gender" id="gender">
                                <option value="male" ${user.gender==true?"selected":""}>Male</option>
                                <option value="female" ${user.gender==false?"selected":""}>Female</option>
                            </select>
                        </p>
                        <input name="phone"type="text" placeholder="Phone Number" value="${user.getPhone()}" />							

                        <button type="submit" class="btn btn-default">Update</button>
                    </form>
                </div>
                <br>
                <div class="signup-form">
                    <!--sign up form-->
                    <h2>Change password</h2>
                    <p class="text-primary">${mess1}</p>
                    <form action="ChangePassword" method="post">
                        <input name="email" type="hidden" placeholder="Email" value="${user.email}" />
                        <input name="oldpass"type="password" placeholder="Old Password" required="true" />
                        <input name="newpass"type="password" placeholder="New Password" required="true" />
                        <input name="repass"type="password" placeholder="Re-Password" required="true" />  
                        <button type="submit" class="btn btn-default">Change</button>
                    </form>
                </div>
            </div>






        </div>
    </section>
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