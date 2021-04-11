<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Webartinfo">
      <meta name="author" content="Webartinfo">
      <title>房源列表</title>
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
      <!-- Main Slider With Form -->
      <section class="site-slider">
         <div id="siteslider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#siteslider" data-slide-to="0" class="active"></li>
               <li data-target="#siteslider" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
               <div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/client/img/slider/1.jpg')">
                  <div class="overlay"></div>
               </div>
               <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/client/img/slider/2.jpg')">
                  <div class="overlay"></div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#siteslider" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#siteslider" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
         </div>
         <div class="slider-form inner-page-form">
            <div class="container">
               <h1 class="text-center mb-5">发现你最喜爱的房子</h1>
               <input type="hidden" value="${query.houseType}" id="name">
               <form action="/house/findHouseList.do" method="post">
                  <div class="row no-gutters">
                     <div class="col-md-3">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-map-marker-multiple"></i></div>
                           <input class="form-control" placeholder="请输入关键字" type="text" name="searchName" value="${query.searchName}">
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-google-maps"></i></div>
                           <select class="form-control select2 no-radius" name="houseType" id="hType">
                              <option value="">类型</option>
                              <option value="整租">整租</option>
                              <option value="合租">合租</option>
                           </select>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-magnify-minus-outline"></i></div>
                           <input class="form-control" placeholder="最低租金" type="text" name="minPrice" value="${query.minPrice}">
                        </div>
                     </div>
                     <div class="col-md-3">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-magnify-minus-outline"></i></div>
                           <input class="form-control" placeholder="最高租金" type="text" name="maxPrice" value="${query.maxPrice}">
                        </div>
                     </div>
                     <div class="col-md-2">
                        <button type="submit" class="btn btn-success btn-block no-radius font-weight-bold">查找</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </section>
      <!-- End Main Slider With Form -->
      <!-- Properties List -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-4">
                  <div class="card sidebar-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">房源状态</h5>
                        <ul class="sidebar-card-list">
                           <li><a href="#"><i class="mdi mdi-chevron-right"></i> 未出租 <span class="sidebar-badge">${unSaleCount}</span></a></li>
                           <li><a href="#"><i class="mdi mdi-chevron-right"></i> 已出租 <span class="sidebar-badge">${saleCount}</span></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="col-lg-8 col-md-8">
                  <div class="site_top_filter row">
                     <div class="col-lg-12 col-md-12 sort-by-btn float-right">
                        <div class="view-mode float-right">
                           <a href="properties-grid.html"><i class="mdi mdi-grid"></i></a><a class="active" href="properties-list.jsp"><i class="mdi mdi-format-list-bulleted"></i></a>
                        </div>
                        <div class="dropdown float-right">
                           <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <i class="mdi mdi-filter"></i> Sort by</button>
                           <div class="dropdown-menu float-right" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" href="/house/releaseTime.do"><i class="mdi mdi-chevron-right"></i> 发布时间 </a>
                              <a class="dropdown-item" href="/house/price1.do"><i class="mdi mdi-chevron-right"></i> 价格: 低 到 高 </a>
                              <a class="dropdown-item" href="/house/price2.do"><i class="mdi mdi-chevron-right"></i> 价格: 高 到 低 </a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <c:forEach items="${houseList.list}" var="house">
                     <div class="col-lg-12 col-md-12">
                        <div class="card card-list card-list-view">
                           <a href="${pageContext.request.contextPath}/house/findHouseById/${house.hid}.do">
                              <div class="row no-gutters">
                                 <div class="col-lg-5 col-md-5">
                                    <c:if test="${house.status==0}">
                                       <span class="badge badge-success">未租出</span>
                                    </c:if>
                                    <c:if test="${house.status==1}">
                                       <span class="badge badge-danger">已租出</span>
                                    </c:if>
                                    <img class="card-img-top" src="${house.image}" alt="Card image cap">
                                 </div>
                                 <div class="col-lg-7 col-md-7">
                                    <div class="card-body">
                                       <h5 class="card-title">${house.title}</h5>
                                       <h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i> ${house.address}</h6>
                                       <h2 class="text-success mb-0 mt-3">
                                          ￥${house.price} <small>元/月</small>
                                       </h2>
                                    </div>
                                    <div class="card-footer">
                                       <span><i class="mdi mdi-sofa"></i> 出租类型 : <strong>${house.type}</strong></span>
                                       <span><i class="mdi mdi-scale-bathroom"></i> 房型 : <strong>${house.model}</strong></span>
                                       <span><i class="mdi mdi-move-resize-variant"></i> 面积 : <strong>${house.area}m<sup>2</sup></strong></span>
                                    </div>
                                 </div>
                              </div>
                           </a>
                        </div>
                     </div>
                     </c:forEach>
                  </div>
                  <nav class="mt-5">
                     <ul class="pagination justify-content-center">
                        <li class="page-item">
                           <a class="page-link" href="${pageContext.request.contextPath}/house/findHouseList.do?page=${houseList.prePage}&size=${houseList.pageSize}" tabindex="-1"><i class="mdi mdi-chevron-left"></i></a>
                        </li>
                        <c:forEach begin="1" end="${houseList.pages}" var="i">
                        <li class="page-item" onclick="addCss();"><a class="page-link" href="${pageContext.request.contextPath}/house/findHouseList.do?page=${i}&size=${houseList.pageSize}">${i}</a></li>
                        </c:forEach>
                        <li class="page-item">
                           <a class="page-link" href="${pageContext.request.contextPath}/house/findHouseList.do?page=${houseList.nextPage}&size=${houseList.pageSize}"><i class="mdi mdi-chevron-right"></i></a>
                        </li>
                     </ul>
                  </nav>
               </div>
            </div>
         </div>
      </section>
      <!-- End Properties List -->
      <!-- Copyright -->
      <section class="pt-4 pb-4">
         <div class="container">
            <div class="row align-items-center text-center text-md-left">
               <div class="col-md-6">
                  <p class="mt-0 mb-0">© Copyright 2020 GMM. All Rights Reserved</p>
               </div>
               <div class="col-md-6 text-center text-md-right">
                  <p class="mt-0 mb-0">
                     Made with <i class="mdi mdi-heart text-danger"></i> by
                     <a class="text-dark font-weight-bold" target="_blank" href="http://www.bootstrapmb.com">Webartinfo</a>
                  </p>
               </div>
            </div>
         </div>
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
      $(document).ready(function () {
         var se = $("#name").val();
         $('#hType').val(se);
      })
      function addCss() {
         $(this).addClass("active");
      }
   </script>
   </body>
</html>