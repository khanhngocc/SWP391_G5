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
        <title>Add Question</title>
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
         <jsp:include page="Header.jsp" />  
        <section>
            <div class="container">
                <div class="col-sm-9">
                    <p id="messCreateQuestion" class="text-primary"></p>
                    <div class="signup-form">
                        <form name="myForm" action="AddQuestion" method="post" onsubmit="return validQuestion()">

                            <h4>Add Question</h4>

                            Category

                            <select name="category" style="margin-bottom:10px;height: 40px">
                                <c:forEach items="${listCategory}" var="list">
                                    <option value="${list.value}">${list.value}</option>
                                </c:forEach>
                            </select> 

                            Subject

                            <select name="subject" style="margin-bottom:10px;height: 40px">
                                <c:forEach items="${listSubject}" var="list">
                                    <option value="${list.title}">${list.title}</option>
                                </c:forEach>
                            </select>

                            Level

                            <select name="level" style="margin-bottom:10px;height: 40px">
                                <c:forEach items="${listLevel}" var="list">
                                    <option value="${list.value}">${list.value}</option>
                                </c:forEach>
                            </select>
                            Content
                            <textarea name="question" id="contentDetails" hidden="" placeholder="Question"></textarea>
                            <div id="toolbar-container"></div>

                            <!-- This container will become the editable. -->
                            <div id="editor" style="margin-bottom: 5px">
                                <p>This is the initial editor content.</p>
                            </div>
                            Option 1
                            <input type="text" name="answer1" placeholder="Answer 1" required="">
                            Option 2
                            <input type="text" name="answer2" placeholder="Answer 2" required="">
                            <div id="containerAns">

                            </div>

                            <div style="margin-bottom: 10px;margin-top: 10px">
                                <a href="javascript:void(0)" onclick="appendAnswer();"><i class="fa fa-plus"></i> append more answer</a>
                            </div> 
                            Correct Answer:

                            <select name="correct"  id="correctAnswer" style="height: 40px">
                                <option value="1">Answer 1</option>
                                <option value="2">Answer 2</option>

                            </select>


                            <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Add</button>
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

            var count = 2;
            function appendAnswer()
            {
                if (count === 4)
                {
                    document.getElementById("messCreateQuestion").textContent = 'limit number of answer is 4 ';
                    return;
                }

                count++;

                // create answer
                var div = document.createElement("div");
                div.id = "answer" + count;
                div.innerHTML += "Option " + count + "";
                var inputName = document.createElement("input");
                inputName.type = "text";
                inputName.name = "answer" + count;
                inputName.placeholder = "Answer " + count;
                inputName.setAttribute("required", "");
                inputName.required = true;       
                div.appendChild(inputName);
                div.innerHTML += "<i class='fa fa-trash-o' style='color:#f03b35'\n\
            onclick='removeAnswer(" + count + ")' ></i>";
                div.appendChild(document.createElement("br"));
                document.getElementById("containerAns").appendChild(div);

                // add answer to select
                var optionAns = document.createElement("option");
                optionAns.value = "" + count;
                optionAns.innerHTML = "Answer " + count;
                var containerCorrectAns = document.getElementById("correctAnswer");
                containerCorrectAns.appendChild(optionAns);
            }

            function removeAnswer(index)
            {
                // remove answer
                var container = document.getElementById("containerAns");
                var answer = document.getElementById("answer" + index);
                container.removeChild(answer);
                // remove answer from select
                var containerCorrectAns = document.getElementById("correctAnswer");
                containerCorrectAns.remove(count - 1);
                count--;
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

                if (answer3) {
                    if (answer3.length > 2000) {
                        document.getElementById("messCreateQuestion").textContent = "answer3 comes over 2000 characters";
                        return false;
                    }
                }

                let answer4 = document.forms["myForm"]["answer4"].value;

                if (answer4)
                {
                    if (answer4.length > 2000) {
                        document.getElementById("messCreateQuestion").textContent = "answer4 comes over 2000 characters";
                        return false;
                    }
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