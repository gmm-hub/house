<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/details.css">
    <script src="${pageContext.request.contextPath}/client/js/jquery.min.js"></script>
</head>
<body>
<header>
    <div class="layui-header title">
        <div class="layui-container">
            <c:if test="${not empty loginUser }">
                <div class="personalCenter layui-pull-right">
                    <span>${loginUser.username}</span>
                    <a href="${pageContext.request.contextPath}/user/logout.do" style="color:#fff">登出</a>
                    <a href="${pageContext.request.contextPath}/user/home.html" target="_blank" style="color:#fff">
                        <i class="layui-icon layui-icon-tree"></i> 个人中心</a>
                </div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i class="layui-icon layui-icon-tree"></i> 登录 - 注册</div>
            </c:if>
        </div>
    </div>
    <div class="details-head">
        <!-- title -->
        <div class="title-wrapper">
            <div class="left-con">
                <h2 class="house-title">${house.title}</h2>
                <p class="tags">
                    <span>户型方正，采光好，格局好。</span>
                </p>
            </div>
        </div>
    </div>
</header>

<section class="layui-container wrapper">
    <p class="breadcrumb">
        <span class="layui-breadcrumb" lay-separator=">">
          <a href="${pageContext.request.contextPath}/house/findHouseAll.do">首页</a>
          <a href="">房屋详情</a>
        </span>
    </p>
    <div class="carousel-image layui-pull-left layui-col-md7">
        <div class="layui-carousel" id="details-image">
            <div carousel-item style="float: left;">
                    <div style="background: url('${house.image}')no-repeat center/cover"></div>
            </div>
        </div>
    </div>
    <div class="details-info layui-pull-right layui-col-md5 ">
        <div class="show-price" style="color: red">
            <span class="sale-price">${house.price }</span>
            <span class="sale-unit">元/月</span>
            <span class="area">押一付三</span>
        </div>
        <hr>
        <div class="house-model">
            <ul>
                <li>
                    <p>${house.type }</p>
                    <span>出租方式</span>
                </li>
                <li>
                    <p>${house.model }</p>
                    <span>户型</span>
                </li>
                <li>
                    <p>${house.area}平米</p>
                    <span>建筑面积</span>
                </li>
            </ul>
            <ul>
                <li>
                    <p>${house.orientation}</p>
                    <span>朝向</span>
                </li>
                <li>
                    <p>${house.floor}</p>
                    <span>楼层</span>
                </li>
                <li>
                    <p>精装修</p>
                    <span>装修</span>
                </li>
            </ul>
        </div>
        <hr>
        <div class="show-house-name">
            <p><span class="field">小区地址：</span><span class="name">${house.address }</span></p>
            <p><span class="field">联系人：</span><span class="name">${house.linkPeople}</span></p>
            <p><span class="field">联系电话：</span><span class="name">${house.linkPhone }</span></p>
        </div>
    </div>
    <div class="anchor-title">
        <h3>房屋配置</h3>
    </div>
    <div class="household-appliances">
        <ul>
            <li>
                <i class="iconfont icon-chuang"></i>
                <span>床</span>
            </li>
            <li>
                <i class="iconfont icon-kongtiao"></i>
                <span>空调</span>
            </li>
            <li>
                <i class="iconfont icon-yigui"></i>
                <span>衣柜</span>
            </li>
            <li>
                <i class="iconfont icon-iconyihuifu-"></i>
                <span>桌椅</span>
            </li>
            <li>
                <i class="iconfont icon-xiyiji"></i>
                <span>洗衣机</span>
            </li>
            <li>
                <i class="iconfont icon-shafa"></i>
                <span>沙发</span>
            </li>
            <li>
                <i class="iconfont icon-xiaodugui"></i>
                <span>消毒柜</span>
            </li>
            <li>
                <i class="iconfont icon-weibolu"></i>
                <span>微波炉</span>
            </li>
            <li>
                <i class="iconfont icon-chouyouyanji"></i>
                <span>抽油烟机</span>
            </li>
            <li>
                <i class="iconfont icon-dianshi"></i>
                <span>电视</span>
            </li>
            <li>
                <i class="iconfont icon-meiqitianranqi"></i>
                <span>天然气</span>
            </li>
            <li>
                <i class="iconfont icon-kuandai"></i>
                <span>宽带</span>
            </li>
            <li>
                <i class="iconfont icon-reshuiqianzhuang"></i>
                <span>热水器</span>
            </li>
            <li>
                <i class="iconfont icon-bingxiang"></i>
                <span>冰箱</span>
            </li>
        </ul>
    </div>
    <div>
        <h2>房源描述</h2>
        <hr class="layui-bg-red">
    </div>
    <div>
        <div class="content" style="font-size: 16px">
            <span>${house.detail}</span>
        </div>
    </div>
    <div>
    <h2>房源评价</h2>
        <hr class="layui-bg-red">
    </div>
    <div>
        <form method="post" action="">
            <div>
                <span>房屋信息真实度</span>
                <div id="test2"></div>
            </div>
            <div>
                <textarea id="content" name="content" placeholder="请发表你对房子的看法" style="margin: 0px; width: 1117px; height: 149px;"></textarea>
            </div>
            <div style="text-align: center"><input type="button" value="提交评论" style="
            width: 110px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: #df2f30;
            cursor: pointer;
            border-radius: 2px;
            font-size: 16px;
            color: #fff;" onclick="addEvaluate(${house.hid},${loginUser.uid},$('#content').val(),$('#grade').val());"/></div>
        </form>
    </div>
    <div><h2>所有评价</h2></div>
    <hr class="layui-bg-red">
    <div class="layui-col-md12">
        <c:forEach items="${evaluate}" var="e">
        <div class="layui-card">
            <div class="layui-card-header">${e.user.username}</div>
            <div class="layui-card-body">
                ${e.content}
            </div>
        </div>
        </c:forEach>
    </div>
    <div><input type="text" name="grade" class="layui-hide" id="grade"/></div>
</section>


<footer>
    <p>2020-2021 &copy; 租房信息发布网 懂您的需求 服务于心</p>
</footer>
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
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius" lay-submit lay-filter="login">立即登录</button>
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
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="password" required lay-verify="required"
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
<script src="${pageContext.request.contextPath}/client/layui/layui.js"></script>
<script>
    layui.use(['element', 'carousel', 'layer', 'form','rate'], function () {
        let carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            rate = layui.rate,
            form = layui.form;

        let layer_index;
        carousel.render({
            elem: "#details-image",
            width: "100%",
            height: "400px",
            anim: "default"
        });
        rate.render({
            elem:'#test2',
            value:0,
            text:true,
            theme: '#FE0000',
            setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                }
                this.span.text(arrs[value] || ( value + "星"));
            },
            choose:function (value) {
                $('#grade').val(value);
            }
        });

        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['360px', '460px'],
                title: "房屋租赁",
                closeBtn: 2
            });
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
                layer.msg("请填写所有表单");
            }
        });
        form.on("submit(login)", function () {
            $.post("${pageContext.request.contextPath}/user/login.do", $('#login').serialize(), function (res) {
                if (res === "OK") {
                    window.location.reload();
                } else {
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });
    });
    function addEvaluate(hid,uid,content,grade){
        $.ajax({
            method:"post",
            dataType:"json",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({
                'hid':hid,
                'uid':uid,
                'content':content,
                'grade':grade
            }),
            url:"${pageContext.request.contextPath}/evaluate/addEvaluate.do",
            success:function (msg) {
                alert(msg);
                window.location.href = window.location.href;
            }
        });
    }

</script>
</body>
</html>
