<%-- 
    Document   : Login
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
        <title>Edit Quiz</title>
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
        <jsp:include page="HeaderExpert.jsp" /> 
        <section>
            <div>

                <div class="container">
                    <div class="col-sm-9">
                        <div class="signup-form">
                            <!--sign up form-->
                            <h2>Quiz Detailed</h2>
                            <div style="margin-top: 10px;margin-bottom: 30px">
                                <a href="AddQuestionToQuiz?id=${quiz.id}"><i class="fa fa-plus"></i> Add new Question</a>
                            </div>
                            <p class="text-primary" id="messCreatePractice"></p>
                            <form enctype="multipart/form-data" name="myForm" action="EditQuiz?id=${quiz.getId()}" method="post" onsubmit="return validEditQuiz()" style="margin-bottom: 50px">
                                <img id="profile-ava" class="imageAvatar" src="${quiz.getThumbnail()}">
                                <br>
                                Choose a Thumbnail
                                <input type="file" name="fname">

                                <input type="hidden" value="${quiz.getThumbnail()}" name="imageurl">
                                Title
                                <input name="title" type="text" placeholder="Tittle" required="true" value="${quiz.getTitle()}" />
                                Description
                                <textarea name="description"type="text" required="true">${quiz.getDescription()}</textarea>

                                Subject
                                <select name="subject" id="subject" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listSubject}" var="list">
                                        <option value="${list.id}" ${quiz.subject_id eq list.id ? "selected" : "" }>${list.title}</option>
                                    </c:forEach>
                                </select>

                                Category

                                <select name="category" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listCategory}" var="list">
                                        <option value="${list.value}" ${quiz.category eq list.value ? "selected" : "" }>${list.value}</option>
                                    </c:forEach>
                                </select>
                                Level

                                <select name="level" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listLevel}" var="list">
                                        <option value="${list.value}" ${quiz.getLevel() eq list.value ? "selected" : "" }>${list.value}</option>
                                    </c:forEach>
                                </select>

                                <input type="hidden" placeholder="${quiz.getUser_id()}"/>							
                                Type
                                <select name="type" style="margin-bottom:10px;height: 40px">
                                    <c:forEach items="${listType}" var="list">
                                        <option value="${list.value}" ${quiz.getType() eq list.value ? "selected" : "" }>${list.value}</option>
                                    </c:forEach>
                                </select>

                                Duration
                                <input name="duration"type="number" placeholder="Duration" value="${quiz.getDuration()}" />	
                                Rate
                                <input name="rate"type="text" placeholder="rate" value="${quiz.getRate()}" readonly=""/>


                                <a href="javascript:void(0)" onclick="Show('myTable')"><h2>List of Question (${quiz.getNumber_of_question()})</h2></a>

                                <table  class="table" id="myTable" style="display: none">
                                    <tr>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(0)">ID</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(1)">Content</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(2)">Category</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(3)">Status</a></strong></th>
                                        <th><strong><a href="javascript:void(0);" onclick="sort(4)">Level</a></strong></th>
                                        <th><strong><a href="javascript:void(0);">Option 1</a></strong></th>
                                        <th><strong><a href="javascript:void(0);">Option 2</a></strong></th>
                                        <th><strong><a href="javascript:void(0);">Option 3</a></strong></th>
                                        <th><strong><a href="javascript:void(0);">Option 4</a></strong></th>
                                        <th><strong><a href="javascript:void(0);">Correct Option</a></strong></th>
                                        <th><center><strong><a href="javascript:void(0);">Action</a></strong></center></th>
                                    </tr>

                                    <c:forEach items="${question}" var="i">
                                        <tr>
                                            <td>${i.id}</td>
                                            <td>${i.content}</td>
                                            <td>${i.category}</td>
                                            <td>${i.status}</td>
                                            <td>${i.level}</td>
                                            <td>${i.option1}</td>
                                            <td>${i.option2}</td>
                                            <td>${i.option3}</td>
                                            <td>${i.option4}</td>
                                            <td>${i.option_correct}</td>
                                            <td><a href="#" onclick="deleteQuestion(${i.id},${quiz.id})"><i class="fa fa-trash-o"></i> Delete</a></td>
                                        </tr>     
                                    </c:forEach>
                                </table>
                                <button type="submit" class="btn btn-primary" >Update</button>
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
        <script>


                                                function deleteQuestion(id, quiz) {
                                                    var result = confirm("Do you want to delete this quiz?");
                                                    if (result) {
                                                        window.location.href = "DeleteQuestion?id=" + id + "&quiz=" + quiz;
                                                    }

                                                }
        </script>
    </body>

</html>
