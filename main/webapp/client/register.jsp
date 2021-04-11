<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <head>
      <!-- Global site tag (gtag.js) - Google Analytics -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Webartinfo">
      <meta name="author" content="Webartinfo">
      <title>Register</title>
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
      <!-- Register -->
      <section class="hv-100">
         <div class="container">
            <div class="row align-items-center hv-100">
               <div class="col-lg-5 col-md-5 mx-auto">
                  <div class="card padding-card mb-0">
                     <div class="card-body">
                        <h5 class="card-title mb-4">注册用户</h5>
                        <form action="${pageContext.request.contextPath}/user/register.do" method="post">
                           <div class="form-group">
                              <label>用户名 <span class="text-danger">*</span></label>
                              <input type="text" name="username" class="form-control" placeholder="请输入用户名" onchange="checkName();">
                              <span id="msg"></span>
                           </div>
                           <div class="form-group">
                              <label>密码 <span class="text-danger">*</span></label>
                              <input type="password" name="password" class="form-control" placeholder="请输入密码">
                           </div>
                           <div class="form-group">
                              <label>手机号 <span class="text-danger">*</span></label>
                              <input type="text" name="phone" class="form-control" placeholder="请输入手机号">
                           </div>
                           <button type="submit" class="btn btn-success btn-block">注册</button>
                        </form>
                        <div class="mt-4 text-center">
                           已有账号 - <a href="${pageContext.request.contextPath}/client/login.jsp">Login</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Register -->
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
         function checkName() {
            var username = $('#username').val();
            $.ajax({
               url:"${pageContext.request.contextPath}/user/check.do",
               method:"post",
               dataType:"json",
               contentType:"application/json;charset=utf-8",
               data:{
                  'username':username
               },
               success:function (res) {
                  $('#msg').text(res)
               }
            })
         }
      </script>
   </body>
</html>