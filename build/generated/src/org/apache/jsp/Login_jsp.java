package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"utf-8\">\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("\t<meta name=\"description\" content=\"\">\r\n");
      out.write("\t<meta name=\"author\" content=\"\">\r\n");
      out.write("\t<title>Login | E-Shopper</title>\r\n");
      out.write("\t<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/prettyPhoto.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/price-range.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/animate.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/main.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<link href=\"css/responsive.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<!--[if lt IE 9]>\r\n");
      out.write("    <script src=\"js/html5shiv.js\"></script>\r\n");
      out.write("    <script src=\"js/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("\t<link rel=\"shortcut icon\" href=\"images/ico/favicon.ico\">\r\n");
      out.write("\t<link rel=\"apple-touch-icon-precomposed\" sizes=\"144x144\" href=\"images/ico/apple-touch-icon-144-precomposed.png\">\r\n");
      out.write("\t<link rel=\"apple-touch-icon-precomposed\" sizes=\"114x114\" href=\"images/ico/apple-touch-icon-114-precomposed.png\">\r\n");
      out.write("\t<link rel=\"apple-touch-icon-precomposed\" sizes=\"72x72\" href=\"images/ico/apple-touch-icon-72-precomposed.png\">\r\n");
      out.write("\t<link rel=\"apple-touch-icon-precomposed\" href=\"images/ico/apple-touch-icon-57-precomposed.png\">\r\n");
      out.write("</head>\r\n");
      out.write("<!--/head-->\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<section id=\"form\">\r\n");
      out.write("\t\t<!--form-->\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-4 col-sm-offset-1\">\r\n");
      out.write("\t\t\t\t\t<div class=\"login-form\">\r\n");
      out.write("\t\t\t\t\t\t<!--login form-->\r\n");
      out.write("\t\t\t\t\t\t<h2>Login to your account</h2>\r\n");
      out.write("                                                <p class=\"text-danger\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mess1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t\t<form action=\"Login\" method = \"post\">\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"Email\" type=\"text\" placeholder=\"Email\" />\r\n");
      out.write("\t\t\t\t\t\t\t<input name =\"Password\" type=\"password\" placeholder=\"Password\" />\r\n");
      out.write("\t\t\t\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input name=\"remember\" type=\"checkbox\" class=\"checkbox\">\r\n");
      out.write("\t\t\t\t\t\t\t\tRemember me\r\n");
      out.write("\t\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-default\">Login</button>\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!--/login form-->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-1\">\r\n");
      out.write("\t\t\t\t\t<h2 class=\"or\">OR</h2>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-4\">\r\n");
      out.write("\t\t\t\t\t<div class=\"signup-form\">\r\n");
      out.write("\t\t\t\t\t\t<!--sign up form-->\r\n");
      out.write("\t\t\t\t\t\t<h2>New User Signup!</h2>\r\n");
      out.write("                                                <p class=\"text-danger\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mess}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t\t<form action=\"register\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"email\" type=\"text\" placeholder=\"Email\" />\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"name\"type=\"text\" placeholder=\"Full Name\" />\r\n");
      out.write("\t\t\t\t\t\t\t<p>                           \r\n");
      out.write("\t\t\t\t\t\t\t<select name=\"gender\" id=\"gender\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"male\">Male</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"female\">Female</option>\r\n");
      out.write("\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"phone\"type=\"text\" placeholder=\"Phone Number\" />\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"pass\"type=\"password\" placeholder=\"Password\" />\r\n");
      out.write("\t\t\t\t\t\t\t<input name=\"repass\"type=\"password\" placeholder=\"Re-Password\" />\r\n");
      out.write("\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-default\">Signup</button>\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!--/sign up form-->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</section>\r\n");
      out.write("\t<!--/form-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<script src=\"js/jquery.js\"></script>\r\n");
      out.write("\t<script src=\"js/price-range.js\"></script>\r\n");
      out.write("\t<script src=\"js/jquery.scrollUp.min.js\"></script>\r\n");
      out.write("\t<script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("\t<script src=\"js/jquery.prettyPhoto.js\"></script>\r\n");
      out.write("\t<script src=\"js/main.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
