<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人查询页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="WEB-INF/lib/jquery-3.5.1.min.js"></script>
    <script>
        function deleteUser(id){
            if(confirm("你确定要删除吗？")) {
                location.href = "${pageContext.request.contextPath}/delUserServlet?id=" + id;
            }
        }
        window.onload=function (){
            document.getElementById("delSelected").onclick=function(){
                if(confirm("你确定要删除所选条目吗？")) {
                    var flag=false;
                    var cbs=document.getElementsByName("uid");
                    for(var i=0;i<cbs.length;i++){
                        if(cbs[i].checked){
                            flag=true;
                            break;
                        }
                    }
                    if(flag) {
                        document.getElementById("userform").submit();
                    }
                }
            }
            document.getElementById("firstCb").onclick=function (){
                var cbs=document.getElementsByName("uid");
                for(var i=0;i<cbs.length;i++){
                    cbs[i].checked=this.checked;
                }
            }
        }
    </script>
</head>
<body style="max-width: 1280px">
<form action="${pageContext.request.contextPath}/findUserByPageServlet" method="post" class="form-inline" style="position:relative;top:50px;left:250px;display: flex;flex-direction: row;gap: 10px">
    <div class="form-group" style="position:relative;top:20px;line-height:40px;width: 400px;height:40px;display: flex;flex-direction: row;gap: 30px">
        <label for="exampleInputName2">Name</label>
        <input style="width: 100px;" name="name" value="${condition.name[0]}" type="text" class="form-control" id="exampleInputName2" placeholder="">
        <label for="exampleInputAddress2">address</label>
        <input style="width: 70px;" name="address" value="${condition.address[0]}" type="text" class="form-control" id="exampleInputAddress2" placeholder="">
        <label for="exampleInputEmail2">Email</label>
        <input style="width: 160px;" name="email" value="${condition.email[0]}" type="text" class="form-control" id="exampleInputEmail2" placeholder="">
        <button style="min-width: 60px;box-shadow:2px 2px 1px #0a0a0a" type="submit" class="btn btn-default">查询</button>
    </div>
</form>
    <div class="mb-3" style="width: 200px;position:relative;top:15px;left: 82%">
        <a href="${pageContext.request.contextPath}/add.jsp" type="submit" class="btn btn-primary">提交</a>
        <a href="javascript:void(0);" id="delSelected" type="submit" class="btn btn-primary">删除选中</a>
    </div>
<form  id="userform" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
    <table class="table table-hover" style="position:relative;top:50px;left:100px;width: 1000px;margin:0 auto">
        <tr>
            <th><input type="checkbox" id="firstCb" class="form-check-input"></th>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>QQ</th>
            <th>email</th>
            <th colspan="2">操作</th>
        </tr>
        <c:forEach items="${pb.list}" var="user" varStatus="s">
            <tr>
                <td><input type="checkbox" name="uid" class="form-check-input" value="${user.id}"></td>
                <td>${s.count}</td>
                <td>${user.name}</td>
                <td>${user.gender}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.QQ}</td>
                <td>${user.email}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}" class="btn btn-primary btn-sm" href="update.jsp">修改</a>&nbsp;
                    <a href="javascript:deleteUser(${user.id});" class="btn btn-primary btn-sm">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
<div style="position: relative;left:20%;top: 100px">
    <form>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage==1}">
                    <li class="disabled page-item">
                </c:if>
                <c:if test="${pb.currentPage!=1}">
                    <li class="page-item">
                </c:if>
                    <a class="page-link" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage-1}&rows=7&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span></a>
                </li>
                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <li class="page-item">
                        <c:if test="${pb.currentPage==i}">
                            <a class="page-link active" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=7&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                        </c:if>
                        <c:if test="${pb.currentPage!=i}">
                            <a class="page-link" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=7&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                        </c:if>
                    </li>
                </c:forEach>
                    <c:if test="${pb.currentPage==pb.totalPage}">
                        <li class="disabled page-item">
                    </c:if>
                    <c:if test="${pb.currentPage!=pb.totalPage}">
                        <li class="page-item">
                    </c:if>
                    <a class="page-link" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage+1}&rows=7&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span></a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">共${pb.totalCount}条记录，共${pb.totalPage}页</span>
            </ul>
            </nav>
        </form>
</div>
<%--<div style="position: absolute;top: 600px;left: 740px;">--%>
<%--    <a href="add.jsp" type="submit" class="btn btn-primary">提交</a>--%>
<%--</div>--%>
</body>
</html>