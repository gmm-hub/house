<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Webartinfo">
      <meta name="author" content="Webartinfo">
      <title>房源详情</title>
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
      <!-- Property Single Slider header -->
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
         <div class="property-single-title property-single-title-gallery">
            <div class="container">
               <div class="row">
                  <div class="col-lg-8 col-md-8">
                     <h1>${house.title}</h1>
                     <h6 class="text-dark"><i class="mdi mdi-home-map-marker"></i> ${house.address}</h6>
                  </div>
                  <div class="col-lg-4 col-md-4 text-right">
                     <h2 class="text-success">￥${house.price} <small>/月</small></h2>
                  </div>
               </div>
               <hr>
            </div>
         </div>
      </section>
      <!-- End Property Single Slider header -->
      <!-- Property Single Slider -->
      <section class="section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 col-md-8">
                  <div class="card">
                     <div class="card-body site-slider pl-0 pr-0 pt-0 pb-0">
                        <div id="sitesliderz" class="carousel slide" data-ride="carousel">
                           <ol class="carousel-indicators">
                              <li data-target="#sitesliderz" data-slide-to="0" class="active"></li>
                              <li data-target="#sitesliderz" data-slide-to="1"></li>
                           </ol>
                           <div class="carousel-inner" role="listbox">
                              <div class="carousel-item active rounded" style="background-image: url('${house.image}')"></div>
                           </div>
                           <a class="carousel-control-prev" href="#sitesliderz" role="button" data-slide="prev">
                              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                           </a>
                           <a class="carousel-control-next" href="#sitesliderz" role="button" data-slide="next">
                              <span class="carousel-control-next-icon" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-4 col-md-4">
                        <div class="list-icon">
                           <i class="mdi mdi-move-resize-variant"></i>
                           <strong>面积:</strong>
                           <p class="mb-0">${house.area}m<sup>2</sup></p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                        <div class="list-icon">
                           <i class="mdi mdi-sofa"></i>
                           <strong>出租方式:</strong>
                           <p class="mb-0">${house.type}</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                        <div class="list-icon">
                           <i class="mdi mdi-hot-tub"></i>
                           <strong>朝向:</strong>
                           <p class="mb-0">${house.orientation}</p>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-4 col-md-4">
                        <div class="list-icon">
                           <i class="mdi mdi-garage"></i>
                           <strong>房型:</strong>
                           <p class="mb-0">${house.model}</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                        <div class="list-icon">
                           <i class="mdi mdi-floor-plan"></i>
                           <strong>楼层:</strong>
                           <p class="mb-0">${house.floor}</p>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                        <div class="list-icon">
                           <i class="mdi mdi-car-convertible"></i>
                           <strong>装修:</strong>
                           <p class="mb-0">中装修</p>
                        </div>
                     </div>
                  </div>
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-3">房源描述</h5>
                        <p>${house.detail}</p>
                     </div>
                  </div>
<%--                  <div class="card padding-card">--%>
<%--                     <div class="card-body">--%>
<%--                        <h5 class="card-title mb-3">房源位置</h5>--%>
<%--                        <div class="row mb-3">--%>
<%--                           <div class="col-lg-6 col-md-6">--%>
<%--                              <p><strong class="text-dark">地址 :</strong> ${house.address}</p>--%>
<%--                              <p><strong class="text-dark">State :</strong> Newcastle</p>--%>
<%--                           </div>--%>
<%--                           <div class="col-lg-6 col-md-6">--%>
<%--                              <p><strong class="text-dark">City :</strong> Sydney</p>--%>
<%--                              <p><strong class="text-dark">Zip/Postal Code  :</strong> 54330</p>--%>
<%--                           </div>--%>
<%--                        </div>--%>
<%--                        <div class="map" id="wrapper-9cd199b9cc5410cd3b1ad21cab2e54d3">--%>
<%--                           <div id="map-9cd199b9cc5410cd3b1ad21cab2e54d3"></div>--%>
<%--                           <script>(function () {--%>
<%--                              var setting = {"height":540,"width":803,"zoom":15,"queryString":"Candás, Spain","place_id":"ChIJuXoxw-aANg0RZ1DUQHMSFTM","satellite":false,"centerCoord":[43.59051127662882,-5.768219799999998],"cid":"0x3315127340d45067","lang":"en","cityUrl":"/spain/candas-8349","cityAnchorText":"Map of Candas, Asturias, Spain","id":"map-9cd199b9cc5410cd3b1ad21cab2e54d3","embed_id":"215844"};--%>
<%--                              var d = document;--%>
<%--                              var s = d.createElement('script');--%>
<%--                              s.src = 'https://1map.com/js/script-for-user.js?embed_id=215844';--%>
<%--                              s.async = true;--%>
<%--                              s.onload = function (e) {--%>
<%--                                window.OneMap.initMap(setting)--%>
<%--                              };--%>
<%--                              var to = d.getElementsByTagName('script')[0];--%>
<%--                              to.parentNode.insertBefore(s, to);--%>
<%--                              })();--%>
<%--                           </script><a href="https://1map.com/map-embed">1 Map</a>--%>
<%--                        </div>--%>
<%--                     </div>--%>
<%--                  </div>--%>
                  <div class="card padding-card reviews-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">评价</h5>
                        <c:forEach items="${evaluate}" var="e">
                        <div class="media mb-4">
                           <div class="media-body">
                              <h5 class="mt-0">${e.user.username} <small>${e.create_time}</small>
                                 <span class="star-rating float-right">
                                    <c:forEach var="i" begin="1" end="${e.grade}">
                                    <i class="mdi mdi-star text-warning"></i>
                                    </c:forEach>
                                    <small class="text-success">${e.grade}</small>
                                 </span>
                              </h5>
                              <p>${e.content}</p>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
                  <div class="card padding-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">发表评价</h5>
                        <form name="sentMessage" method="post" action="/evaluate/addEvaluate/${house.hid}.do">
                           <div class="row">
                              <div class="control-group form-group col-lg-4 col-md-4">
                                 <div class="controls">
                                    <label>Rating <span class="text-danger">*</span></label>
                                    <select class="form-control custom-select" name="grade">
                                       <option value="1">1 Star</option>
                                       <option value="2">2 Star</option>
                                       <option value="3">3 Star</option>
                                       <option value="4">4 Star</option>
                                       <option value="5">5 Star</option>
                                    </select>
                                 </div>
                              </div>
                           </div>
                           <div class="control-group form-group">
                              <div class="controls">
                                 <label>评价内容 <span class="text-danger">*</span></label>
                                 <textarea rows="10" cols="100" class="form-control" placeholder="请发表你对房源的看法" name="content"></textarea>
                              </div>
                           </div>
                           <button type="submit" class="btn btn-success">提交评价</button>
                        </form>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-4">
                  <div class="card sidebar-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">联系人</h5>
                        <div id="featured-properties">
                           <div class="carousel-inner">
                              <div class="carousel-item active">
                                 <div class="card card-list">
                                       <div class="card-body pb-0">
                                          <h5 class="card-title mb-4">${house.linkPeople}</h5>
                                          <h6 class="card-subtitle mb-3 text-muted"><i class="mdi mdi-phone"></i> ${house.linkPhone}</h6>
                                       </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Property Single Slider -->
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