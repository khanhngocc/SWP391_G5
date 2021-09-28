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
            </div><!--/header-middle-->


        </header>
        <section id="form">
            <div>
                
                <div class="container">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Personal Information</h2>
                        <p class="text-primary">${mess}</p>
                        <form enctype="multipart/form-data" id="myForm" action="EditUser?id=${user.id}" method="post">
                            <img id="profile-ava" src="${user.avatar}"><br>
                            <input type="file" name="fname">
                            <input type="hidden" value="${user.avatar}" name="imageurl">
                            <input name="email" type="text" placeholder="Email" required="true" value="${user.email}" readonly />
                            <input name="name"type="text" placeholder="Full Name" required="true" value="${user.fullname}"/>  
                            <input name="title"type="text" placeholder="Title" required="true" value="${user.title}"/>  
                            <input name="phone"type="text" placeholder="Phone Number" value="${user.getPhone()}" />							
                            <input name="create_date"type="text" placeholder="Created Date" value="${user.createDate}" />							
                            <select name="role">
                                <option value="1">Expert</option>
                                <option value="2">Customer</option>
                                <option value="3">Admin</option>
                                <option value="4">Marketing</option>
                                <option value="5">Manager</option>
                            </select>						
                            <select name="status">
                                <option value="Active">Active</option>
                                <option value="Deactive">Deactive</option>                                
                            </select>								                            
                        </form>
                        <button type="text" class="btn btn-default" onclick="Submit()">Update</button>
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
    <script>
        function Submit(){
            var form;
            form = document.getElementById("myForm");
            form.submit();
        }
    </script>
</body>

</html>
