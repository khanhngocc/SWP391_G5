<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
    Fix        : 22/10/2021
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <style>

            #img-left-side{
                height: 50px;
                width: 70px;
                border-radius: 10%;
            }
        </style>
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
        <c:if test="${sessionScope.user eq null}">
            <jsp:include page="HeaderFree.jsp" />  
        </c:if>
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
        <section style="margin-top: 20px;margin-bottom: 100px">
            <div>

                <div class="container">
                    <jsp:include page="SideBarForExam.jsp" />  

                    <div class="col-sm-5 padding-right">
                        <!--sign up form-->
                        <div class="signup-form">
                            <h2>Quiz Detailed</h2>
                            <p class="text-primary">${mess}</p>
                            <form enctype="multipart/form-data" id="myForm" action="" method="post">
                                <img id="profile-ava" class="imageAvatar" src="${quiz.getThumbnail()}">
                                <br>

                                Title
                                <input name="title" type="text" placeholder="Tittle" readonly value="${quiz.getTitle()}" />
                                Brief Information
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


                <c:choose>
                    <c:when test="${sessionScope.user==null}">

                        <center><a href="Login?id=${quiz.id}" class="btn btn-primary">Login To Take The Test</a></center>
                        </c:when>
                        <c:otherwise>
                        <center><a href="QuizHandle?id=${quiz.id}" class="btn btn-primary">Take The Test</a></center>
                        </c:otherwise>
                    </c:choose>
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