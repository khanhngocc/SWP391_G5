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
        <title>Update Setting</title>
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

        <jsp:include page="HeaderAdmin.jsp" />  

        <section style="margin-bottom: 100px"><!--slider-->
            <div class="container">

                <div class="col-sm-5">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Update this setting</h2>
                        <p class="text-primary" id="messUpdateSetting"></p>
                        <form name="myForm" action="UpdateSetting" method="post" onsubmit="return validSetting()">
                            <input name="id" type="hidden" value="${setting.id}"/>
                            Type
                            <select name="type" onchange="this.form.submit()" style="margin-bottom: 5px;height: 50px">
                               <c:forEach items="${listAllTypes}" var="list">
                                    <option value="${list}" ${list == setting.type ? 'selected':''}>${list}</option>
                                </c:forEach>
                            </select> 
                            Value
                            <input name="value" type="text" required="true" value="${setting.value}"/>
                            Note
                            <input name="note" type="text" required="true" value="${setting.note}"/>
                            <button type="submit"  class="btn btn-default" style="margin-top: 10px">Update</button>
                        </form>
                    </div>
                    <br>
                </div>
            </div>

        </section><!--/slider-->


        <jsp:include page="Footer.jsp" />  
        <script>

            function validSetting() {


            
                let value = document.forms["myForm"]["value"].value;
                if (value.length > 100) {
                    document.getElementById("messUpdateSetting").textContent = "value comes over 100 characters";
                    return false;
                }

                let note = document.forms["myForm"]["note"].value;
                if (note.length > 100) {
                    document.getElementById("messUpdateSetting").textContent = "note comes over 100 characters";
                    return false;
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
