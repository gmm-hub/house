<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ page import="java.net.URLDecoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <head>
      <!-- Global site tag (gtag.js) - Google Analytics -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="Webartinfo">
      <meta name="author" content="Webartinfo">
      <title>Login</title>
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
   <%! String remember = ""; %>
   <%
      String username = null;
      String password = null;

      Cookie[] cookies = request.getCookies();
      if(cookies!=null){
         for (Cookie cookie : cookies) {
            if(cookie!=null){
               if(cookie.getName().equals("username")){
                  username = URLDecoder.decode(cookie.getValue(),"UTF-8");
               }
               if(cookie.getName().equals("password")){
                  password = cookie.getValue();
               }
               if(cookie.getName().equals("remember")){
                  remember = URLDecoder.decode(cookie.getValue(),"UTF-8");
               }
            }
         }
      }

      if(username!=null && password!=null){
         //直接跳转至UserServlet中进行登录
         request.getRequestDispatcher(request.getContextPath()+"/user/login.do?username="+username+"&password="+password).forward(request,response);
      }
   %>
      <!-- Login -->
      <section class="hv-100">
         <div class="container hv-100">
            <div class="row align-items-center hv-100">
               <div class="col-lg-4 col-md-4 mx-auto">
                  <div class="card padding-card mb-0">
                     <div class="card-body">
                        <h5 class="card-title mb-4">登录窗口</h5>
                        <form  action="${pageContext.request.contextPath}/user/login.do" method="post">
                           <div class="form-group">
                              <%
                                 if(remember==null || remember.equals("")){
                              %>
                              <label>用户名 <span class="text-danger">*</span></label>
                              <input type="text" class="form-control" placeholder="请输入用户名" name="username" id="username">
                              <%
                                 }
                              %>
                              <%
                                 if(remember!=null && !remember.equals("")){
                              %>
                              <label>用户名 <span class="text-danger">*</span></label>
                              <input type="text" class="form-control" placeholder="请输入用户名" name="username" id="username" value="<%=remember%>">
                              <%
                                 }
                              %>
                           </div>
                           <div class="form-group">
                              <label>密码 <span class="text-danger">*</span></label>
                              <input type="password" class="form-control" placeholder="请输入密码" name="password" id="password">
                           </div>
                           <div class="form-group">
                              <div class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input" id="remember" name="remember" value="remember">
                                 <label class="custom-control-label" for="remember">记住用户名</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                              <input type="checkbox" class="custom-control-input" id="free" name="free" value="free">
                              <label class="custom-control-label" for="free">自动登录</label>
                              </div>
                              <div><span style="color: red" id="msg">${msg}</span></div>
                           </div>
                           <button type="submit" class="btn btn-success btn-block">登录</button>
                        </form>
                        <div class="mt-4 text-center">
                           还没有账户? <a href="register.jsp">注册</a>
                        </div>
                        <div class="mt-4 text-center">
                           <a href="forget.html">忘记密码?</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- End Login -->
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
      function userLogin(username,password,remember,free) {
         $.ajax({
            url:"${pageContext.request.contextPath}/user/login.do",
            method:"post",
            dataType:"json",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({
               'username':username,
               'password':password,
               'remember':remember,
               'free':free
            })
         });
      }
      // onclick="userLogin($('#username').val(),$('#password').val(),$('#remember').val(),$('#free').val());"

   </script>
   </body>
</html>