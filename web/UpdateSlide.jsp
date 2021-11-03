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
        <title>Update Slider</title>
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
                        <h2>Update slider</h2>
                        <p class="text-primary" id="messUpdateSlide"></p>
                        <form name="myForm" action="UpdateSlide" enctype="multipart/form-data" method="post" onsubmit="return validSlide()">
                            <input name="id" type="hidden" value="${slide.id}"/>
                            <input name="srcImg" type="hidden"  value="${slide.image_Url}"/>
                            Title
                            <input name="title" type="text" required="true" value="${slide.title}"/>
                            <p>Thumbnail</p>
                            <img src="${slide.image_Url}" alt="" style="height: 250px;width: 250px;margin-bottom: 10px"/>
                            <input name="fname" type="file" />
                            Backlink
                            <input name="backlink" type="text" value="${slide.backlink}" readonly="true"/>

                            Notes
                            <textarea hidden="" name="notes" id="contentDetails" rows="10" cols="80"></textarea>

                            <div id="toolbar-container"></div>

                            <div id="editor">
                                ${slide.note}
                            </div>
                            <button type="submit" class="btn btn-default" style="margin-top: 10px">Update</button>
                        </form>
                    </div>
                    <br>
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


            function validSlide() {

                const standardedExtensionImg = ['.jpg', '.jpeg', '.png', '.gif'];

                // valid notes

                var notes = getDataFromTheEditor();
                
                if (notes.length > 3000) {
                    document.getElementById("messUpdateSlide").textContent = "notes comes over 3000 characters";

                    return false;
                }

                document.getElementById("contentDetails").textContent = getDataFromTheEditor();

                //valid title
                let title = document.forms["myForm"]["title"].value;
                if (title.length > 100) {
                    document.getElementById("messUpdateSlide").textContent = "title comes over 100 characters";
                    return false;
                }

                // valid file

                let fi = document.forms["myForm"]["fname"];

                var fileValue = fi.value;
                if (fileValue)
                {
                    var startIndex = fileValue.lastIndexOf(".");
                    var filename = fileValue.substring(startIndex, fileValue.length);

                    if (standardedExtensionImg.includes(filename) == false)
                    {
                        document.getElementById("messUpdateSlide").textContent
                                = 'file input is not a image';
                        return false;
                    }


                    for (const i = 0; i <= fi.files.length - 1; i++) {

                        const fsize = fi.files.item(i).size;
                        const file = Math.round((fsize / 1024));
                        // The size of the file.



                        if (file > 1024)
                        {
                            document.getElementById("messUpdateSlide").textContent
                                    = 'size of file inputed comes over 1024 KB ';
                            return false;
                        }

                    }
                }

            }

        </script>
        <script src="js/validation.js"></script>
        <script src="js/blogHander.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
