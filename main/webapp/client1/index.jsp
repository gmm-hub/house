<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/layui/css/layui.css"/>
    <title>欢迎来到房屋租赁网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/global.css">
    <script src="${pageContext.request.contextPath }/client/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/client/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/index.js"></script>
</head>
<body>
<!--轮播图-->
<div class="layui-carousel" id="bg-item">
    <div class="layui-header title">
        <div class="layui-container">
            <c:if test="${not empty loginUser }">
                <div class="personalCenter layui-pull-right">
                    <span>${loginUser.username}</span>
                    <a href="${pageContext.request.contextPath}/client/home.jsp" target="_blank" style="color:#fff"><i class="layui-icon layui-icon-tree"></i> 个人中心</a>
                </div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i class="layui-icon layui-icon-tree"></i> 登录 - 注册</div>
            </c:if>
        </div>
    </div>
    <!--搜索框-->
    <div class="layui-container">
        <div class="search-input">
            <form class="search-form layui-form" method="post" action="${pageContext.request.contextPath }/house/findHouseAll.do">
                <div class="layui-pull-left input">
                    <input type="text" placeholder="请输入房源特征、房型、小区名..." name="searchName" class="search layui-input" lay-verify="" value="${searchName}" id="searchName">
                </div>
                <div class="layui-pull-left button">
                    <button class="btn search-btn" lay-submit>
                        <i class="layui-icon layui-icon-search" style="font-size: 24px;"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <div carousel-item>
        <div style="background: url('${pageContext.request.contextPath}/client/img/banner-1.jpg')no-repeat center/cover"></div>
        <div style="background: url('${pageContext.request.contextPath}/client/img/banner-2.jpg')no-repeat center/cover"></div>
        <div style="background: url('${pageContext.request.contextPath}/client/img/banner-3.jpg')no-repeat center/cover"></div>
        <div style="background: url('${pageContext.request.contextPath}/client/img/banner-4.jpg')no-repeat center/cover"></div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-tab layui-tab-brief" id="sign" lay-filter="" style="display: none;">
        <ul class="layui-tab-title">
            <li class="layui-this">登录</li>
            <li>注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="" style="margin: 40px 20px;">
                    <form class="layui-form layui-form-pane" id="login">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required lay-verify="required"
                                       placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius" lay-submit
                                    lay-filter="login">立即登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="" style="margin: 30px 20px;">
                    <form class="layui-form layui-form-pane form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input" id="username"><span id="msg" style="color: red"></span>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required lay-verify="required"
                                       placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="phone" required lay-verify="required|phone"
                                       placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </form>
                    <div class="layui-form-item">
                        <input type="submit"
                               class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal regist-btn"
                               value="立即注册"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--内容开始-->
<%--多条件检索--%>
<div class="layui-container">
    <div class="search-listbox">
        <dl class="search-list clearfix" id="rentid_D04_01">
            <dt>区域：</dt>
            <dd style="position: relative;">
                <a href="javascript:void(0);" class="org bold" onclick="clearviewed()">不限</a><a href="/house-a025/">浦东</a><a href="/house-a029/">嘉定</a><a href="/house-a030/">宝山</a><a href="/house-a018/">闵行</a><a href="/house-a0586/">松江</a><a href="/house-a028/">普陀</a><a href="/house-a021/">静安</a><a href="/house-a024/">黄浦</a><a href="/house-a023/">虹口</a><a href="/house-a031/">青浦</a><a href="/house-a032/">奉贤</a><a href="/house-a035/">金山</a><a href="/house-a026/">杨浦</a><a href="/house-a019/">徐汇</a><a href="/house-a020/">长宁</a><a href="/house-a0996/">崇明</a>
            </dd>
        </dl>
        <dl class="search-list clearfix" id="rentid_D04_02">
            <dt>租金：</dt>
            <dd>
                <a rel="nofollow" href="javascript:void(0);" class="org bold" onclick="clearviewed()">不限</a>
                <a rel="nofollow" href="/house/c20-d21000/">1000元以下</a>
                <a rel="nofollow" href="/house/c21000-d21500/">1000-1500元</a>
                <a rel="nofollow" href="/house/c21500-d22000/">1500-2000元</a>
                <a rel="nofollow" href="/house/c22000-d23000/">2000-3000元</a>
                <a rel="nofollow" href="/house/c23000-d24000/">3000-4000元</a>
                <a rel="nofollow" href="/house/c24000-d25000/">4000-5000元</a>
                <a rel="nofollow" href="/house/c25000-d28000/">5000-8000元</a>
                <a rel="nofollow" href="/house/c28000-d20/">8000元以上</a>
                <input type="text" name="txt" class="inputSmall" value="" id="minprice">-<input type="text" name="txt" class="inputSmall" value="" id="maxprice"><input type="button" name="btu" value="确定" class="btnSmall" id="pricBtn" style="cursor: pointer;">
            </dd>
        </dl>
        <dl class="search-list clearfix" id="rentid_D04_03">
            <dt>户型：</dt>
            <dd>
                <a rel="nofollow" href="javascript:void(0);" class="org bold" onclick="clearviewed()">不限</a>
                <a rel="nofollow" href="/house/g21/">一居</a>
                <a rel="nofollow" href="/house/g22/">二居</a>
                <a rel="nofollow" href="/house/g23/">三居</a>
                <a rel="nofollow" href="/house/g24/">四居</a>
                <a rel="nofollow" href="/house/g299/">四居以上</a>
            </dd>
        </dl>

        <dl class="search-list clearfix" id="rentid_D04_09">
            <dt>方式：</dt>
            <dd>
                <a rel="nofollow" href="javascript:void(0);" class="org bold" onclick="clearviewed()">不限</a>
                <a rel="nofollow" href="#">整租</a>
                <a rel="nofollow" href="/hezu/">合租</a>
            </dd>
        </dl>
        <dl class="search-list clearfix">
            <dt>朝向：</dt>
            <dd>
                <a rel="nofollow" href="/house/" class="org bold">不限</a>
                <a rel="nofollow" href="/house/p21/">南北通透</a>
                <a rel="nofollow" href="/house/p22/">东西向</a>
                <a rel="nofollow" href="/house/p23/">朝南</a>
                <a rel="nofollow" href="/house/p24/">朝北</a>
                <a rel="nofollow" href="/house/p25/">朝东</a>
                <a rel="nofollow" href="/house/p26/">朝西</a>
            </dd>
        </dl>
    </div>
