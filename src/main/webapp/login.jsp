<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="WEB-INF/lib/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        function refreshCode(){
            var vcode=document.getElementById("vcode")
                vcode.src="${pageContext.request.contextPath}/checkCodeServlet?time"+new Date().getTime();
        }
    </script>
</head>
<body>
<h3 style="position:relative;top:170px;text-align: center;color: #0d6efd">用户登录页面</h3>
<form action="${pageContext.request.contextPath}/loginServlet" method="post">
    <table style="border-collapse:separate ;border-spacing:0 10px;position: relative;top:200px;margin:auto;" >
        <tr>
            <td><label for="exampleInputUsername1" class="form-label">Name</label></td>
            <td><input style="width: 400px" type="text" name="username" class="form-control" id="exampleInputUsername1"></td>
        </tr>
        <tr>
            <td><label for="exampleInputPassword1" class="form-label">Password</label></td>
            <td><input style="width: 400px" type="password" name="password" class="form-control" id="exampleInputPassword1"></td>
        </tr>
        <tr>
            <td><label for="exampleInputVerifycode1" class="form-label">验证码</label></td>
            <td style="display: flex;flex-direction: row;gap: 20px">
                <input style="width: 150px" type="text" name="verifycode" class="form-control" id="exampleInputVerifycode1">
                <a href="javascript:refreshCode();">
                    <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清，请点击刷新"  id="vcode">
                </a>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="position: relative;top:20px;left: 200px"><button type="submit" class="btn btn-primary">登录</button></td>
        </tr>
    </table>
<%--    <div style="position: relative;width:200px;top: 250px;left:45.7%">--%>
<%--        <%=request.getAttribute("login_msg") ==null ? "" : request.getAttribute("login_error")%>--%>
<%--    </div>--%>
    <div style="position: relative;width:300px;top: 250px;left:40%" class="alert alert-warning alert-dismissible" role="alert">
        <button style="position: relative;left: 99%" type="button" class="close" data-dismiss="alert" >
            <span>x</span>
        </button>
        <strong>${login_msg}</strong>
    </div>

</form>
</body>
</html>
