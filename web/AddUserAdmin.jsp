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
        <title>Add User</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <!--/head-->

    <body>
        <jsp:include page="HeaderAdmin.jsp" />  
        <section>
            <div>

                <div class="container">
                    <div class="col-sm-6">
                        <div class="signup-form">
                            <!--sign up form-->
                            <h2>Add a user</h2>
                            <p class="text-primary" id="messCreateUser"></p>
                            <form name="myForm" action="AddUserAdmin" method="post" enctype="multipart/form-data" onsubmit="return validUserForm()">
                                Choose a avatar

                                <input id="avatar" type="file" name="fname" required="true"/>
                                Email
                                <input id="email" name="email" type="text" placeholder="Email" required="true" />
                                <input id="isExistedEmail" type="hidden" />
                                Password
                                <input name="password" type="password" placeholder="Password" required="true" />
                                Full Name
                                <input name="name"type="text" placeholder="Full Name" required="true" />  
                                Title
                                <select name="title" style="margin-bottom:10px; height: 40px">
                                    <c:forEach items="${listTitle}" var="list">
                                        <option value="${list.value}" ${list.value == userDrap.title ? 'selected':''}>${list.value}</option>
                                    </c:forEach>
                                </select> 
                                Phone
                                <input name="phone"type="text" placeholder="Phone Number" />													
                                Roll
                                <select name="roll" style="margin-bottom:10px; height: 40px">
                                    <c:forEach items="${listAllRolls}" var="list">
                                        <option value="${list.id}" ${list.id == userDrap.rollId ? 'selected':''}>${list.name}</option>
                                    </c:forEach>
                                </select> 

                                Status
                                <select name="status" style="margin-bottom: 10px;height: 40px" id="status">
                                    <c:forEach items="${listAllStatus}" var="list">
                                        <option value="${list}" ${list == userDrap.status ? 'selected':''}>${list}</option>
                                    </c:forEach>
                                </select>

                                <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-bottom: 30px">Add</button>
                            </form>                            
                        </div>
                    </div>
                </div>




            </div>
        </div>
    </section>
    <jsp:include page="Footer.jsp" />
    <script>

        document.getElementById('email').addEventListener('change', function () {
            $.ajax({
                url: "ValidEmail",
                type: 'POST',
                dataType: 'json',
                data: {email: document.getElementById("email").value},
                success: function (data) {
                    document.getElementById("isExistedEmail").value = data;
                }
            });
        });


        function validUserForm() {


            const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];


            // valid file

            let fi = document.forms["myForm"]["fname"];

            var fileValue = fi.value;
            var startIndex = fileValue.lastIndexOf(".");
            var filename = fileValue.substring(startIndex, fileValue.length);

            if (standardedExtensionImg.includes(filename) == false)
            {
                document.getElementById("messCreateUser").textContent
                        = 'file input is not a image';
                return false;
            }


            if (fi.files[0].size > 1048576)
            {
                document.getElementById("messCreateUser").textContent
                        = 'size of avatar inputed comes over 1KB ';
                return false;
            }


            //valid email
            let email = document.forms["myForm"]["email"].value;
            if (email.length > 100) {
                document.getElementById("messCreateUser").textContent = "email comes over 100 characters";
                return false;
            }


            if (validateEmail(email) === false)
            {
                document.getElementById("messCreateUser").textContent = "email is wrong format";
                return false;
            }

            var isEmailExisted = document.forms["myForm"]["isExistedEmail"].value;

            if(isEmailExisted === "true")
            {
                document.getElementById("messCreateUser").textContent = "email existed in the system";
                return false;
            }



            //valid password
            let password = document.forms["myForm"]["password"].value;

            if(password.length >25){
                document.getElementById("messCreateUser").textContent
                        = "password comes over 25 characters";
                return false;
            }
            


            if (!password.match(/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/))
            {
                document.getElementById("messCreateUser").textContent
                        = "password must contain at least 1 number,at least 1 lowercase,at least 1 uppercase, length more than 8 and no special characters";
                return false;
            }

            //valid fullname
            let fullname = document.forms["myForm"]["name"].value;

            if (fullname.length > 100)
            {
                document.getElementById("messCreateUser").textContent = "fullname comes over 100 characters";
                return false;
            }

            //valid phone
            let phone = document.forms["myForm"]["phone"].value;

            if (phone) {
                
                if(phone.length > 10)
                {
                    document.getElementById("messCreateUser").textContent = "phone comes over 10 characters";
                    return false;
                }
                
                
                if (isVietnamesePhoneNumber(phone) === false)
                {
                    document.getElementById("messCreateUser").textContent = "phone is wrong format";
                    return false;
                }
            }

        }

        

    </script>
    <script src="js/validation.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>

</html>