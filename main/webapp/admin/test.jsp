<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="javascript:void(0);" onclick="testFind()" class="btn bg-olive btn-xs">编辑</a>
<script src="${pageContext.request.contextPath}/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script>

    function testFind(){
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/admin/findUserById/2.do",
            dataType:"json",
            contentType:"application/json;charset=utf-8",
            success:function(user){
                window.alert(user.username);
            }
        });
    }


</script>
</body>
</html>
