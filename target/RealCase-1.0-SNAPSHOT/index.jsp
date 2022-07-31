<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主页页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="WEB-INF/lib/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div style="text-align: center;font-size: 30px;color: #0a58ca">${manageuser.name}，欢迎您</div>
    <h1 style="color:skyblue;font-size:75px;text-align: center">
        <a style="text-decoration:none" href="${pageContext.request.contextPath}/findUserByPageServlet">
            个人信息查询
        </a>
    </h1>
</body>
</html>