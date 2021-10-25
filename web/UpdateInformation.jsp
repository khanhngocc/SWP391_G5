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


        <c:if test="${sessionScope.user.rollId eq 1}">
            <jsp:include page="HeaderCustomer.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 2}">
            <jsp:include page="HeaderMarketing.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 3}">
            <jsp:include page="HeaderAdmin.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 4}">
            <jsp:include page="HeaderExpert.jsp" />  
        </c:if>
        <c:if test="${sessionScope.user.rollId eq 5}">
            <jsp:include page="HeaderManager.jsp" />  
        </c:if>
        <section>


            <div class="container" style="margin-bottom: 30px">
                <div class="signup-form">
                    <!--sign up form-->
                    <h2>Personal Information</h2>
                    <p class="text-primary">${mess}</p>
                    <form action="Personal" method="post">
                        <input name="email" type="hidden" placeholder="Email" required="true" value="${user.email}" />
                        <input name="name"type="text" placeholder="Full Name" required="true" value="${user.fullname}"/>  

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

    <jsp:include page="Footer.jsp" /> 


    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>

</html>