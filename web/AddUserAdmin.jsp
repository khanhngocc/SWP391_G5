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
        <title>Add User</title>
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
        <jsp:include page="HeaderAdmin.jsp" />  
        <section>
            <div>

                <div class="container">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Add a user</h2>
                        <p class="text-primary">${mess}</p>
                        <form action="AddUserAdmin" method="post" enctype="multipart/form-data">
                            Choose a avatar

                            <input type="file" name="fname" required="true"/>

                            Email
                            <input name="email" type="text" placeholder="Email" required="true" />
                            Password
                            <input name="password" type="password" placeholder="Password" required="true" />
                            Full Name
                            <input name="name"type="text" placeholder="Full Name" required="true" />  
                            Title
                            <select name="title" id="title" style="margin-bottom:10px">
                                <option value="Mr">Mr</option>
                                <option value="Mrs">Mrs</option>
                                <option value="Ms">Ms</option>

                            </select>  
                            Phone
                            <input name="phone"type="text" placeholder="Phone Number" />													
                            Roll
                            <select name="role" id="role" style="margin-bottom:10px">
                                <option value="1">Customer</option>
                                <option value="2">Marketing</option>
                                <option value="3">Admin</option>
                                <option value="4">Expert</option>
                                <option value="5">Manager</option>
                            </select>

                            Status
                            <select name="status" style="margin-bottom: 10px" id="status">
                                <option value="1">Active</option>
                                <option value="2">Deactive</option>
                            </select>

                            <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Add</button>
                        </form>                            
                    </div>
                </div>





            </div>
        </div>
    </section>
    <jsp:include page="Footer.jsp" />  
    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>

</html>