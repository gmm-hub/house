<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Webartinfo">
      <meta name="author" content="Webartinfo">
      <title>我发表的评价</title>
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
                     我发表的评价
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
      <!-- My Properties -->
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
                              <a class="nav-link" href="/client/user-profile.jsp">基本资料</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="/user/findUserHouse.do">我发布的房源</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link active text-success" href="${pageContext.request.contextPath}/evaluate/findUserEvaluate.do">我发表的评价</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="/client/add-property.jsp">发布房源</a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="col-lg-9 col-md-9">
                  <div class="card padding-card reviews-card">
                     <div class="card-body">
                        <h5 class="card-title mb-4">我的评价</h5>
                        <c:forEach items="${evaluateList}" var="evaluate">
                        <div class="media mb-4">
                           <div class="media-body">
                              <h5 class="mt-0">${loginUser.username} <small>${evaluate.create_time}</small>
                                 <span class="star-rating float-right">
                                    <c:forEach begin="1" end="${evaluate.grade}">
                                    <i class="mdi mdi-star text-warning"></i>
                                    </c:forEach>
                                 <small class="text-success">${evaluate.grade}</small>
                                    <button class="btn btn-danger" onclick="delEvaluate(${evaluate.eid})">删除</button>
                                 </span>
                              </h5>
                              <p>${evaluate.content}</p>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End My Properties -->
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
      <script src="vendor/jquery/jquery.min.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- Contact form JavaScript -->
      <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <script src="js/jqBootstrapValidation.js"></script>
      <script src="js/contact_me.js"></script>
      <!-- select2 Js -->
      <script src="vendor/select2/js/select2.min.js"></script>
      <!-- Custom -->
      <script src="js/custom.js"></script>
   <script>
      function logout(){
         window.location.href="${pageContext.request.contextPath}/user/logout.do";
      }
      function delEvaluate(userId){
         if(confirm("您确认要删除吗")){
            location.href="${pageContext.request.contextPath}/evaluate/delEvaluate/"+userId+".do";
         }
      }
   </script>
   </body>
</html>