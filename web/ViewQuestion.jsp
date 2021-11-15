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
        <title>Edit Question</title>
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
        <section style="margin-top: 50px;margin-bottom: 200px">
            <div class="container">
                <div class="row">

                    <div class="col-sm-6" style="border-right: 1px solid #CCCCCC; border-left: 1px solid #CCCCCC">
                        <h4>${question.content}</h4>
                        <h5> Select one:</h5>
                        <div>                               
                            <input type="radio"  name="fav_language" value="${question.option1}" ${question.option1 eq question.option_correct?"checked":""}>
                            <label for="html">${question.option1}</label><br>
                            <input type="radio"  name="fav_language" value="${question.option2}" ${question.option2 eq question.option_correct?"checked":""}>
                            <label for="css">${question.option2}</label><br>
                            <c:if test="${question.option3 ne null}">
                                <input type="radio"  name="fav_language" value="${question.option3}" ${question.option3 eq question.option_correct?"checked":""}>
                                <label for="javascript">${question.option3}</label><br>
                            </c:if>
                            <c:if test="${question.option4 ne null}">
                                <input type="radio"  name="fav_language" value="${question.option4}" ${question.option4 eq question.option_correct?"checked":""}>
                                  <label for="c#">${question.option4}</label>
                            </c:if>

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