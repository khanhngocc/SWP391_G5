<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-3">
    <div class="left-sidebar">
        <h2>Category</h2>
        <form action="TestControl" >
            <div class="search_box centerSearch">
                <input type="text" placeholder="Search" name="category" value="${category}" hidden=""/>
                <input name="searchName" type="text" placeholder="Search" value="${searchName}" onchange="this.form.submit()"/>
            </div>
        </form>
        <div class="panel-group category-products" id="accordian"><!--category-productsr-->

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="TestControl">All</a></h4>
                </div>
            </div>
            <c:forEach items="${listCategories}" var="i">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a href="TestControl?searchName=${searchName}&category=${i.value}">${i.value}</a></h4>
                    </div>
                </div>
            </c:forEach>
        </div><!--/category-products-->
        <div class="panel-group category-products" class ="container" style="border:none">
            <c:forEach items="${listFiveHotFreeTest}" var="i">
                <div class="col-md-6" style="margin-bottom: 14px">
                    <img id="img-left-side" src="${i.thumbnail}" alt=""><br>
                    <div style="margin-top: 8px"><a href="FreeTestDetail?id=${i.id}">${i.title}</a></div>

                </div>
            </c:forEach>
        </div>   

    </div>
</div>