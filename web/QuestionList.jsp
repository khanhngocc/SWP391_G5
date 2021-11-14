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
        <title>Question List</title>
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

            <form action="QuestionList" class="searchform">
                <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                <input type="text" placeholder="Search" name="level" value="${level}" hidden=""/>
                <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                <input type="text" placeholder="Search" name="searchName" value="${searchName}"/>
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
            </form>

            <div style="margin-top: 20px; margin-bottom: 10px">

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Subject</p>
                <form style ="float: left;margin-right: 15px;margin-left: 5px" action="QuestionList" >
                    <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                    <input type="text" placeholder="Search" name="level" value="${level}" hidden=""/>
                    <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="subject" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listSubjects}" var="list">
                            <option value="${list.title}" ${list.title == subject ? 'selected':''}>${list.title}</option>
                        </c:forEach>
                    </select>   
                </form>

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Category</p>
                <form style ="float: left;margin-left: 4px;margin-right: 15px" action="QuestionList" >
                    <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                    <input type="text" placeholder="Search" name="level" value="${level}" hidden=""/>
                    <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="category" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listCategory}" var="list">
                            <option value="${list.value}" ${list.value == category ? 'selected':''}>${list.value}</option>
                        </c:forEach>
                    </select>   
                </form>

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Level</p>
                <form style ="float: left;margin-left: 4px;;margin-right: 15px" action="QuestionList" >
                    <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                    <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                    <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="level" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listLevel}" var="list">
                            <option value="${list.value}" ${list.value == level ? 'selected':''}>${list.value}</option>
                        </c:forEach>
                    </select>   
                </form>

                <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Status</p>
                <form style ="float: left;margin-left: 4px" action="QuestionList" >
                    <input type="text" placeholder="Search" name="subject" value="${subject}" hidden=""/>
                    <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                    <input type="text" placeholder="Search" name="level" value="${level}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                    <select name="status" onchange="this.form.submit()" >
                        <option value="">All</option>
                        <c:forEach items="${listStatus}" var="list">
                            <option value="${list}" ${list == status ? 'selected':''}>${list}</option>
                        </c:forEach>
                    </select>   
                </form>
            </div>
            <br>
            <div style="margin-top: 30px; margin-bottom: 20px">
                <a href="ImportQuestion"><i class="fa fa-upload"></i> Import Question List</a>
                <a style="margin-left: 6px" href="AddQuestion"><i class="fa fa-plus"></i> Add Question </a>
            </div>       

            <div>
                <table class="table" id="myTable">
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
                        <th colspan="3"><center><strong><a href="javascript:void(0);">Action</a></strong></center></th>

                    </tr>

                    <c:forEach items="${listQuestions}" var="i">
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
                            <c:if test="${i.status eq 'Active'}">
                                <td><a href="javascript:void(0);" onclick="changeQuestionStatus(${i.id}, 'Deactive')"><i class="fa fa-chain"></i> Deactive</a> </td>
                        </c:if>
                        <c:if test="${i.status eq 'Deactive'}">
                            <td><a href="javascript:void(0);" onclick="changeQuestionStatus(${i.id}, 'Active')"><i class="fa fa-chain"></i> Active</a> </td>
                        </c:if>
                        <td><a href="EditQuestion?id=${i.id}"><i class="fa fa-pencil"></i>Edit</a></td>
                        <td><a href="ViewQuestion?id=${i.id}"><i class="fa fa-eye"></i> View</a></td>
                        </tr>     
                    </c:forEach>
                </table>

                <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="QuestionList?page=1&searchName=${searchName}&subject=${subject}&category=${category}&level=${level}&status=${status}">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="QuestionList?page=${pageindex -i}&searchName=${searchName}&subject=${subject}&category=${category}&level=${level}&status=${status}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="QuestionList?page=${pageindex + i}&searchName=${searchName}&subject=${subject}&category=${category}&level=${level}&status=${status}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="QuestionList?page=${pagecount}&searchName=${searchName}&subject=${subject}&category=${category}&level=${level}&status=${status}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
            </div>


        </div>
        <jsp:include page="Footer.jsp" /> 

        <script src="js/sortHelper.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

        <script>
                                function changeQuestionStatus(id, status) {

                                    var mess;

                                    if (status === 'Active')
                                        mess = "Do you want to active this question?";
                                    else
                                        mess = "Do you want to deactive this question?";


                                    var result = confirm(mess);
                                    if (result) {
                                        window.location.href = "ChangeQuestionStatus?id=" + id + "&status=" + status;
                                    }

                                }

        </script>
    </body>
</html>