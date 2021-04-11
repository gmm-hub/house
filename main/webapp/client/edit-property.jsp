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
      <jsp:include page="header.jsp"></jsp:include>
      <!-- Add Property -->
      <input type="hidden" value="${house.detail}" id="detail">
      <input type="hidden" value="${house.type}" id="type">
      <input type="hidden" value="${house.status}" id="status">
      <input type="hidden" value="${house.orientation}" id="orientation">
      <section class="section-padding pt-0 user-pages-main">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 col-md-12">
                  <form action="${pageContext.request.contextPath}/house/updateHouse/${house.hid}.do" method="post" enctype="multipart/form-data">
                     <div class="card padding-card">
                        <div class="card-body">
                           <h5 class="card-title mb-4">房源基本信息</h5>
                           <div class="form-group">
                              <label>房源标题 <span class="text-danger">*</span></label>
                              <input type="text" class="form-control" placeholder="请输入标题" name="title" value="${house.title}">
                           </div>
                           <div class="form-group">
                              <label>房源描述 <span class="text-danger">*</span></label>
                              <textarea class="form-control" rows="4" name="detail" id="hDetail"></textarea>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>出租类型 <span class="text-danger">*</span></label>
                                 <select class="form-control custom-select" name="type" id="hType">
                                    <option>选择类型</option>
                                    <option value="整租">整租</option>
                                    <option value="合租">合租</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>Status <span class="text-danger">*</span></label>
                                 <select class="form-control custom-select" name="status" id="hStatus">
                                    <option>请选择状态</option>
                                    <option value="0">未租出</option>
                                    <option value="1">已租出</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-4">
                                 <label>地址 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="请输入地址" name="address" value="${house.address}">
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>房型 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="几室几厅" name="model" value="${house.model}">
                              </div>
                              <div class="form-group col-md-4">
                                 <label>价格 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="￥元/月" name="price" value="${house.price}">
                              </div>
                              <div class="form-group col-md-4">
                                 <label>楼层 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="高层/低层/中层" name="floor" value="${house.floor}">
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-4">
                                 <label>朝向 <span class="text-danger">*</span></label>
                                 <select class="form-control custom-select" name="orientation" id="hOrientation">
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
                                 <input type="text" class="form-control" placeholder="平米" name="area" value="${house.area}">
                              </div>
                           </div>
                           <div class="row">
                              <div class="form-group col-md-6">
                                 <label>联系人 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="联系人" name="linkPeople" value="${house.linkPeople}">
                              </div>
                              <div class="form-group col-md-6">
                                 <label>联系电话 <span class="text-danger">*</span></label>
                                 <input type="text" class="form-control" placeholder="联系电话" name="linkPhone" value="${house.linkPhone}">
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
                                    <img id="pic" width="100%" height="100%" src="${house.image}"/>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <button type="submit" class="btn btn-success">修改房源</button>
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
      $(document).ready(function () {
         var detail = $("#detail").val();
         var type = $("#type").val();
         var status = $("#status").val();
         var orientation = $("#orientation").val();
         var releaseTime = $("#releaseTime").val();
         $('#hDetail').val(detail);
         $('#hType').val(type);
         $('#hStatus').val(status);
         $('#hOrientation').val(orientation);
         $('#hReleaseTime').val(releaseTime);
      })
   </script>
   </body>
</html>