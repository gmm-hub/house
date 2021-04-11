<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>房源列表</title>
<meta name="description" content="房源列表">
<meta name="keywords" content="房源列表">

<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<jsp:include page="linkCss.jsp"></jsp:include>
	<script>
		function delHouse(userId){
			if(confirm("您确认要下架吗")){
				location.href="${pageContext.request.contextPath}/admin/delHouse/"+userId+".do";
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
				房源管理 <small>全部房源</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/admin/pages/main.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/houseListAll.do">房源管理</a></li>

				<li class="active">全部房源</li>
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
										<button type="button" class="btn btn-default" title="新建" onclick="addHouse()">
											<i class="fa fa-file-o"></i> 新建
										</button>
										
										<button type="button" class="btn btn-default" title="刷新" onclick="Location.href='${pageContext.request.contextPath}/admin/houseListAll.do'">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm" placeholder="搜索" id="searchName" value="${searchName}">
									<button type="button" class="form-control btn-default" onclick="findByLikeName()">查找</button>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting">序号</th>
										<th class="sorting">房屋标题</th>
										<th class="sorting">房型</th>
										<th class="sorting">房屋面积</th>
										<th class="sorting">房屋出租方式</th>
										<th class="sorting">房屋价格</th>
										<th class="sorting">房屋地址</th>
										<th class="sorting">主要图片</th>
										<th class="sorting">房屋朝向</th>
										<th class="sorting">发布时间</th>
										<th class="sorting">楼层</th>
										<th class="sorting">房屋发布者</th>
										<th class="sorting">联系电话</th>
										<th class="sorting">状态</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${houseList.list}" var="house" varStatus="counts">
									<tr>
										<td><input name="ids" type="checkbox"></td>
										<td>${counts.count}</td>
										<td>${house.title}</td>
										<td>${house.model}</td>
										<td>${house.area}</td>
										<td>${house.type}</td>
										<td>${house.price}</td>
										<td>${house.address}</td>
										<td>
											<c:if test="${house.image!=null&&house.image!=''}">
											<img src="${pageContext.request.contextPath}${house.image}" alt="图片" width="64px" height="auto">
											</c:if>
										</td>
										<td>${house.orientation}</td>
										<td>${house.releaseTime}</td>
										<td>${house.floor}</td>
										<td>${house.linkPeople}</td>
										<td>${house.linkPhone}</td>
										<td><c:if test="${house.status==0}">
											未出租
										</c:if>
										<c:if test="${house.status==1}">
											已出租
										</c:if> </td>
										<td class="text-center">
											<a href="javascript:void(0);" onclick="delHouse('${house.hid}')" class="btn bg-olive btn-xs">下架</a>
											<a href="javascript:void(0);" onclick="updateHouse('${house.hid}')" class="btn bg-olive btn-xs">编辑</a>
										</td>
									</tr>
								</c:forEach>
								</tbody>

							</table>
							<!--数据列表/-->
							<%--分页--%>
							<div class="box-tools text-center">
								<ul class="pagination text-center">
									<li><input class="btn btn-success" type="button" onclick="firstPage('${pageContext.request.contextPath}/admin/houseListAll.do?',$('#searchName').val())" value="首页"/></li>
									<%--									判断是否为第一页，是则不能点击--%>
									<li><input type="button" class="btn btn-success" onclick="prePage('${pageContext.request.contextPath}/admin/houseListAll.do?',$('#searchName').val())" value="上一页"/></li>
									<%--									不是第一页则可以点击--%>
									<li><input type="text" id="pageNow" value="${houseList.pageNum}" style="text-align:center"/></li>
									<li><input class="btn btn-success" type="button" value="跳转" onclick="skipPage('${pageContext.request.contextPath}/admin/houseListAll.do?',${houseList.pages},$('#searchName').val())"/></li>
									<%--									<c:forEach begin="1" end="${userList.pages}" var="i">--%>
									<%--										<li><a href="${pageContext.request.contextPath}/admin/findByLikeName.do?page=${i}&size=${userList.pageSize}&searchName=${searchName}">${i}</a></li>--%>
									<%--									</c:forEach>--%>
									<li><input type="button" class="btn btn-success"  value="下一页" onclick="nextPage(${houseList.lastPage},'${pageContext.request.contextPath}/admin/houseListAll.do?',$('#searchName').val())"/></li>
									<li><input type="button" class="btn btn-success" value="尾页" onclick="lastPage(${houseList.lastPage},'${pageContext.request.contextPath}/admin/houseListAll.do?',$('#searchName').val())"/></li>
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
	<jsp:include page="house-add.jsp"></jsp:include>
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
			/*添加房源*/
			function addHouse(){
				$("#title").val("");
				$("#model").val("");
				$("#area").val("");
				$("#type").val("");
				$("#price").val("");
				$("#address").val("");
				$("#pic").attr("src","");
				$("#orientation").val("");
				$("#releaseTime").val("");
				$("#floor").val("");
				$("#detail").val("");
				$("#linkPeople").val("");
				$("#linkPhone").val("");
				$("#myModalLabel").text("添加房源");
				$("#houseForm").attr("action","${pageContext.request.contextPath}/admin/addHouse.do");
				$("#myModal").modal("show");
			}
			/* 重写提交方法 */
			$("#houseForm").on("submit",function(){
				if($("#pic").attr("src") == ""){
					alert("请给商品上传图片");
					return false;
				}
				return true;
			});

			/*修改房源*/
			function updateHouse(id){
				$.ajax({
					method:"get",
					dataType:"json",
					contentType:"application/json;charset=utf-8",
					url:"${pageContext.request.contextPath}/admin/findHouseById/"+id+".do",
					success:function(house){
						var hid = house.hid;
					        // $("#hid").val(house.hid);
							$("#title").val(house.title);
							$("#model").val(house.model);
							$("#area").val(house.area);
							$("#type").val(house.type);
							$("#price").val(house.price);
							$("#address").val(house.address);
							$("#pic").attr("src","${pageContext.request.contextPath}"+house.image);
							$("#orientation").val(house.orientation);
							$("#releaseTime").val(house.releaseTime);
							$("#floor").val(house.floor);
							$("#detail").val(house.detail);
							$("#linkPeople").val(house.linkPeople);
							$("#linkPhone").val(house.linkPhone);
						$("#myModalLabel").text("更新房源");
						$("#houseForm").attr("action","${pageContext.request.contextPath}/admin/updateHouse/"+hid+".do");
						$("#myModal").modal("show");
					}
				});
			}
			/*通过名称模糊查询*/
			function findByLikeName(){
				window.location.href="${pageContext.request.contextPath}/admin/houseListAll.do?searchName="+$("#searchName").val();
			}
		</script>
</body>

</html>