<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Quiz Detailed</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <!--/head-->

    <body>
        <jsp:include page="HeaderExpert.jsp" /> 
        <section style="margin-top: 20px;margin-bottom: 100px">
            <div>

                <div class="container">
                     <input id="isFeatured" type="hidden" value="${quiz.isFeatured}">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-5">
                            <div class="view-product">
                                <img src="${quiz.getThumbnail()}" alt="" />

                            </div>
                        </div>
                        <div class="col-sm-4">
                            <c:if test="${quiz.type eq 'Free Test'}">
                                <span id="starFeature" onclick="markStar(${quiz.id})" class="fa fa-star" 
                                      <c:if test="${quiz.isFeatured eq 'false'}">style="cursor:pointer;float: right"</c:if> 
                                      <c:if test="${quiz.isFeatured eq 'true'}">style="cursor:pointer;color:#FE980F;float: right"</c:if>
                                          >
                                      </span>
                            </c:if>
                            <div class="product-information"><!--/product-information-->
                                <h2>${quiz.getTitle()}</h2>
                                <p>${quiz.getDescription()}</p>

                                <p><b>Subject:</b> ${sub.title}</p>
                                <p><b>Category:</b> ${quiz.category}</p>
                                <p><b>Level:</b> ${quiz.getLevel()}</p>
                                <p><b>Type:</b> ${quiz.type}</p>
                                <p><b>Number of question:</b> ${quiz.getNumber_of_question()}</p>
                                <p id="timeTest"><b>Duration:</b></p>
                                <p><b>Rate:</b> ${quiz.getRate()}</p>
                              

                            </div><!--/product-information-->
                        </div>
                    </div>


                </div>





            </div>

        </section>
        <jsp:include page="Footer.jsp" /> 
        <script>
            window.onload = function () {
                document.getElementById("timeTest").innerHTML += " " + format('${quiz.getDuration()}');
            }

            function format(time) {
                // Hours, minutes and seconds
                var hrs = ~~(time / 3600);
                var mins = ~~((time % 3600) / 60);
                var secs = ~~time % 60;

                // Output like "1:01" or "4:03:59" or "123:03:59"
                var ret = "";
                if (hrs > 0) {
                    ret += "" + hrs + "h" + " : " + (mins < 10 ? "0" : "");
                }
                ret += "" + mins + "m" + " : " + (secs < 10 ? "0" : "");
                ret += "" + secs + "s";
                return ret;
            }

            function markStar(id) {

                var current_status = document.getElementById("isFeatured").value;
                var status;

                if (current_status == "true")
                    status = "0";
                else
                    status = "1";

                $.ajax({
                    url: "MarkStarQuiz",
                    type: 'GET',
                    dataType: 'json',
                    data: {id: id, status: status},
                    success: function (data) {

                        document.getElementById("isFeatured").value = data;

                        if (data == "1")
                        {
                            document.getElementById("starFeature").style = "cursor:pointer;color:#FE980F;float: right";
                        } else
                        {
                            document.getElementById("starFeature").style = "cursor:pointer;float: right";
                        }

                    }
                });

            }
        </script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>