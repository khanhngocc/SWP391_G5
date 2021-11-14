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
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/decoupled-document/ckeditor.js"></script>
    </head>
    <!--/head-->

    <body>
        <jsp:include page="HeaderExpert.jsp" /> 
        <section>
            <div class="container">
                <div class="col-sm-9">
                    <p id="messCreateQuestion" class="text-primary"></p>
                    <div class="signup-form">
                        <form name="myForm" action="EditQuestion" method="post" onsubmit="return validQuestion()">
                            <p><input type="hidden" name="id" value="${question.id}" ></p>                    
                            <h4> Question Edit</h4>

                            Category

                            <select name="category" style="margin-bottom:10px;height: 40px">
                                <c:forEach items="${listCategory}" var="list">
                                    <option value="${list.value}" ${question.category eq list.value ? "selected" : "" }>${list.value}</option>
                                </c:forEach>
                            </select> 

                            Subject

                            <select name="subject" style="margin-bottom:10px;height: 40px">
                                <c:forEach items="${listSubject}" var="list">
                                    <option value="${list.title}" ${question.subject eq list.title ? "selected" : "" }>${list.title}</option>
                                </c:forEach>
                            </select>

                            Level

                            <select name="level" style="margin-bottom:10px;height: 40px">
                                <c:forEach items="${listLevel}" var="list">
                                    <option value="${list.value}" ${question.level eq list.value ? "selected" : "" }>${list.value}</option>
                                </c:forEach>
                            </select>
                            Status
                            <select name="status" style="margin-bottom:10px;height: 40px">
                              
                                <c:forEach items="${listStatus}" var="list">
                                    <option value="${list}" ${list == question.status ? 'selected':''}>${list}</option>
                                </c:forEach>
                            </select>  
                            Content
                            <textarea name="question" id="contentDetails" hidden="" placeholder="Question"></textarea>
                            <div id="toolbar-container"></div>

                            <!-- This container will become the editable. -->
                            <div id="editor" style="margin-bottom: 5px">
                                ${question.content}
                            </div>

                            Option 1
                            <input type="text" name="answer1" placeholder="Answer 1" value="${question.option1}">
                            Option 2
                            <input type="text" name="answer2" placeholder="Answer 2" value="${question.option2}">
                            Option 3
                            <input type="text" name="answer3" placeholder="Answer 3" value="${question.option3}">
                            Option 4
                            <input type="text" name="answer4" placeholder="Answer 4" value="${question.option4}">

                            Correct Answer:
                            <div>                           
                                <select name="correct" id="correct" style="height: 40px">
                                    <option value="1" ${question.option1 eq question.option_correct?"selected":""}> Answer 1</option>
                                    <option value="2" ${question.option2 eq question.option_correct?"selected":""}> Answer 2</option>
                                    <option value="3" ${question.option3 eq question.option_correct?"selected":""}> Answer 3</option>
                                    <option value="4" ${question.option4 eq question.option_correct?"selected":""}> Answer 4</option>                               
                                </select>
                            </div>       
                            <p><input type="hidden" name="quiz" value="${quiz}"></p>
                            <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Update</button>
                        </form>

                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="Footer.jsp" /> 
        <script>
            let theEditor;
            DecoupledEditor
                    .create(document.querySelector('#editor'))
                    .then(editor => {
                        theEditor = editor;
                        const toolbarContainer = document.querySelector('#toolbar-container');

                        toolbarContainer.appendChild(editor.ui.view.toolbar.element);
                    })
                    .catch(error => {
                        console.error(error);
                    });

            function getDataFromTheEditor() {
                return theEditor.getData();

            }

            function validQuestion() {

                // valid content

                var content = getDataFromTheEditor();

                if (content.length === 0) {
                    document.getElementById("messCreateQuestion").textContent = "content is empty";

                    return false;
                }


                if (content.length > 11000) {
                    document.getElementById("messCreateQuestion").textContent = "content comes over 11000 characters";

                    return false;
                }

                // get value from ckeditor to textarea
                document.getElementById("contentDetails").textContent = getDataFromTheEditor();


                //valid answer
                let answer1 = document.forms["myForm"]["answer1"].value;
                if (answer1.length > 2000) {
                    document.getElementById("messCreateQuestion").textContent = "answer1 comes over 2000 characters";
                    return false;
                }

                let answer2 = document.forms["myForm"]["answer2"].value;
                if (answer2.length > 2000) {
                    document.getElementById("messCreateQuestion").textContent = "answer2 comes over 2000 characters";
                    return false;
                }
                let answer3 = document.forms["myForm"]["answer3"].value;
                if (answer3.length > 2000) {
                    document.getElementById("messCreateQuestion").textContent = "answer3 comes over 2000 characters";
                    return false;
                }
                let answer4 = document.forms["myForm"]["answer4"].value;
                if (answer4.length > 2000) {
                    document.getElementById("messCreateQuestion").textContent = "answer4 comes over 2000 characters";
                    return false;
                }



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