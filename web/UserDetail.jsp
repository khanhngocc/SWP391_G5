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
        <jsp:include page="HeaderAdmin.jsp" /> 
        <section>
            <div>

                <div class="container">
                    <div class="col-sm-6">
                        <div class="signup-form">
                            <!--sign up form-->
                            <h2>User Detailed</h2>
                            <p class="text-primary">${mess}</p>
                            <form enctype="multipart/form-data" id="myForm" action="EditUser?id=${user.id}" method="post">
                                <img id="profile-ava" class="imageAvatar" src="${user.avatar}">
                                <br>
                                Choose a avatar
                                <input type="file" name="fname">

                                <input type="hidden" value="${user.avatar}" name="imageurl">
                                Email
                                <input name="email" type="text" placeholder="Email" required="true" value="${user.email}" readonly />
                                Full Name
                                <input name="name"type="text" placeholder="Full Name" required="true" value="${user.fullname}"/>  
                                Title

                                <select name="title" id="title" style="margin-bottom:10px">
                                    <option value="Mr" ${user.title=='Mr'?"selected":""}>Mr</option>
                                    <option value="Mrs" ${user.title=='Mrs'?"selected":""}>Mrs</option>
                                    <option value="Ms" ${user.title=='Ms'?"selected":""}>Ms</option>

                                </select>  

                                Phone
                                <input name="phone"type="text" placeholder="Phone Number" value="${user.getPhone()}" />							
                                Created Date
                                <input name="create_date"type="text" placeholder="Created Date" value="${user.createDate}" />							
                                Roll
                                <select name="role" style="margin-bottom:10px">
                                    <option value="1" ${user.rollId==1?"selected":""}>Customer</option>
                                    <option value="2" ${user.rollId==2?"selected":""}>Marketing</option>
                                    <option value="3" ${user.rollId==3?"selected":""}>Admin</option>
                                    <option value="4" ${user.rollId==4?"selected":""}>Expert</option>
                                    <option value="5" ${user.rollId==5?"selected":""}>Manager</option>
                                </select>
                                Status
                                <select name="status" style="margin-bottom: 10px">
                                    <option value="Active" ${user.status.equals("Active")?"selected":""}>Active</option>
                                    <option value="Deactive" ${user.status.equals("Deactive")?"selected":""}>Deactive</option>                                       
                                </select>								                            
                            </form>
                            <button type="text" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px" onclick="Submit()">Update</button>
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
        <script>
                            function Submit() {
                                var form;
                                form = document.getElementById("myForm");
                                form.submit();
                            }
        </script>
    </body>

</html>
