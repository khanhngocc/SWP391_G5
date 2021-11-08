<%-- 
    Document   : QuizList
    Created on : Sep 24, 2021, 10:51:13 PM
    Author     : Admin
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
        <title>Quiz List</title>
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
        <jsp:include page="HeaderExpert.jsp" /> 
        <div class="container">

            <form action="QuizList" class="searchform">
                <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                <input type="text" placeholder="Search" name="type" value="${type}" hidden=""/>
                <input type="text" placeholder="Search" name="searchName" value="${searchName}"/>
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </form>

            <div style="margin-top: 20px; margin-bottom: 10px">

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Subject</p>
                <form style ="float: left;margin-right: 15px;margin-left: 5px" action="QuizList" >
                    <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                    <input type="text" placeholder="Search" name="type" value="${type}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="subject" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${subjectList}" var="list">
                            <option value="${list.id}" ${list.id == subject ? 'selected':''}>${list.title}</option>
                        </c:forEach>
                    </select>   
                </form>

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Category</p>
                <form style ="float: left;margin-left: 4px;margin-right: 15px" action="QuizList" >
                    <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                    <input type="text" placeholder="Search" name="type" value="${type}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="category" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listCategory}" var="list">
                            <option value="${list.value}" ${list.value == category ? 'selected':''}>${list.value}</option>
                        </c:forEach>
                    </select>   
                </form>

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Type</p>
                <form style ="float: left;margin-left: 4px" action="QuizList" >
                    <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                    <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="type" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listType}" var="list">
                            <option value="${list.value}" ${list.value == type ? 'selected':''}>${list.value}</option>
                        </c:forEach>
                    </select>   
                </form>
            </div>
            <br>


            <div style="margin-top: 30px; margin-bottom: 20px">
                <a href="AddQuiz"><i class="fa fa-plus"></i> Add new Quiz</a>
            </div>
            <div>
                <table class="table" id="myTable">
                    <tr>
                        <th><strong><a href="javascript:void(0);" onclick="sort(0)">ID</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(1)">Title</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(2)">Subject</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(3)">Category</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(4)">Level</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(5)">Type</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(6)">Author</a></strong></th>
                        <th><strong><a href="javascript:void(0);" onclick="sort(7)"># Question</a></strong></th>                                
                        <th colspan="3"><center><strong><a href="javascript:void(0);">Action</a></strong></center></th>

                    </tr>

                    <c:forEach items="${listAllQuizzes}" var="i">
                        <tr>
                            <td>${i.id}</td>
                            <td>${i.title}</td>
                            <td>${sdao.getSubject(i.subject_id,"Published").title}</td>
                            <td>${i.category}</td>
                            <td>${i.level}</td>
                            <td>${i.type}</td>
                            <td>${i.user_id}</td>
                            <td>${i.number_of_question}</td>
                            <c:choose>
                                <c:when test="${i.type eq 'User Practice'}">
                                    <td></td>
                                    <td><a href="QuizDetail?id=${i.id}"><i class="fa fa-eye"></i> View</a></td>
                                </c:when>                                
                                <c:otherwise>
                                    <td><a href="#" onclick="deleteQuiz(${i.id})"><i class="fa fa-trash-o"></i> Delete</a></td>
                                    <td><a href="EditQuiz?id=${i.id}"><i class="fa fa-pencil"></i>Edit</a></td>
                                    <td><a href="QuizDetail?id=${i.id}"><i class="fa fa-eye"></i> View</a></td>
                                </c:otherwise>
                            </c:choose>

                        </tr>     
                    </c:forEach>
                </table>

                 <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="QuizList?page=1&searchName=${searchName}&subject=${subject}&category=${category}&type=${type}">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="QuizList?page=${pageindex -i}&searchName=${searchName}&subject=${subject}&category=${category}&type=${type}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="QuizList?page=${pageindex + i}&searchName=${searchName}&subject=${subject}&category=${category}&type=${type}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="QuizList?page=${pagecount}&searchName=${searchName}&subject=${subject}&category=${category}&type=${type}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
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
                                            var result = confirm("Do you want to delete this quiz?");
                                            if (result) {
                                                window.location.href = "DeleteQuiz?id=" + id;
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