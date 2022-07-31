<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="WEB-INF/lib/jquery-3.5.1.min.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/updateUserServlet" style="position: absolute;left: 50%;top:50%; transform: translate(-50%,-50%);">
    <div class="mb-3" style="margin:0 auto;width: 400px">
        <input type="hidden" name="id"  value="${user.id}">
        <label for="exampleInputName1" class="form-label">Name</label>
        <input style="width: 400px" name="name" type="text" value="${user.name}" class="form-control" id="exampleInputName1">
        <div style="top:10px;margin:0 auto;width: 400px;position: relative; display: flex;flex-direction: row;gap: 20px">
            <div class="mb-3 form-group">
                <label class="form-check-label" for="exampleCheck1">性别</label>
                    <c:if test="${user.gender=='男'}">
                        <input name="gender" type="radio" value="男" class="form-check-input" id="exampleCheck1" checked>男
                        <input name="gender" type="radio" value="女" class="form-check-input" id="exampleCheck2">女
                    </c:if>
                    <c:if test="${user.gender=='女'}">
                        <input name="gender" type="radio" value="男" class="form-check-input" id="exampleCheck1">男
                        <input name="gender" type="radio" value="女" class="form-check-input" id="exampleCheck2" checked>女
                    </c:if>
                    <c:if test="${user.gender!='女' and user.gender!='男'}">
                        <input name="gender" type="radio" value="男" class="form-check-input" id="exampleCheck1">男
                        <input name="gender" type="radio" value="女" class="form-check-input" id="exampleCheck2">女
                    </c:if>
            </div>
        </div>
        <label for="exampleInputAge1" class="form-label">Age</label>
        <input style="width: 400px" name="age" type="text" value="${user.age}" class="form-control" id="exampleInputAge1">
        <label for="exampleInputAddress1" class="form-label">籍贯</label>
        <select name="address" class="form-control" id="exampleInputAddress1">
            <c:if test="${user.address=='四川'}">
                <option value="四川" selected>四川</option>
                <option value="上海">上海</option>
                <option value="重庆">重庆</option>
            </c:if>
            <c:if test="${user.address=='上海'}">
                <option value="四川">四川</option>
                <option value="上海" selected>上海</option>
                <option value="重庆">重庆</option>
            </c:if>
            <c:if test="${user.address=='重庆'}">
                <option value="四川">四川</option>
                <option value="上海">上海</option>
                <option value="重庆" selected>重庆</option>
            </c:if>
        </select>
        <label for="exampleInputQQ1" class="form-label">QQ</label>
        <input style="width: 400px" name="QQ" type="text" value="${user.QQ}" class="form-control" id="exampleInputQQ1">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input style="width: 400px" name="email" type="text" value="${user.email}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        <button style="position: relative;top:20px;left: 150px" type="submit" class="btn btn-primary btn-lg">修改</button>
    </div>
</form>
</body>
</html>
