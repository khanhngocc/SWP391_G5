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
        <title>Update Information</title>
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
        <section style="margin-top: 30px;margin-bottom: 250px;">
            <div class="container">
                <div class="row">
                    <jsp:include page="SidebarPersonal.jsp" /> 
                    <div class="col-sm-9 padding-right">
                        <p class="text-primary" id="messUpdateUser">${messUpdateUser}</p>
                        <div class="shopper-info col-sm-6">

                            <form name="myForm" enctype="multipart/form-data" action="Personal" method="POST" onsubmit="return validUserProfile()">
                                <img id="profile-ava" class="imageAvatar" src="${userInfor.avatar}">
                                <br>
                                Choose a avatar
                                <input type="file" name="fname">
                                <input name="srcAvatar" type="hidden" value="${userInfor.avatar}" />
                                <input name="email" type="hidden" value="${userInfor.email}" />
                                Full Name
                                <input name="name"type="text" placeholder="Full Name" required="true" value="${userInfor.fullname}"/>  
                                Phone
                                <input name="phone"type="text" placeholder="Phone Number" value="${userInfor.getPhone()}" required="" />	
                                Title
                                <br>
                                <select style="width: 15%;margin-top: 10px;margin-bottom: 10px" name="title" >
                                    <c:forEach items="${listTitle}" var="list">
                                        <option value="${list.value}" ${list.value == userInfor.title ? 'selected':''}>${list.value}</option>
                                    </c:forEach>
                                </select> 
                                <br>


                                <button type="submit" class="btn btn-primary">Update</button>
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
    </body>

</html>