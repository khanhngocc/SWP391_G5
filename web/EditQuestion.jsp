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
        <jsp:include page="HeaderExpert.jsp" /> 
         <section>
            <div class="container">
                <div class="col-sm-9">

                    <div class="signup-form">
                        <form id="create-test" action="EditQuestion" method="post">
                            <p><input type="hidden" name="id" value="${question.id}" ></p>                    
                            <h4> Question Edit</h4>
                            Category
                            <select name="category" style="margin-bottom:10px">
                                <c:forEach items="${listCategory}" var="list">
                                    <option value="${list.value}" ${question.category eq list.value ? "selected" : "" }>${list.value}</option>
                                </c:forEach>
                            </select>                            Level

                            <select name="level" style="margin-bottom:10px">
                                <c:forEach items="${listLevel}" var="list">
                                    <option value="${list.value}" ${question.level eq list.value ? "selected" : "" }>${list.value}</option>
                                </c:forEach>
                            </select>
                            Content
                            <textarea name="question" id="quest" >${question.content}</textarea>
                            Option 1
                            <input type="text" name="answer1" placeholder="Answer 1" value="${question.option1}">
                            Option 2
                            <input type="text" name="answer2" placeholder="Answer 2" value="${question.option2}">
                            Option 3
                            <input type="text" name="answer3" placeholder="Answer 3" value="${question.option3}">
                            Option 4
                            <input type="text" name="answer4" placeholder="Answer 4" value="${question.option4}">

                            Correct Answer:
                            <p>                           
                                <select name="correct" id="correct">
                                    <option value="1" ${question.option1 eq question.option_correct?"selected":""}> Answer 1</option>
                                    <option value="2" ${question.option2 eq question.option_correct?"selected":""}> Answer 2</option>
                                    <option value="3" ${question.option3 eq question.option_correct?"selected":""}> Answer 3</option>
                                    <option value="4" ${question.option4 eq question.option_correct?"selected":""}> Answer 4</option>                               
                                </select>
                            </p>       
                            <p><input type="hidden" name="quiz" value="${quiz}"></p>
                            <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Update</button>
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