<%-- 
    Document   : Registration
    Created on : Sep 24, 2021, 8:57:25 AM
    Author     : dell
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Landing page</title>
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
        <section id="form">
            <!--form-->
            <div class="container">
                <div class="row">
                    <div class="signup-form centerDiv">
                        <!--sign up form-->
                        <h2 class="centerImgLanding">New registration</h2>
                        <p class="text-primary">${mess}</p>
                        <form action="register" method="post">
                            Email
                            <input name="email" type="text" placeholder="Email" required="true" value="${userDrap.email}"/>
                            Name
                            <input name="name" type="text" placeholder="Full Name" required="true" value="${userDrap.fullname}"/>
                            Title
                            <select name="title" id="title" style="margin-bottom:10px">
                                <c:forEach items="${listTitle}" var="list">
                                    <option value="${list.value}" ${list.value == userDrap.title ? 'selected':''}>${list.value}</option>
                                </c:forEach>
                            </select> 
                            Phone
                            <input name="phone" type="text" placeholder="Phone Number" required="true" value="${userDrap.phone}"/>
                            Password
                            <input name="pass" type="password" placeholder="Password" required="true" value="${userDrap.password}"/>
                            Re-password
                            <input name="repass" type="password" placeholder="Re-Password" required="true" value="${userDrap.repassword}" />
                            <br>
                            <button type="submit" class="btn btn-default centerImgLanding">Signup</button>

                        </form>
                    </div>

                </div>
            </div>
        </section>
        <!--/form-->


        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
