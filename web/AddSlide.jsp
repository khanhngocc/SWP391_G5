<%-- 
    Document   : Home
    Created on : Sep 12, 2021, 8:32:26 PM
    Author     : dell
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Add Slider</title>
        <link href="css/customize.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">

        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

    </head><!--/head-->

    <body>

        <jsp:include page="Header.jsp" />  

        <section id="slider"><!--slider-->
            <div class="container">

                <div class="col-sm-9">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Create a new slider</h2>
                        <p class="text-primary" id="messCreateSlide"></p>
                        <form name="myForm" action="AddSlide" enctype="multipart/form-data" method="post" onsubmit="return validAddSlide()" >
                            Title
                            <input name="title" type="text" required="true" />
                            Thumbnail
                            <input name="fname" type="file" required="true" />
                            BackLink
                            <input name="backlink" type="text" required="true" />
                            Notes
                            <textarea name="notes" rows="10"></textarea>
                            <button type="submit" class="btn btn-default" style="margin-top: 10px">Create</button>
                        </form>
                    </div>
                    <br>
                </div>
            </div>

        </section><!--/slider-->


        <jsp:include page="Footer.jsp" />
        <script>
         function validAddSlide() {

                const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];


                //valid title
                let title = document.forms["myForm"]["title"].value;
                if (title.length > 100) {
                    document.getElementById("messCreateSlide").textContent = "title comes over 100 characters";
                    return false;
                }

                // valid file

                let fi = document.forms["myForm"]["fname"];

                var fileValue = fi.value;
                var startIndex = fileValue.lastIndexOf(".");
                var filename = fileValue.substring(startIndex, fileValue.length);

                if (standardedExtensionImg.includes(filename) == false)
                {
                    document.getElementById("messCreateSlide").textContent
                            = 'file input is not a image';
                    return false;
                }


                if (fi.files[0].size > 1048576)
                {
                    document.getElementById("messCreateSlide").textContent
                            = 'size of thumbnail inputed comes over 1KB ';
                    return false;
                }

                //valid backlink
                let backlink = document.forms["myForm"]["backlink"].value;
                if (backlink.length > 100) {
                    document.getElementById("messCreateSlide").textContent = "backlink comes over 100 characters";
                    return false;
                }

                // valid notes

                let notes = document.forms["myForm"]["notes"].value;
                if (notes)
                {
                    if (notes.length > 50) {
                        document.getElementById("messCreateSlide").textContent = "notes comes over 50 characters";
                        return false;
                    }
                }





            }
        </script>
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
