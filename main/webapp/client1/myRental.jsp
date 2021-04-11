<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我发布的租房信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/global.css">
    <script src="${pageContext.request.contextPath }/client/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/client/js/jquery.min.js"></script>
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">我发布的租房信息</legend>
    </fieldset>
    <div class="house-detail">
        <ul>
            <c:forEach items="${houseList}" var="h">
                <li>
                    <a href="javascript:void(0)" class="show-image" onclick="jumpDetail(${h.hid});">
                        <img src="${h.image}" width="240px" height="180px">
                    </a>
                    <div class="show-details">
                        <p class="house-title">
                            <a href="javascript:void(0)" onclick="jumpDetail(${h.hid});">${h.title}</a>
                        </p>
                        <p class="house-about">
                            <span class="layui-icon layui-icon-home"></span>
                            <span>${h.model}</span>
                            <span class="flag-line">|</span>
                            <span>${h.area } m<sup>2</sup></span>
                            <span class="flag-line">|</span>
                            <span>普通装修</span>
                            <span class="flag-line">|</span>
                            <span>${h.floor }</span>
                            <span class="flag-line">|</span>
                            <span>${h.type }</span>
                        </p>
                        <p class="house-address clearfix">
                            <span class="layui-icon layui-icon-location"></span>
                            <span class="whole-line">
			    		        <span>${h.address}</span>
					        </span>
                        </p>
                        <div class="show-price">
                            <span class="sale-price">${h.price}</span>
                            <span class="sale-unit">元/月</span>
                            <div class="layui-btn-group">
                                <input type="button" class="layui-btn" onclick="delHouseById(${h.hid});" value="删除"/>
                                <input type="button" class="layui-btn" onclick="updateHouseById(${h.hid})" value="修改"/>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script>
function delHouseById(id) {
    if(confirm("您确认要删除吗")){
        location.href="${pageContext.request.contextPath}/house/delHouse/${loginUser.uid}/"+id+".do";
    }
}
function updateHouseById(id) {


}
function jumpDetail(id) {
    window.parent.location.href="${pageContext.request.contextPath}/house/findHouseById/"+id+".do";
    window.parent.location.reload();
}
</script>
</body>
</html>