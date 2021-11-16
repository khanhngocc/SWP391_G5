<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-3">
    <div class="left-sidebar">
        <h2>Data Management</h2>
        <div class="panel-group category-products" id="accordian">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="DataStatistic">Statistic</a></h4>
                </div>
            </div>
            <c:if test="${sessionScope.user.rollId ne 4}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a href="Trend">Trend</a></h4>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
</div>