<%-- 
    Document   : AddQuiz
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
        <title>Add Quiz</title>
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
         <jsp:include page="Header.jsp" />   
        <section>
            <div>

                <div class="container">
                    <div class="col-sm-6">
                        <div class="signup-form">
                            <!--sign up form-->
                            <h2>Add a Quiz</h2>
                            <p class="text-primary" id="messCreatePractice"></p>
                            <form name="myForm" action="AddQuiz" method="post" enctype="multipart/form-data" onsubmit="return validPractice()">
                                Choose a image (Thumbnail)

                                <input type="file" name="fname" required="true"/>

                                Title
                                <input name="title" type="text" placeholder="Title" required="true" />
                                Description
                                <input name="description" type="text" placeholder="Description" />
                                Subject 
                                <select name="subject" id="subject" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listSubject}" var="list">
                                        <option value="${list.id}">${list.title}</option>
                                    </c:forEach>
                                </select>
                                Category 
                                <select name="category" id="subject" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listCategory}" var="list">
                                        <option value="${list.value}">${list.value}</option>
                                    </c:forEach>
                                </select>
                                Level
                                <select name="level" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listLevel}" var="list">
                                        <option value="${list.value}">${list.value}</option>
                                    </c:forEach>
                                </select>                                
                                Duration (in seconds)
                                <input name="duration" type="text" placeholder="Duration" required=""/>													                           

                                <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Add</button>
                            </form>                            
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </section>
    <jsp:include page="Footer.jsp" /> 
    <script src="js/validation.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>

</html>