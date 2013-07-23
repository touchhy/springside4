<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>任务管理</title>
    <link href="${ctx}/static/styles/tasklist.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<div class="container">
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${message}</div>
    </c:if>
    <div class="row bottom-line">
        <shiro:user>
            <div class="span2 custom-move-left">
                <img width="120px" height="120px" src="http://tupian.hbrc.com/qqjia/0/51/5176_1370009786641311.jpg"/>
            </div>
            <div class="span2 custom-bottom">
                <div>
                    <shiro:hasRole name="admin">
                        <a href="${ctx}/admin/user"><img src="${ctx}/static/images/admin.png"/></a>
                    </shiro:hasRole>
                    <a href="${ctx}/profile"><img src="${ctx}/static/images/setting.png"/></a>
                    <a href="${ctx}/logout"><img src="${ctx}/static/images/logout.png"></a>
                </div>
            </div>
        </shiro:user>

        <div class="margin-right custom-bottom2">
            <form class="form-search" action="#">
                <input type="text" name="search_LIKE_title" class="input-medium" id="search-input"
                       value="${param.search_LIKE_title}">
                <button class="small-search" id="search_btn"><img src="${ctx}/static/images/search.png"/></button>
            </form>
        </div>
    </div>
    <div class="custom-center"><a href="${ctx}/task/create"><img src="${ctx}/static/images/create.png"/></a></div>
    <div class="row">
        <table id="contentTable">
            <tbody>
            <c:forEach items="${tasks.content}" var="task">
                <tr>
                    <td><img src="${ctx}/static/images/published.png"/></td>
                    <td class="custom-td-border"><a href="${ctx}/task/update/${task.id}">${task.title}</a></td>
                    <td><a href="${ctx}/task/update/${task.id}"><img src="${ctx}/static/images/edit.png"/></a></td>
                    <td><a href="${ctx}/task/delete/${task.id}"><img src="${ctx}/static/images/delete.png"/></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <tags:pagination page="${tasks}" paginationSize="5"/>
    <div class="decorate-part1"></div>
    <div class="decorate-part2"></div>
</div>
</body>
</html>
