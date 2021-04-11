<%--
  Created by IntelliJ IDEA.
  User: 28896
  Date: 2021/3/11
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_path",request.getContextPath());
        %>
    <%-- web路径：
       不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出错
       以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:3306),需要加上项目名
          http://localhost:3306/ssm-crud
    --%>
        <link rel="stylesheet" href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="${APP_path}/static/js/jquery-1.9.1.js"></script>
</head>
<body>
         <div class="container">
             <%--标题--%>
              <div class="row">
                  <div class="col-md-3">
                      <h1>SSM-CRUD</h1>
                  </div>
              </div>
             <%--按钮--%>
             <div class="row">
                 <div class="col-md-4 col-md-offset-8">
                     <button class="btn btn-primary">提交</button>
                     <button class="btn btn-danger">删除</button>
                 </div>
             </div>
                 <br>
             <%--表格--%>
             <div class="row">
                 <table class="table table-striped">
                     <thead>
                     <tr>
                         <th scope="col"><input type="checkbox"></th>
                         <th scope="col">#</th>
                         <th scope="col">lastName</th>
                         <th scope="col">email</th>
                         <th scope="col">gender</th>
                         <th scope="col">deptName</th>
                         <th scope="col">操作</th>
                     </tr>
                     </thead>
                     <tbody>
                      <c:forEach items="${pageInfo.list}" var="emp">

                     <tr>
                         <th scope="col"><input type="checkbox"></th>
                         <th scope="row">${emp.empId}</th>
                         <td>${emp.empName}</td>
                         <td>${emp.email}</td>
                         <td>${emp.gender}</td>
                         <td>${emp.department.deptName}</td>
                         <td>
                             <button class="btn btn-primary">
                             <span class="glyphicon glyphicon-pencil"></span>
                             编辑
                         </button>&nbsp;
                             <button class="btn btn-danger">
                                 <span class="glyphicon glyphicon-trash"></span>
                                 删除
                             </button>&nbsp;
                         </td>
                     </tr>
                      </c:forEach>
                     </tbody>
                 </table>
             </div>
              <%--显示分页信息--%>
             <div class="row">
                 <div class="col-md-6">
                     当前${pageInfo.pageNum }页,总${pageInfo.pages }页,总${pageInfo.total }条记录
                 </div>
                 <div class="col-md-6">
                 <nav aria-label="Page navigation example">
                     <ul class="pagination">
                         <li class="page-item"><a class="page-link" href="${APP_path}/emps?pn=1">首页</a></li>

                         <c:if test="${pageInfo.hasPreviousPage==true}">
                         <li class="page-item">
                             <a class="page-link" href="${APP_path}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                 <span aria-hidden="true">&laquo;</span>
                             </a>
                         </li>
                         </c:if>

                           <c:forEach items="${pageInfo.navigatepageNums}" var="page_num" >
                                    <c:if test="${page_num == pageInfo.pageNum}">
                                        <li class="page-item active"><a class="page-link" href="#">${page_num}</a></li>
                                    </c:if>
                               <c:if test="${page_num != pageInfo.pageNum}">
                                   <li class="page-item"><a class="page-link" href="${APP_path}/emps?pn=${page_num}">${page_num}</a></li>
                               </c:if>

                           </c:forEach>
                         <c:if test="${pageInfo.hasNextPage==true}">
                             <li class="page-item">
                                 <a class="page-link" href="${APP_path}/emps?pn=${pageInfo.pageNum+1}" aria-label="Previous">
                                     <span aria-hidden="true">&raquo;</span>
                                 </a>
                             </li>
                         </c:if>
                         <li class="page-item"><a class="page-link" href="${APP_path}/emps?pn=${pageInfo.pages}">末页</a></li>
                     </ul>
                 </nav>
             </div>


         </div>



</body>
</html>
