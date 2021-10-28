<%-- 
    Document   : QuizList
    Created on : Sep 24, 2021, 10:51:13 PM
    Author     : Admin
    Fix        : 22/10/2021
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Question to Practice</title>
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
        <jsp:include page="HeaderCustomer.jsp" />  

        <div class="container">

            <!--                <div class="col-sm-3"></div>-->

            <div class="searchform" style="margin-top: 20px;">
                <input type="text" id="myInput" onkeyup="searchForm(1)" placeholder="Search for content"/>
            </div>

            <br>
            <div>
                <form action="AddQuestionToPractice" method="post"><table class="table" id="myTable">
                        <tr>
                            <th><strong><a href="javascript:void(0);" onclick="sort(0)">ID</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(1)">Content</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(2)">Category</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(3)">Status</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(4)">Level</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(5)">Option 1</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(6)">Option 2</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(7)">Option 3</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(8)">Option 4</a></strong></th>
                            <th><strong><a href="javascript:void(0);" onclick="sort(9)">Correct Option</a></strong></th>                                
                            <th><center><strong><a href="javascript:void(0);">Add to Quiz</a></strong></center></th>

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
                                <td><input type="checkbox" name="checkbox" value="${i.id}" ${qqdao.getQuizzes_QuestionBy2Id(id,i.id) eq null?"":"checked"}></td>
                            </tr>     
                        </c:forEach>
                    </table>
                    <input type="hidden" name="id" value="${id}">
                    <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Update</button>
                </form>
            </div>


        </div>

        <jsp:include page="Footer.jsp" />  


        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script>

                                function deleteQuiz(id) {
                                    var result = confirm("Do you want to delete this question?");
                                    if (result) {
                                        window.location.href = "DeleteQuestion?id=" + id;
                                    }

                                }


                                function searchForm(number) {
                                    var input, filter, table, tr, td, i, txtValue, in_num;
                                    in_num = parseInt(number);
                                    if (in_num === 1)
                                        input = document.getElementById("myInput");
                                    filter = input.value.toUpperCase();
                                    table = document.getElementById("myTable");
                                    tr = table.getElementsByTagName("tr");
                                    for (i = 0; i < tr.length; i++) {
                                        td = tr[i].getElementsByTagName("td")[in_num];
                                        if (td) {
                                            txtValue = td.textContent || td.innerText;
                                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                tr[i].style.display = "";
                                            } else {
                                                tr[i].style.display = "none";
                                            }
                                        }
                                    }
                                }
        </script>
        <script>
            function sort(number) {
                var in_num, table, rows, switching, i, x, y, shouldSwitch;
                in_num = parseInt(number);
                table = document.getElementById("myTable");
                switching = true;
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < rows.length - 1; i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("td")[in_num];
                        y = rows[i + 1].getElementsByTagName("td")[in_num];
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }
        </script>
    </body>
</html>