</div>
<%--结束多条件检索--%>
<div class="list_control_bar layui-container">
    <div>
        <div class="list_title layui-pull-left">
            <ul>
                <li><a href="#" >全部房源</a></li>
                <li><a href="#" >优选房源</a></li>
            </ul>
        </div>
        <div class="list_more">
            <ul class="layui-pull-right list-item">
                <li class="click-this"><a href="${pageContext.request.contextPath }/house/findHouseAll.do">默认排序</a></li>
                <li><a href="${pageContext.request.contextPath }/house/priceAsc.do">价格升序</a></li>
                <li><a href="${pageContext.request.contextPath }/house/priceDesc.do">价格降序</a></li>
            </ul>
        </div>
    </div>
</div>
<section class="layui-container">
    <div class="house-detail">
        <ul>
            <c:forEach items="${houseList.list}" var="h">
                <li>
                    <a href="${pageContext.request.contextPath}/house/findHouseById/${h.hid}.do" class="show-image">
                        <img src="${h.image}" width="240px" height="180px">
                    </a>
                    <div class="show-details">
                        <p class="house-title">
                            <a href="${pageContext.request.contextPath}/house/findHouseById/${h.hid}.do">${h.title}</a>
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
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="pageLi" style="margin-top: 30px; text-align: center">
    <ul class="text-center">
        <li><input class="layui-btn layui-btn-normal" type="button" onclick="firstPage('${pageContext.request.contextPath}/house/findHouseAll.do?',$('#searchName').val())" value="首页"/></li>
        <li><input type="button" class="layui-btn layui-btn-normal" onclick="prePage('${pageContext.request.contextPath}/house/findHouseAll.do?',$('#searchName').val())" value="上一页"/></li>
        <li><input type="text" class="layui-input" id="pageNow" value="${houseList.pageNum}" style="text-align:center"/></li>
        <li><input class="layui-btn layui-btn-normal" type="button" value="跳转" onclick="skipPage('${pageContext.request.contextPath}/house/findHouseAll.do?',${houseList.pages},$('#searchName').val())"/></li>
        <li><input type="button" class="layui-btn layui-btn-normal"  value="下一页" onclick="nextPage(${houseList.lastPage},'${pageContext.request.contextPath}/house/findHouseAll.do?',$('#searchName').val())"/></li>
        <li><input type="button" class="layui-btn layui-btn-normal" value="尾页" onclick="lastPage(${houseList.lastPage},'${pageContext.request.contextPath}/house/findHouseAll.do?',$('#searchName').val())"/></li>
    </ul>
</div>
</section>
<footer>
    <p>2020-2021 &copy; 租房信息发布网 懂您的需求 服务于心</p>
</footer>
<script>
    layui.use(['element', 'carousel', 'layer', 'form','laypage'], function () {
        let element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            laypage = layui.laypage,
            form = layui.form;

        let layer_index;
        carousel.render({
            elem: "#bg-item",
            width: "100%",
            height: "800px",
            anim: "fade"
        });
        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['360px', '460px'],
                title: "房屋租赁网",
                closeBtn: 2
            });
        });
        $('.list-item li').click(function () {
            $('.list-item li').removeClass('click-this');
            $(this).addClass('click-this');

        });
        $('.regist-btn').click(function () {
            if ($("input[name='userName']").val() != "" && $("input[name='userPassword']").val() != "" && $("input[name='userPhoneNumber']").val() != "" && $("input[name='userNickName']").val() != "") {
                $.post("${pageContext.request.contextPath}/user/register.do", $('.form').serialize(), function (res) {
                    if (res === 'OK') {
                        layer.close(layer_index);
                        layer.alert("注册成功", {icon: 1, time: 2000});
                        $('.form')[0].reset();
                    } else {
                        layer.msg("注册失败,用户名以存在");
                    }
                })
            } else {
                layer.msg("请正确填写所有表单");
            }
        });
        form.on("submit(login)", function () {
            $.post("${pageContext.request.contextPath}/user/login.do", $('#login').serialize(), function (res) {
                if (res === "OK") {
                    window.location.href = "/house/findHouseAll.do";
                } else {
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });
    });
    function clearviewed(){

    }
</script>
</body>
</html>
