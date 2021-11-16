<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left-sidebar">
    <h2>Category</h2>
    <form action="DocumentList">
        <div class="search_box centerSearch">
            <input type="text" placeholder="Search" name="categories" value="${categories}" hidden=""/>
            <input name="searchName" type="text" placeholder="Search" value="${name_search}" onchange="this.form.submit()"/>
        </div>
    </form>
    <div class="panel-group category-products" id="accordian">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"><a href="DocumentList">All</a></h4>
            </div>
        </div>
        <c:forEach items="${listCategories}" var="list">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="DocumentList?searchName=${name_search}&categories=${list.value}">${list.value}</a></h4>
                </div>
            </div>
        </c:forEach>
    </div><!--/category-products-->
   <h2>Hot Featured</h2>
    <div class="panel-group category-products" class ="container" style="border:none">
        <c:forEach items="${list5}" var="i">
            <div class="col-md-6" style="margin-bottom: 14px;height:155px">
                <img class="featuresBlog" src="${i.img_url}" alt=""><br>
                <div style="margin-top: 8px"><a href="DocumentDetailed?id=${i.id}">${i.title}</a></div>
            </div>
        </c:forEach>
    </div>   


</div>