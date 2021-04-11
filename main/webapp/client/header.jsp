<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand text-success logo" href="${pageContext.request.contextPath}/house/findHouseAll.do">
                <img class="img-fluid" src="${pageContext.request.contextPath}/client/img/logo.svg" alt="">
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                    data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/house/findHouseAll.do">
                            首页
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/house/findHouseList.do">
                            全部房源
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            用户中心
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownPortfolio">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/user-profile.do">用户基本资料</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/findUserHouse.do">我发布的房源</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/evaluate/findUserEvaluate.do">我表的评价</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/add-property.do">添加房源</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="navbarDropdownPortfolio3" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            发布房源
                        </a>
                    </li>
                </ul>
                <div class="my-2 my-lg-0">
                    <ul class="list-inline main-nav-right">
                        <c:if test="${not empty loginUser}">
                            <li class="list-inline-item">
                                <span>欢迎：${loginUser.username}</span>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/user/logout.do">登出</a>
                            </li>
                        </c:if>
                        <c:if test="${empty loginUser}">
                            <li class="list-inline-item">
                                <a class="btn btn-link btn-sm" href="${pageContext.request.contextPath}/client/login.jsp">登录</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/client/register.jsp">注册</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>
