<%@page import="dal.UserDAO"%>
<%@page import="model.User"%>
<%
    HttpSession ses = request.getSession();
    UserDAO ud = new UserDAO();
    User x =ud.getUser(((User)ses.getAttribute("user")).getEmail());
%>
<header id="header"><!--header-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="Home"><img src="images/home/partner1.png" alt="" /></a>
                    </div>

                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="ClassListOfCustomer?id=<%=x.getId()%>">Class</a></li>
                            <li><a href="TestControl">Test</a></li>
                            <li><a href="PracticeList">Practice</a></li>
                            <li><a href="DocumentList">Document</a></li>
                            <li><a href="Personal">Account</a></li>
                            <li><a href="Logout">Log out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>