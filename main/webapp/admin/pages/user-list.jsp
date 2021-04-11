<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>用户列表</title>
<meta name="description" content="用户列表">
<meta name="keywords" content="用户列表">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<jsp:include page="linkCss.jsp"></jsp:include>

	<script>
		function delUser(userId){
		    if(confirm("您确认要删除吗")){
		        location.href="${pageContext.request.contextPath}/admin/del/"+userId+".do";
			}
		};
	</script>
	<script src="${pageContext.request.contextPath}/admin/js/index.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				用户管理 <small>全部用户</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/admin/pages/main.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/findByLikeName.do">用户管理</a></li>

				<li class="active">全部用户</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/admin/pages/user-add.jsp'">
											<i class="fa fa-file-o"></i> 新建
										</button>
										
										<button type="button" class="btn btn-default" title="刷新">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm" placeholder="Search by name" id="searchName" value="${searchName}">
									<button type="button" class="form-control btn-default" onclick="findByLikeName()">查找</button>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">用户名</th>
										<th class="sorting_asc sorting_asc_disabled">密码</th>
										<th class="sorting_desc sorting_desc_disabled">联系电话</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userList.list}" var="user" varStatus="counts">
										<tr>
											<td><input name="ids" type="checkbox"></td>
<%--											<td>${counts.count}</td>--%>
											<td>${user.uid}</td>
											<td>${user.username}</td>
											<td>${user.password}</td>
											<td>${user.phone}</td>
<%--											<td class="text-center">--%>
<%--												<c:forEach items="${user.roles}" var="role">--%>
<%--													&nbsp;&nbsp;${role.roleName}--%>
<%--												</c:forEach>--%>
<%--											</td>--%>
											<td class="text-center">
												<a href="javascript:void(0);" onclick="delUser('${user.uid}')" class="btn bg-olive btn-xs">删除</a>
												<a href="javascript:void(0);" onclick="updateUser('${user.uid}')" class="btn bg-olive btn-xs">编辑</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!--数据列表/-->
						<%--分页--%>
							<div class="box-tools text-center">
								<ul class="pagination text-center">
									<li><input class="btn btn-success" type="button" onclick="firstPage('${pageContext.request.contextPath}/admin/findByLikeName.do?',$('#searchName').val())" value="首页"/></li>
<%--									判断是否为第一页，是则不能点击--%>
									<li><input type="button" class="btn btn-success" onclick="prePage('${pageContext.request.contextPath}/admin/findByLikeName.do?',$('#searchName').val())" value="上一页"/></li>
<%--									不是第一页则可以点击--%>
									<li><input type="text" id="pageNow" value="${userList.pageNum}" style="text-align:center"/></li>
									<li><input class="btn btn-success" type="button" value="跳转" onclick="skipPage('${pageContext.request.contextPath}/admin/findByLikeName.do?',${userList.pages},$('#searchName').val())"/></li>
<%--									<c:forEach begin="1" end="${userList.pages}" var="i">--%>
<%--										<li><a href="${pageContext.request.contextPath}/admin/findByLikeName.do?page=${i}&size=${userList.pageSize}&searchName=${searchName}">${i}</a></li>--%>
<%--									</c:forEach>--%>
									<li><input type="button" class="btn btn-success"  value="下一页" onclick="nextPage(${userList.lastPage},'${pageContext.request.contextPath}/admin/findByLikeName.do?',$('#searchName').val())"/></li>
									<li><input type="button" class="btn btn-success" value="尾页" onclick="lastPage(${userList.lastPage},'${pageContext.request.contextPath}/admin/findByLikeName.do?',$('#searchName').val())"/></li>
								</ul>
							</div>
						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->
				</div>

				</section>
				<!-- 正文区域 /-->

			</div>
			<!-- @@close -->
			<!-- 内容区域 /-->

			<!-- 底部导航 -->
			<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Copyright &copy; 2021
			</strong> All rights reserved. </footer>
			<!-- 底部导航 /-->

		</div>
	<jsp:include page="addModel.jsp"></jsp:include>
		<script>
			$(document).ready(function() {
				// 选择框
				$(".select2").select2();

				// WYSIHTML5编辑器
				$(".textarea").wysihtml5({
					locale : 'zh-CN'
				});
			});

			// 设置激活菜单
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if (liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}

			$(document)
					.ready(
							function() {

								// 激活导航位置
								setSidebarActive("admin-datalist");

								// 列表按钮 
								$("#dataList td input[type='checkbox']")
										.iCheck(
												{
													checkboxClass : 'icheckbox_square-blue',
													increaseArea : '20%'
												});
								// 全选操作 
								$("#selall")
										.click(
												function() {
													var clicks = $(this).is(
															':checked');
													if (!clicks) {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck(
																		"uncheck");
													} else {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck("check");
													}
													$(this).data("clicks",
															!clicks);
												});
							});
			/*修改用户信息*/
			function updateUser(id){
				$.ajax({
					method:"get",
					dataType:"json",
					contentType:"application/json;charset=utf-8",
					url:"${pageContext.request.contextPath}/admin/findUserById/"+id+".do",
					success:function(user){
						$("#username").val(user.username);
						$("#password").val(user.password);
						$("#phone").val(user.phone);
						$("#myModalLabel").text("修改用户信息");
						$("#categoryForm").attr("action","${pageContext.request.contextPath}/admin/updateUser.do");
						$("#myModal").modal('show');
					}
				});
			}
			function findByLikeName(){
				window.location.href="${pageContext.request.contextPath}/admin/findByLikeName.do?searchName="+$("#searchName").val();
			}
		</script>

</body>

</html>