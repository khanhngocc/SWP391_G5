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
        <title>Update Blog</title>
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
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/decoupled-document/ckeditor.js"></script>
    </head><!--/head-->

    <body>

        <jsp:include page="HeaderMarketing.jsp" /> 

        <section id="slider"><!--slider-->
            <div class="container">

                <div class="col-sm-9">

                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Update blog</h2>
                        <p class="text-primary" id="messUpdateBlog"></p>
                        <form name="myForm" action="UpdateBlog?id=${blog.id}" enctype="multipart/form-data" method="post" onsubmit="return validBlog()">

                            Title
                            <input name="title" type="text" required="true" value="${blog.title}"/>
                            Category
                            <select name="category" style="margin-bottom:10px">
                                <c:forEach items="${categoriesList}" var="list">
                                    <option value="${list.value}" ${list.value == blog.category ? 'selected':''}>${list.value}</option>
                                </c:forEach>
                            </select> 
                            <p>Thumbnail</p>
                            <img src="${blog.img_url}" alt="" style="width: 200px;height: 200px;margin-bottom: 10px" />
                            <input name="imgURL" type="hidden" value="${blog.img_url}"  />
                            <input name="fname" type="file"/>
                            <p>Attach File </p> 
                            <c:if test="${blog.attach_url ne ''}">
                                <a href="${blog.attach_url}" download>
                                    <i class="fa fa-download" style="color: #FE980F;"></i> ${blog.attachName}
                                </a>
                            </c:if>
                            
                            <input name="attach" style="margin-top: 6px" type="file"/>
                            <input name="attachURL" type="hidden" value="${blog.attach_url}"/>
                            Description
                            <textarea hidden="" name="desc" id="contentDetails">
                            </textarea>
                            <div id="toolbar-container"></div>

                            <!-- This container will become the editable. -->
                            <div id="editor">
                                ${blog.description}
                            </div>

                            <button type="submit" class="btn btn-default" style="margin-top: 10px">Save</button>
                        </form>
                    </div>

                </div>
            </div>

        </section><!--/slider-->


        <jsp:include page="Footer.jsp" /> 
        <script>
            let theEditor;
            DecoupledEditor
                    .create(document.querySelector('#editor'))
                    .then(editor => {
                        theEditor = editor;
                        const toolbarContainer = document.querySelector('#toolbar-container');

                        toolbarContainer.appendChild(editor.ui.view.toolbar.element);
                    })
                    .catch(error => {
                        console.error(error);
                    });

            function getDataFromTheEditor() {
                return theEditor.getData();

            }


            function validBlog() {

                const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];
                const standardedExtensionAttachedFile = ['.docx', '.doc', '.xlsx'];


                //valid title
                let title = document.forms["myForm"]["title"].value;
                if (title.length > 100) {
                    document.getElementById("messUpdateBlog").textContent = "title comes over 100 characters";
                    return false;
                }

                // valid thumbnail

                let fi = document.forms["myForm"]["fname"];


                var fileValue = fi.value;
                if (fileValue) {
                    var startIndex = fileValue.lastIndexOf(".");
                    var filename = fileValue.substring(startIndex, fileValue.length);

                    if (standardedExtensionImg.includes(filename) == false)
                    {
                        document.getElementById("messUpdateBlog").textContent
                                = 'thumnail input is not a image';
                        return false;
                    }


                    if (fi.files[0].size > 1048576)
                    {
                        document.getElementById("messUpdateBlog").textContent
                                = 'size of thumbnail inputed comes over 1KB ';
                        return false;
                    }
                }




                // valid attach file

                var attach = document.forms["myForm"]["attach"];


                var attachValue = attach.value;

                // if choose attached file
                if (attachValue) {
                    var startIndexAttach = attachValue.lastIndexOf(".");
                    var filenameAttach = attachValue.substring(startIndexAttach, attachValue.length);

                    if (standardedExtensionAttachedFile.includes(filenameAttach) == false)
                    {
                        document.getElementById("messUpdateBlog").textContent
                                = 'file attach is not a word or excel';
                        return false;
                    }

                    if (attach.files[0].size > 1048576)
                    {
                        document.getElementById("messUpdateBlog").textContent
                                = 'size of attached file inputed comes over 1KB ';
                        return false;
                    }

                }

                // valid desc

                var description = getDataFromTheEditor();

                if (description.length === 0) {
                    document.getElementById("messUpdateBlog").textContent = "description is empty";

                    return false;
                }


                if (description.length > 11000) {
                    document.getElementById("messUpdateBlog").textContent = "description comes over 11000 characters";

                    return false;
                }

                // get value from ckeditor to textarea
                document.getElementById("contentDetails").textContent = getDataFromTheEditor();



            }

        </script>
        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
