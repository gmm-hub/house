<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- Global site tag (gtag.js) - Google Analytics -->
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
         <div class="slider-form">
            <div class="container">
               <div class="text-center mb-5">
                  <h6 class="subtitle mb-1 mt-0 text-shadow text-dark">为年轻人提供优质房源
                  </h6>
                  <h1 class="display-4 mt-0 font-weight-bold text-shadow">给你舒适温馨的家
                  </h1>
               </div>
               <form action="/house/findHouseList.do" method="post">
                  <div class="row no-gutters">
                     <div class="col-md-3">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-map-marker-multiple"></i></div>
                           <input class="form-control" placeholder="请输入关键字" type="text" name="searchName">
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-google-maps"></i></div>
                           <select class="form-control select2 no-radius" name="houseType">
                              <option value="">类型</option>
                              <option value="整租">整租</option>
                              <option value="合租">合租</option>
                           </select>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-magnify-minus-outline"></i></div>
                           <input class="form-control" placeholder="最低租金" type="text" name="minPrice">
                        </div>
                     </div>
                     <div class="col-md-3">
                        <div class="input-group">
                           <div class="input-group-addon"><i class="mdi mdi-magnify-minus-outline"></i></div>
                           <input class="form-control" placeholder="最高租金" type="text" name="maxPrice">
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
         <div class="section-title text-center mb-5">
            <h2>新房推荐</h2>
         </div>
         <div class="container">
            <div class="row">
               <c:forEach items="${houseList.list}" var="house">
               <div class="col-lg-4 col-md-4">
                  <div class="card card-list">
                     <a href="${pageContext.request.contextPath}/house/findHouseById/${house.hid}.do">
                        <img class="card-img-top" src="${house.image}" alt="Card image cap" width="350px" height="242px">
                        <div class="card-body">
                           <h5 class="card-title">${house.title}</h5>
                           <h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i>
                              ${house.address}
                           </h6>
                           <h2 class="text-success mb-0 mt-3">
                              ￥${house.price} <small>元/月</small>
                           </h2>
                        </div>
                        <div class="card-footer">
                           <span><i class="mdi mdi-sofa"></i> 类型 : <strong>${house.type}</strong></span>
                           <span><i class="mdi mdi-scale-bathroom"></i> 房型: <strong>${house.model}</strong></span>
                           <span><i class="mdi mdi-move-resize-variant"></i> 面积 : <strong>${house.area} m<sup>2</sup></strong></span>
                        </div>
                     </a>
                  </div>
               </div>
               </c:forEach>
            </div>
         </div>
      </section>
      <section class="section-padding">
         <div class="section-title text-center mb-5">
            <h2>优质房源推荐</h2>
         </div>
         <div class="container">
            <div class="row">
               <c:forEach items="${gradeList.list}" var="house">
                  <div class="col-lg-4 col-md-4">
                     <div class="card card-list">
                        <a href="${pageContext.request.contextPath}/house/findHouseById/${house.hid}.do">
                           <img class="card-img-top" src="${house.image}" alt="Card image cap" width="350px" height="242px">
                           <div class="card-body">
                              <h5 class="card-title">${house.title}</h5>
                              <h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i>
                                    ${house.address}
                              </h6>
                              <h2 class="text-success mb-0 mt-3">
                                 ￥${house.price} <small>元/月</small>
                              </h2>
                           </div>
                           <div class="card-footer">
                              <span><i class="mdi mdi-sofa"></i> 类型 : <strong>${house.type}</strong></span>
                              <span><i class="mdi mdi-scale-bathroom"></i> 房型: <strong>${house.model}</strong></span>
                              <span><i class="mdi mdi-move-resize-variant"></i> 面积 : <strong>${house.area} m<sup>2</sup></strong></span>
                           </div>
                        </a>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </section>
      <!-- End Properties List -->
      <!-- Copyright -->
      <section class="pt-4 pb-4">
         <div class="container">
            <div class="row align-items-center text-center text-md-center">
               <div class="col-md-12">
                  <p class="mt-0 mb-0">© Copyright 2021 GMM. All Rights Reserved</p>
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
   </body>
</html>