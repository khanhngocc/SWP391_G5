<%@page import="model.User"%>
<%@page import="model.Classes"%>
<%@page import="dal.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%UserDAO ud = new UserDAO();
        int id = ((Classes) request.getAttribute("cl")).getAuthorId();
        User x = ud.getUser(id);
        String aname = x.getFullname();
    %>
    <head>
        <script>
            function deleteLesson(id, cid) {
                var result = confirm("Do you want to delete this blog?");
                if (result) {
                    window.location.href = "DeleteLesson?id=" + id + "&cid=" + cid;
                }

            }
        </script>
        <meta charset="utf-8">
        <title>ECOURSES - Online Courses HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet"/>
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid d-none d-lg-block">
            <div class="row align-items-center py-4 px-xl-5">
                <div class="col-lg-3">
                    <a href="Home" class="text-decoration-none">
                        <h1 class="m-0"><span class="text-primary">Mega</span>Deals</h1>
                    </a>
                </div>

            </div>
            <!-- Topbar End -->


            <!-- Navbar Start -->
            <div class="container-fluid">
                <div class="row border-top px-xl-5">
                    <div class="col-lg-3 d-none d-lg-block">
                        <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                            <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>Class Operations</h5>
                            <i class="fa fa-angle-down text-primary"></i>
                        </a>
                        <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                            <div class="navbar-nav w-100">
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link" data-toggle="dropdown">Action <i class="fa fa-angle-down float-right mt-1"></i></a>
                                    <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                        <c:choose>
                                            <c:when test="${sessionScope.user.rollId==5}">
                                                <a href="ClassEdit?id=${cl.id}" class="dropdown-item">Class Info</a></c:when>
                                            <c:otherwise>
                                                <a hidden>Class Info</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <!-- Trigger/Open The Modal -->


                                        <!-- The Modal -->


                                    </div>
                                </div>

                            </div>
                        </nav>
                    </div>
                    <div class="col-lg-9">
                        <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                            <a href="" class="text-decoration-none d-block d-lg-none">
                                <h1 class="m-0"><span class="text-primary">Mega</span>Deals</h1>
                            </a>
                            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav py-0">
                                    <a href="ListStudentInClass?id=${cl.id}" class="nav-item nav-link active">List Students</a>

                                    <a href="TeacherInfo?id=${cl.id}" class="nav-item nav-link active">Teacher Info</a>



                                </div><c:choose>
                                    <c:when test="${sessionScope.user.rollId==5}">
                                        <a class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block" href="AddLesson?id=${cl.id}">Add Lessons</a>
                                    </c:when>
                                    <c:otherwise>
                                        
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Navbar End -->


            <!-- Header Start -->
            <div class="container-fluid page-header" style="margin-bottom: 90px">
                <div class="container">
                    <div class="d-flex flex-column justify-content-center" style="min-height: 300px">
                        <h3 class="display-4 text-white text-uppercase">${cl.name}</h3>
                        <div class="d-inline-flex text-white">
                            <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                            <i class="fa fa-angle-double-right pt-1 px-3"></i>
                            <p class="m-0 text-uppercase">Class</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header End -->


            <!-- Category Start -->


            <!-- Courses Start -->

            <div class="container-fluid py-5">
                <div class="container py-5">
                    <div class="text-center mb-5">
                        <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Lesson</h5>
                        <h1>List Of Lesson</h1>
                    </div>
                    <div class="row">
                        <c:forEach var="i" items="${ll}">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="rounded overflow-hidden mb-2">                        
                                    <img class="img-fluid" src="images/404/sleeping-person.jpg" alt=""/>
                                    <div class="bg-secondary p-4">
                                        <div class="d-flex justify-content-between mb-3">

                                            <small class="m-0"><i class="far fa-clock text-primary mr-2"></i>from ${i.createDate} to ${i.endDate}</small>
                                        </div>
                                        <a class="h5" href="LessonDetail?id=${i.id}&cid=${cl.id}">${i.name}</a>
                                        <div class="border-top mt-4 pt-4">
                                            <div class="d-flex justify-content-between">
                                                <jsp:useBean id="now" class="java.util.Date"/>
                                                <c:if test="${i.endDate lt now}"> 

                                                    <p class="text-danger">It's over! Time Up!</p></c:if>  

                                                </div>
                                            </div>
                                        </div>
                                    </div><c:choose>
                                    <c:when test="${sessionScope.user.rollId==5}">
                                        <button class="btn btn-primary" style="background-color: orange" onclick="deleteLesson(${i.id},${cl.id})">Delete</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary" style="background-color: orange" disabled>Delete</button>
                                    </c:otherwise></c:choose>
                                </div>
                        </c:forEach>

                    </div>
                </div>
                <center><div class="pagination-area">
                        <ul class="pagination"> 
                            <c:forEach begin="1" end="${pagesize}" var="i">
                                <c:choose>
                                    <c:when test="${page==i}">
                                        <li><a href="ClassDetail?id=${cl.id}&page=${i}" class="active">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li><a href="ClassDetail?id=${cl.id}&page=${i}">${i}</a></li> 
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </div></center>
            </div>


            <!-- Courses End -->


            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-white py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
                <div class="row pt-5">
                    <div class="col-lg-7 col-md-12">
                        <div class="row">
                            <div class="col-md-6 mb-5">
                                <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Get In Touch</h5>
                                <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                                <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                                <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                                <div class="d-flex justify-content-start mt-4">
                                    <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                                    <a class="btn btn-outline-light btn-square" href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="col-md-6 mb-5">
                                <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Our Courses</h5>
                                <div class="d-flex flex-column justify-content-start">
                                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Web Design</a>
                                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Apps Design</a>
                                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Marketing</a>
                                    <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Research</a>
                                    <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>SEO</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Newsletter</h5>
                        <p>Rebum labore lorem dolores kasd est, et ipsum amet et at kasd, ipsum sea tempor magna tempor. Accu kasd sed ea duo ipsum. Dolor duo eirmod sea justo no lorem est diam</p>
                        <div class="w-100">
                            <div class="input-group">
                                <input type="text" class="form-control border-light" style="padding: 30px;" placeholder="Your Email Address">
                                <div class="input-group-append">
                                    <button class="btn btn-primary px-4">Sign Up</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
                <div class="row">
                    <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                        <p class="m-0 text-white">&copy; <a href="#">Domain Name</a>. All Rights Reserved. Designed by <a href="https://htmlcodex.com">HTML Codex</a>
                        </p>
                    </div>
                    <div class="col-lg-6 text-center text-md-right">
                        <ul class="nav d-inline-flex">
                            <li class="nav-item">
                                <a class="nav-link text-white py-0" href="#">Privacy</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white py-0" href="#">Terms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white py-0" href="#">FAQs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white py-0" href="#">Help</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Contact Javascript File -->
            <script src="mail/jqBootstrapValidation.min.js"></script>
            <script src="mail/contact.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>
    </body>

</html>