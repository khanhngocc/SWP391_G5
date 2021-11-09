<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Add Subject</title>
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
    </head><!--/head-->

    <body>

        <jsp:include page="HeaderManager.jsp" />  

        <section id="slider"><!--slider-->
            <div class="container">

                <div class="col-sm-9">

                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Create a new subject</h2>
                        <p class="text-primary" id="messAddSubject"></p>
                        <form name="myForm" action="AddSubject" method="POST" onsubmit="return validAddSubject()">
                            Title
                            <input type="text" name="title"  required=""/>
                            Price
                            <input type="text" name="price"  required=""/>
                            Sale Price
                            <input type="text" name="salePrice" />
                            <button type="submit" class="btn btn-default" style="margin-top: 10px">Create</button>
                        </form>


                    </div>
                    <br>
                </div>
            </div>

        </section>


        <jsp:include page="Footer.jsp" />  
        <script src="js/validation.js"></script>
        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>