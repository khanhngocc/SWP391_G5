<%-- 
    Document   : Login
    Created on : Sep 11, 2021, 3:38:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Reset Password</title>
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
        <section id="form">
            <!--form-->
            <div class="container" style="margin-left: 100px;margin-right: 100px">
                <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-4">
                        <div class="login-form">
                            <!--login form-->
                            <h2 class="text-center">Reset your password</h2>
                            <p class="text-center text-danger" style="font-size: 13px;"><i class="fa fa-warning"></i> Warning: This link will close after <span id="time"></span></p>
                            <p class="text-primary" id="messageReset"></p>
                            <form id="frm" action="ResetPassword" method = "POST">
                                <input id="idText" name="idEncoded" type="hidden" value=""/>
                                <input name="email" type="hidden" value="${emailReset}"/>
                                New password
                                <input id="newpass" name="newpass" type="password" placeholder="New password" required="true"/>
                                Re-password
                                <input id= "repass" name="repass" type="password" placeholder="Re-password" required="true"/>
                                <button onclick="verifyForm()" type="button" class="btn btn-default center-block">Reset</button>
                            </form>

                        </div>
                        <!--/login form-->
                    </div>
                               
                    <div class="col-sm-4">
                        <div class="login-form">
                            <h2>Rule for password</h2>
                        </div>
                         
                        <ul class="list-group">
                            <li class="list-group-item">Contain at least 8 characters</li>
                            <li class="list-group-item">Contain at least 1 number</li>
                            <li class="list-group-item">Contain at least 1 lowercase character (a-z)</li>
                            <li class="list-group-item">Contain at least 1 uppercase character (A-Z)</li>
                            <li class="list-group-item">Contains only number from 0 to 9 and character in the alphabet</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!--/form-->
        <script>

            function verifyForm() {
                var txtNewPass = document.getElementById("newpass").value;
                var txtRePass = document.getElementById("repass").value;
                var mess;
                if (txtNewPass.length > 100)
                {
                    mess = "sorry, length of new password comes over 100 characters";
                } else if (txtRePass.length > 100)
                {
                    mess = "sorry, length of re-password comes over 100 characters";
                } else if (!txtNewPass.match(/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/))
                {
                    mess = "sorry, password must follow the rules in the right table";
                } else if (txtNewPass !== txtRePass)
                {
                    mess = "sorry, new password not equal re-password";
                } else
                {
                    document.getElementById("frm").submit();
                }

                document.getElementById("messageReset").textContent = mess;
            }

            window.onload = function () {

                // get id to server
                var url = window.location.href;
                var lastIndexOfSign = url.lastIndexOf('?');
                var idEncoded = url.substring(lastIndexOfSign + 1, url.length);
                document.getElementById("idText").value = idEncoded;



                var expiredTime = new Date(${year}, ${month}, ${day}, ${hour},${minus},${second});
                var secondBetweenTwoDate = Math.round((new Date().getTime() - expiredTime.getTime()) / 1000);

                var timeleft = Math.abs(secondBetweenTwoDate);

                var downloadTimer = setInterval(function () {
                    if (timeleft <= 0) {
                        clearInterval(downloadTimer);
                        window.location.href = url;
                    } else {
                        document.getElementById("time").innerHTML = timeleft + " seconds remaining";
                    }
                    timeleft -= 1;
                }, 1000);


            };

        </script>

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
