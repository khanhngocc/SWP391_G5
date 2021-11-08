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
        <title>Import Question</title>
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
        <jsp:include page="HeaderExpert.jsp" />  
        <section style="margin-bottom: 100px">
            <div class="shopper-informations">
                <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <p><center><h2 class="danger">Import Guideline!</h2></center>
                        <br><br>
                        <p>1. Using this template to fill data </p>
                        <a href="sheet/import-quiz-template.xlsx" download>
                            <i class="fa fa-download" style="color: #FE980F;margin-bottom: 3px"></i> Download Template
                        </a>
                        <p>2. Please format data file like following example</p>
                        <div class="container alginBodyLanding">
                            <img src="images/home/ExcelExample.png" alt="" class="centerImgLanding" style="height: 200px; width: auto">
                        </div>
                        <p>3. Ensure that option1, option2, option3, option4, optionCorrect are TEXT. </p>
                        <p>4. Browse your file and enjoy your day ^_^ </p>
                        <div style="margin-top: 30px">
                            <p class="text-primary" id="messImportQuestion"></p>
                            <form name="myForm" enctype="multipart/form-data" id="myForm" action="ImportQuestion?id=${id}" method="post" onsubmit="return validQuestionImport()">
                                <input type="file" name="fname" required="true">
                                <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Import</button>
                            </form>
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