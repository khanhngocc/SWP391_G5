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
        <section>
            <div>

                <div class="container">
                    <div class="col-sm-6"> 
                        <div class="signup-form">

                            <div>
                              
                                <c:if test="${quiz.type eq 'Free Test'}">
                                    <span id="starFeature" onclick="markStar(${quiz.id})" class="fa fa-star" 
                                          <c:if test="${quiz.isFeatured eq 'false'}">style="cursor:pointer;float: right"</c:if> 
                                          <c:if test="${quiz.isFeatured eq 'true'}">style="cursor:pointer;color:#FE980F;float: right"</c:if>
                                              >
                                          </span>
                                </c:if>

                            </div>
                            <input id="isFeatured" type="hidden" value="${quiz.isFeatured}">

                            <form enctype="multipart/form-data" id="myForm" action="" method="post">
                                <img id="profile-ava" class="imageAvatar" src="${quiz.getThumbnail()}">
                                <br>

                                Title
                                <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.getTitle()}" />
                                Description
                                <textarea name="description"type="text" readonly>${quiz.getDescription()}</textarea>

                                Subject

                                <input name="subject" type="text" placeholder="Tittle" readonly value="${sub.title}" />

                                Category
                                <input name="category" type="text" placeholder="Tittle" readonly value="${quiz.category}" />

                                Level
                                <input name="level"type="text" placeholder="Level" value="${quiz.getLevel()}" readonly />							
                                User ID:
                                <input readonly value="${quiz.getUser_id()}"/>							
                                Type
                                <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.type}" />

                                Number of Questions: 
                                <input readonly value="${quiz.getNumber_of_question()}"/>
                                Duration
                                <input name="duration"type="number" placeholder="Duration" value="${quiz.getDuration()}" readonly="true"/>	
                                Rate
                                <input name="rate"type="text" placeholder="Rate" value="${quiz.getRate()}" readonly="true" />


                                <a href="javascript:void(0)" onclick="Show('myTable')"><h2>Quiz Content</h2></a>


                                <table  class="table" id="myTable" style="display: none">
                                    <tr>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(0)">Sub-Category</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(1)"># Question</a></strong></th>                                   
                                    </tr>

                                    <c:forEach begin="0" end="${listCategory.size()-1}" var="i">
                                        <tr>
                                            <td>${listCategory.get(i).value}</td>
                                            <td>${array[i]}</td>                                        
                                        </tr>     
                                    </c:forEach>
                                </table>

                            </form>

                        </div>
                    </div>

                </div>





            </div>

        </section>
        <jsp:include page="Footer.jsp" /> 
        <script>


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