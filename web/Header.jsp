<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> quizpractice@g5.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <c:if test="${sessionScope.user ne null}">
                            <a href="Home"><img src="images/home/partner1.png" alt="" /></a>
                        </c:if>
                        <c:if test="${sessionScope.user eq null}">
                            <a href="LandingPage"><img src="images/home/partner1.png" alt="" /></a>
                        </c:if>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <c:if test="${sessionScope.user eq null}">
                                <li><a href="TestControl">Test</a></li>
                                <li><a href="DocumentList">Document</a></li>
                                <a href="Login" class="btn btn-default">Log in</a>
                            </c:if>
                            <c:if test="${sessionScope.user ne null}">
                                <c:if test="${sessionScope.user.rollId eq 1}">
                                    <li><a href="">Class</a></li>
                                </c:if>
                                <li><a href="PracticeList">Practice</a></li>
                                <li><a href="TestControl">Test</a></li>
                                <li><a href="DocumentList">Document</a></li>
                                <li><a href="Personal">Account</a></li>
                                <li><a href="Logout">Log out</a></li>
                            </c:if>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${sessionScope.user ne null}">
        <c:if test="${sessionScope.user.rollId ne 1}">
            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="Home" class="active">Home</a></li>

                                    <c:if test="${sessionScope.user.rollId eq 2}">
                                        <li><a href="SlideList">Slider</a></li>
                                        <li><a href="BlogList">Blog</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.rollId eq 3}">
                                        <li><a href="DataStatistic">DashBoard</a></li>
                                        <li><a href="SettingList">Setting</a></li>
                                        <li><a href="UserList">User</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.rollId eq 4}">
                                        <li><a href="DataStatistic">DashBoard</a></li>
                                        <li><a href="QuestionList">Question</a></li>
                                        <li><a href="QuizList">Quiz</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.rollId eq 5}">
                                        <li><a href="DataStatistic">DashBoard</a></li>
                                        <li><a href="SubjectList">Subject</a></li>
                                        <li><a href="">Class</a></li>
                                    </c:if>
                                   
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </c:if>

    </c:if>

</header>