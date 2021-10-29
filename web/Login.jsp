<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login page</title>
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
                <div class="login-form centerDiv">
                    <!--login form-->
                    <div class="centerImgLanding">
                        <img src="images/home/partner1.png" alt="">

                    </div>
                    
                    <p class="text-primary">${messLogin}</p>
                    <form action="Login" method="post">
                        <input name="id" type="hidden" value="${id}">
                        <input name="Email" type="text" placeholder="Email" required="true" value="${usernameLogin}"/>
                        <input name="Password" type="password" placeholder="Password" required="true" value="${passwordLogin}"/>
                        <span>
                            <input name="remember" type="checkbox" class="checkbox">
                            Remember me
                        </span>
                        <button type="submit" class="btn btn-default centerImgLanding">Login</button>
                        <br>
                        <div class="centerText">Don't have an account? <a href="register">Sign up</a></div>
                        <div class="centerImgLanding"><a href="ForgotPassword">Forgot your password?</a></div>
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
