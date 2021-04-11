<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Webartinfo">
      <meta name="author" content="Webartinfo">
      <title>租房信息发布</title>
      <!-- Favicon Icon -->
      <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/client/img/favicon.png">
      <!-- Bootstrap core CSS -->
      <link href="${pageContext.request.contextPath}/client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <!-- Material Design Icons -->
      <link href="${pageContext.request.contextPath}/client/vendor/icons/css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
      <!-- Select2 CSS -->
      <link href="${pageContext.request.contextPath}/client/vendor/select2/css/select2-bootstrap.css" />
      <link href="${pageContext.request.contextPath}/client/vendor/select2/css/select2.min.css" rel="stylesheet" />
      <!-- Custom styles for this template -->
      <link href="${pageContext.request.contextPath}/client/css/style.css" rel="stylesheet">
   </head>
   <body>
      <!-- Navbar -->
      <jsp:include page="header.jsp"></jsp:include>
      <!-- End Navbar -->
      <!-- Inner Header -->
      <section class="bg-dark py-5 user-header">
         <div class="container">
            <div class="row align-items-center mt-2 mb-5 pb-4">
               <div class="col">
                  <!-- Heading -->
                  <h1 class="text-white mb-2">
                     添加房源
                  </h1>
               </div>
               <div class="col-auto">
                  <!-- Button -->
                  <button class="btn btn-sm btn-primary" onclick="logout();">
                  登出
                  </button>
               </div>
            </div>
            <!-- / .row -->
         </div>
         <!-- / .container -->
      </section>
      <!-- End Inner Header -->
      <!-- Add Property -->
      <section class="section-padding pt-0 user-pages-main">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-3">
                  <!-- Collapse -->
                  <div class="card padding-card tab-view user-pages-sidebar">
                     <div class="card-body">
                        <!-- Heading -->
                        <h6 class="text-uppercase mt-0 mb-3">
                           用户中心
                        </h6>
                        <ul class="nav">
                           <li class="nav-item">
                              <a class="nav-link" href="user-profile.jsp">基本资料</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="${pageContext.request.contextPath}/user/findUserHouse.do">我发布的房源</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="/evaluate/findUserEvaluate.do">我发表的评价</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link active text-success" href="/client/add-property.jsp">发布房源</a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="col-lg-9 col-md-9">
                  <form action="${pageContext.request.contextPath}/house/addHouse.do" method="post" enctype="multipart/form-data">
                     <div class="card padding-card">
                        <div class="card-body">
                           <h5 class="card-title mb-4">房源基本信息</h5>
                           <div class="form-group">
                              <label>房源标题 <span class="text-danger">*</span></label>
                              <input type="text" class="form-control" placeholder="请输入标题" name="title">
                           </div>
                           <div class="form-group">
                              <label>房源描述 <span class="text-danger">*</span></label>
                              <textarea class="form-control" rows="4" name="detail"></textarea>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>出租类型 <span class="text-danger">*</span></label>
                                 <select class="form-control custom-select" name="type">
                                    <option>选择类型</option>
                                    <option value="整租">整租</option>
                                    <option value="合租">合租</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Status <span class="text-danger">*</span></label>
                                 <select class="form-control custom-select" name="status">
                                    <option>请选择状态</option>
                                    <option value="0">未租出</option>
                                    <option value="1">已租出</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>地址 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="请输入地址" name="address">
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>房型 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="几室几厅" name="model">
                              </div>
                              <div class="form-group col-md-4">
                                 <label>价格 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="￥元/月" name="price">
                              </div>
                              <div class="form-group col-md-4">
                                 <label>楼层 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="高层/低层/中层" name="floor">
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>朝向 <span class="text-danger">*</span></label>
                                 <select class="form-control custom-select" name="orientation">
                                    <option>请选择朝向</option>
                                    <option value="南北">南北</option>
                                    <option value="南">南</option>
                                    <option value="东南">东南</option>
                                    <option value="东">东</option>
                                    <option value="西南">西南</option>
                                    <option value="北">北</option>
                                    <option value="西">西</option>
                                    <option value="东北">东北</option>
                                    <option value="西北">西北</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>面积 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="平米" name="area">
                              </div>
                              <div class="form-group col-md-4">
                                 <label>发布时间 <span class="text-danger">*</span></label>
                                 <input type="date" class="form-control" name="releaseTime">
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-6">
                                 <label>联系人 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="联系人" name="linkPeople">
                              </div>
                              <div class="form-group col-md-6">
                                 <label>联系电话 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="联系电话" name="linkPhone">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="card padding-card">
                        <div class="card-body">
                           <h5 class="card-title mb-4">房源图片</h5>
                           <div class="row">
                              <div class="col-md-4">
                                 <div class="fuzone">
                                    <div class="fu-text">
                                       <span><i class="mdi mdi-image-area"></i> 请选择房源图片</span>
                                    </div>
                                    <input class="upload" type="file" name="file" id="image" onchange="showPreview(this)">
                                 </div>
                              </div>
                              <div class="col-md-4">
                                 <div class="fuzone">
                                    <img id="pic" width="100%" height="100%" />
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
<%--                     <div class="card padding-card">--%>
<%--                        <div class="card-body">--%>
<%--                           <h5 class="card-title mb-4">Property Location</h5>--%>
<%--                           <div class="row">--%>
<%--                              <div class="form-group col-md-4">--%>
<%--                                 <label>Address <span class="text-danger">*</span></label>--%>
<%--                                 <input type="text" class="form-control" placeholder="Enter Address">--%>
<%--                              </div>--%>
<%--                              <div class="form-group col-md-4">--%>
<%--                                 <label>Country<span class="text-danger">*</span></label>--%>
<%--                                 <select class="form-control custom-select">--%>
<%--                                    <option>Select Country</option>--%>
<%--                                    <option>Country 1</option>--%>
<%--                                    <option>Country 2</option>--%>
<%--                                    <option>Country 3</option>--%>
<%--                                 </select>--%>
<%--                              </div>--%>
<%--                              <div class="form-group col-md-4">--%>
<%--                                 <label>City <span class="text-danger">*</span></label>--%>
<%--                                 <input type="text" class="form-control" placeholder="Enter City">--%>
<%--                              </div>--%>
<%--                           </div>--%>
<%--                           <div class="row">--%>
<%--                              <div class="form-group col-md-4">--%>
<%--                                 <label>State <span class="text-danger">*</span></label>--%>
<%--                                 <input type="text" class="form-control" placeholder="Enter State">--%>
<%--                              </div>--%>
<%--                              <div class="form-group col-md-4">--%>
<%--                                 <label>Zip/Postal Code <span class="text-danger">*</span></label>--%>
<%--                                 <input type="text" class="form-control" placeholder="Enter Zip/Postal">--%>
<%--                              </div>--%>
<%--                              <div class="form-group col-md-4">--%>
<%--                                 <label>Neighborhood <span class="text-danger">*</span></label>--%>
<%--                                 <input type="text" class="form-control" placeholder="...">--%>
<%--                              </div>--%>
<%--                           </div>--%>
<%--                           <div class="map" id="wrapper-9cd199b9cc5410cd3b1ad21cab2e54d3">--%>
<%--                              <div id="map-9cd199b9cc5410cd3b1ad21cab2e54d3"></div>--%>
<%--                              <script>(function () {--%>
<%--                                 var setting = {"height":540,"width":803,"zoom":15,"queryString":"Candás, Spain","place_id":"ChIJuXoxw-aANg0RZ1DUQHMSFTM","satellite":false,"centerCoord":[43.59051127662882,-5.768219799999998],"cid":"0x3315127340d45067","lang":"en","cityUrl":"/spain/candas-8349","cityAnchorText":"Map of Candas, Asturias, Spain","id":"map-9cd199b9cc5410cd3b1ad21cab2e54d3","embed_id":"215844"};--%>
<%--                                 var d = document;--%>
<%--                                 var s = d.createElement('script');--%>
<%--                                 s.src = 'https://1map.com/js/script-for-user.js?embed_id=215844';--%>
<%--                                 s.async = true;--%>
<%--                                 s.onload = function (e) {--%>
<%--                                   window.OneMap.initMap(setting)--%>
<%--                                 };--%>
<%--                                 var to = d.getElementsByTagName('script')[0];--%>
<%--                                 to.parentNode.insertBefore(s, to);--%>
<%--                                 })();--%>
<%--                              </script><a href="https://1map.com/map-embed">1 Map</a>--%>
<%--                           </div>--%>
<%--                        </div>--%>
<%--                     </div>--%>
                     <button type="submit" class="btn btn-success">发布房源</button>
                  </form>
               </div>
            </div>
         </div>
      </section>
      <!-- End Add Property -->
      <!-- Copyright -->
      <section class="pt-4 pb-4 text-center">
         <p class="mt-0 mb-0">© Copyright 2021 GMM. All Rights Reserved</p>
         <small class="mt-0 mb-0">
         Made with <i class="mdi mdi-heart text-danger"></i>	by 
         <a class="text-dark" target="_blank" href="http://www.bootstrapmb.com">Webartinfo</a>
         </small>
      </section>
      <!-- End Copyright -->
      <!-- Bootstrap core JavaScript -->
      <script src="${pageContext.request.contextPath}/client/vendor/jquery/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- Contact form JavaScript -->
      <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <script src="${pageContext.request.contextPath}/client/js/jqBootstrapValidation.js"></script>
      <script src="${pageContext.request.contextPath}/client/js/contact_me.js"></script>
      <!-- select2 Js -->
      <script src="${pageContext.request.contextPath}/client/vendor/select2/js/select2.min.js"></script>
      <!-- Custom -->
      <script src="${pageContext.request.contextPath}/client/js/custom.js"></script>
   <script>
      //将文件流以url形式读取，实现图片实时显示：
      function showPreview(source){
         var file = source.files[0];
         if(window.FileReader){
            var fr = new FileReader();
            fr.onloadend = function(e){
               document.getElementById("pic").src=e.target.result;
            };
            fr.readAsDataURL(file);
         }
      }
      function logout() {
         window.location.href="${pageContext.request.contextPath}/user/logout.do";
      }
   </script>
   </body>
</html>