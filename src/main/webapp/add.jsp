<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="WEB-INF/lib/jquery-3.5.1.min.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/addUserServlet" style="position: absolute;left: 50%;top:50%; transform: translate(-50%,-50%);">
    <div class="mb-3" style="margin:0 auto;width: 400px">
        <label for="exampleInputId1" class="form-label">Id</label>
        <input style="width: 400px" name="id" type="text" class="form-control" id="exampleInputId1">
        <label for="exampleInputName1" class="form-label">Name</label>
        <input style="width: 400px" name="name" type="text" class="form-control" id="exampleInputName1">
        <div style="top:10px;margin:0 auto;width: 400px;position: relative; display: flex;flex-direction: row;gap: 20px">
            <div class="mb-3 form-group">
                <label class="form-check-label" >性别:</label>
                    <input name="gender" type="radio" value="男" class="form-check-input" id="exampleCheck1">男
                    <input name="gender" type="radio" value="女" class="form-check-input" id="exampleCheck2">女
            </div>
        </div>
        <label for="exampleInputAge1" class="form-label">Age</label>
        <input style="width: 400px" name="age" type="text" class="form-control" id="exampleInputAge1">
        <label for="exampleInputAddress1" class="form-label">籍贯</label>
        <select name="address" class="form-control" id="exampleInputAddress1">
            <option value="四川">四川</option>
            <option value="上海">上海</option>
            <option value="重庆">重庆</option>
        </select>
        <label for="exampleInputQQ1" class="form-label">QQ</label>
        <input style="width: 400px" name="QQ" type="text" class="form-control" id="exampleInputQQ1">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input style="width: 400px" name="email" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        <button style="position: relative;top:20px;left: 150px" type="submit" class="btn btn-primary btn-lg">提交</button>
    </div>
</form>
</body>
</html>
