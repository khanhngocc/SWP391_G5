<%-- 
    Document   : Home
    Created on : Sep 12, 2021, 8:32:26 PM
    Author     : dell
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Setting List</title>
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
    </head><!--/head-->

    <body>

        <jsp:include page="HeaderAdmin.jsp" />  

        <section id="slider"><!--slider-->
            <div class="container">

                <form action="SettingList" class="searchform">
                    <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                    <input type="text" placeholder="Search" name="type" value="${type}" hidden=""/>
                    <input type="text" placeholder="Search" name="searchName" value="${searchName}"/>
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                </form>

                <div style="margin-top: 20px; margin-bottom: 10px">

                    <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Status</p>
                    <form style ="float: left;margin-right: 15px;margin-left: 5px" action="SettingList" >
                        <input type="text" placeholder="Search" name="type" value="${type}" hidden=""/>
                        <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>

                        <select   name="status" onchange="this.form.submit()" >
                            <option value="">All</option>
                            <c:forEach items="${listAllStatus}" var="list">
                                <option value="${list}" ${list == status ? 'selected':''}>${list}</option>
                            </c:forEach>
                        </select>   
                    </form>

                    <p class="text-primary" style ="float: left;margin: 5px 0 0 4px">Type</p>
                    <form style ="float: left;margin-left: 4px" action="SettingList" >
                        <input type="text" placeholder="Search" name="status" value="${status}" hidden=""/>
                        <input type="text" placeholder="Search" name="searchName" value="${searchName}" hidden=""/>
                        <select name="type" onchange="this.form.submit()" >
                            <option value="">All</option>
                            <c:forEach items="${listAllTypes}" var="list">
                                <option value="${list}" ${list == type ? 'selected':''}>${list}</option>
                            </c:forEach>
                        </select>   
                    </form>

                </div>
                <br>
                <div style="margin-top: 30px; margin-bottom: 20px">
                    <a href="AddSetting"><i class="fa fa-book"></i> Create a setting</a> 
                </div>

                <table class="table" id="myTable">
                    <thead>
                        <tr>

                            <th scope="col"><a href="javascript:void(0);" onclick="sort(0)">ID</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(1)">Type</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(2)">Value</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(3)">Status</a></th>
                            <th scope="col"><a href="javascript:void(0);" onclick="sort(4)">Note</a></th>
                            <th scope="col" style="width: auto" colspan="2"><a href="javascript:void(0);">Action</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listAllSettings}" var="list">
                            <tr>
                                <th scope="row">${list.id}</th>
                                <td>${list.type}</td>
                                <td>${list.value}</td>
                                <td>${list.status}</td>
                                <td>${list.note}</td>
                                <td style="width: 200px">
                                    <c:if test="${list.status eq 'Active'}">
                                        <a href="javascript:void(0);" onclick="changeStatus(${list.id}, 'Deactive')"><i class="fa fa-chain"></i> Deactive</a> 
                                    </c:if>
                                    <c:if test="${list.status eq 'Deactive'}">
                                        <a href="javascript:void(0);" onclick="changeStatus(${list.id}, 'Active')"><i class="fa fa-chain"></i> Active</a>  
                                    </c:if>
                                    <a href="UpdateSetting?id=${list.id}"><i class="fa fa-pencil"></i> Update</a> 
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagination-area">
                    <ul class="pagination">

                        <c:if test="${pageindex gt gap}">
                            <li class="page-item"><a class="page-link" href="SettingList?page=1&searchName=${searchName}&type=${type}&status=${status}">First</a></li>
                            </c:if>
                            <c:forEach var = "i" begin = "${gap}" end = "1">
                                <c:if test="${pageindex - gap gt 0}">
                                <li class="page-item"><a class="page-link" href="SettingList?page=${pageindex -i}&searchName=${searchName}&type=${type}&status=${status}">${pageindex - i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:forEach var = "i" begin = "1" end = "${gap}">
                                <c:if test="${pageindex + gap le pagecount}">
                                <li class="page-item"><a class="page-link" href="SettingList?page=${pageindex + i}&searchName=${searchName}&type=${type}&status=${status}">${pageindex + i}</a></li> 
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageindex + gap lt pagecount}">
                            <li class="page-item"><a class="page-link" href="SettingList?page=${pagecount}&searchName=${searchName}&type=${type}&status=${status}">Last</a></li> 
                            </c:if>
                    </ul>

                </div>
            </div>
        </section><!--/slider-->


        <jsp:include page="Footer.jsp" />  
        <script src="js/sortHelper.js"></script>
        <script src="js/SettingHelper.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
