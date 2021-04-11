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
    <script src="${APP_path}/static/js/jquery-1.9.1.js"></script>
    <link rel="stylesheet" href="${APP_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="${APP_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

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
            <button type="button" id="add_btn" class="btn btn-primary">新增</button>
            <button class="btn btn-danger" id="delete_emps">删除</button>
        </div>
    </div>
        <!-- 员工新增模态框 -->
        <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">员工添加</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%--表单--%>
                        <form class="form-horizontal" name="form1">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">empName</label>
                                <div class="col-sm-10">
                                    <input type="text" name="empName" class="form-control" id="add_name" placeholder="empName">
                                    <span id="helpBlock2" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" class="form-control" id="add_email" placeholder="email@qq.com">
                                    <span id="helpBlock3" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">gender</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_add" checked="checked" value="男"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_add" value="女"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">deptName</label>
                                <div class="col-sm-4">
                                      <select class="form-control"name="dId" id="dept_select">

                                      </select>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="save_emps">保存</button>
                    </div>
                </div>
            </div>
        </div>
    <br>
        <%----------------------------------------------修改的分割线----------------------------------------------------%>
        <!-- 员工编辑模态框 -->
        <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">员工修改</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%--表单--%>
                        <form class="form-horizontal" name="form1">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">empName</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static" id="update_name"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" class="form-control" id="update_email" placeholder="email@qq.com">
                                    <span id="helpBlock5" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">gender</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender1_update" checked="checked" value="男"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender2_update" value="女"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">deptName</label>
                                <div class="col-sm-4">
                                    <select class="form-control"name="dId" id="dept_select1">

                                    </select>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="update_emps">更新</button>
                    </div>
                </div>
            </div>
        </div>
         <%------------------------------------分割线----------------------------------------%>
    <%--表格--%>
    <div class="row">
        <table class="table table-striped" id="emps_table">
            <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" id="check_all"></th>
                        <th scope="col">#</th>
                        <th scope="col">lastName</th>
                        <th scope="col">email</th>
                        <th scope="col">gender</th>
                        <th scope="col">deptName</th>
                        <th scope="col">操作</th>
                    </tr>
            </thead>
            <tbody>

            </tbody>

        </table>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <div class="col-md-6" id="pageMsg">

        </div>
        <div class="col-md-6" id="page_nav">
            <nav aria-label="Page navigation example">
            </nav>
        </div>


    </div>
    <script type="text/javascript">
        var totalPage,currentPage;
            //1、页面加载完成后，提交ajax请求，要到分页数据
               $(function(){

                   to_Page(1);
            });
               //根据索引来显示页面
               function to_Page(pn) {
                   $.ajax(
                       {
                           url:"${APP_path}/emps",
                           data:"pn="+pn,
                           type:"GET",
                           success:function (result) {
                               // console.log(result);
                               //1、解析并显示员工数据
                               build_emps_table(result);
                               //2、解析并显示分页信息
                               build_page_info(result);
                               build_page_nav(result);
                           }
                       }
                   )
               }


               function build_emps_table(result){
                   //每次点击跳转页面都要清空原来的数据
                   $("#emps_table tbody").empty();
                   var emps=result.extend.pageInfo.list;
                   //需要遍历的对象和数组
                   // 对象：  $('a').each(function(index,value){})
                   $.each(emps,function(index,item) {
                    //  alert(item.empName);
                       /*
                       $("标签").append(数值/标签/字符串)..... .appendTo("大的标签库") jsp中的嵌套
                       */
                       var empIdTd= $("<th scope='row'></th>").append(item.empId);
                       var empNameTd= $("<td></td>").append(item.empName);
                       var genderTd= $("<td></td>").append(item.gender);
                       var emailTd= $("<td></td>").append(item.email);
                       var deptNameTd= $("<td></td>").append(item.department.deptName);
                       /*
                       <button class="btn btn-primary">
                             <span class="glyphicon glyphicon-pencil"></span>
                             编辑
                         </button>&nbsp;
                             <button class="btn btn-danger">
                                 <span class="glyphicon glyphicon-trash"></span>
                                 删除
                             </button>&nbsp;
                        */

                       var editTd=$("<button></button>").addClass("btn btn-primary update_data").append($("<span></span>")
                           .addClass("glyphicon glyphicon-pencil")).append("编辑");
                       //在编辑框获取员工ID，添加属性的方法
                          $(editTd).attr("emps_id",item.empId);

                       var delTd=$("<button></button>").addClass("btn btn-danger delete_data").append($("<span></span>")
                           .addClass("glyphicon glyphicon-trash")).append("删除");
                          $(delTd).attr("emps_id",item.empId);
                       var Button=$("<td></td>").append(editTd).append("&nbsp;").append(delTd);

                       $("<tr></tr>").append("<th scope='col'><input type='checkbox' class='check_item'/></th>")
                                   .append(empIdTd)
                                   .append (empNameTd)
                                   .append(genderTd)
                                   .append(emailTd)
                                   .append(deptNameTd)
                                   .append(Button)
                                   .appendTo("#emps_table tbody");
                   });
               }


               //解析显示分页信息
               function build_page_info(result){
                   $("#pageMsg").empty();
                   //当前页,总页,总条记录
                   $("<span></span>").append("当前"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页,总"
                       +result.extend.pageInfo.total+"条记录")
                   .appendTo("#pageMsg");
                   totalPage=result.extend.pageInfo.total;
                   currentPage=result.extend.pageInfo.pageNum;
               }


               //解析显示分页条信息,点击分页行跳转分页数据
               function  build_page_nav(result) {
                   $("#page_nav nav").empty();
                   var ul=$("<ul></ul>").addClass("pagination");
                   var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                   var previous=$("<li></li>").append($("<a></a>").append("&laquo;"));
                   if(result.extend.pageInfo.hasPreviousPage==false){
                       firstPage.addClass("disabled");
                       previous.addClass("disabled");
                   }else{
                       //首页跳转
                       firstPage.click(function () {
                           to_Page(1);
                       })
                       //前进
                       previous.click(function () {
                           to_Page(result.extend.pageInfo.pageNum-1);
                       })
                   }
                   var next=$("<li></li>").append($("<a></a>").append("&raquo;"));
                   var lastPage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
                   firstPage.click(function () {
                       to_Page(1);
                   })
                  if (result.extend.pageInfo.hasNextPage==false){
                      next.addClass("disabled");
                      lastPage.addClass("disabled");
                  }else{
                      //后退
                      next.click(function () {
                          to_Page(result.extend.pageInfo.pageNum+1);
                      })
                      //末页跳转
                      lastPage.click(function () {
                          to_Page(result.extend.pageInfo.pages);
                      })
                  }
                   ul.append(firstPage).append(previous);
                   $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                       var numLi = $("<li></li>").append($("<a></a>").append(item));
                           if(result.extend.pageInfo.pageNum==item) {
                               numLi.addClass("active");
                           }
                           numLi.click(function () {
                                to_Page(item);
                           })


                            ul.append(numLi);
                   });
                   ul.append(next).append(lastPage).appendTo("#page_nav nav")

               }

               $("#add_btn").click(function () {
                      //清除
                     $("#addModal form")[0].reset(); //移除表单所有内容使用reset()
                     $("#add_name").parent().removeClass("has-warning has-success");
                     $("#add_email").parent().removeClass("has-warning has-success");
                     $("#add_name").next("span").text(" ");
                     $("#add_email").next("span").text(" ");
                     $("#dept_select").empty();

                        getDepts("#dept_select");
                     $("#addModal").modal({
                             backdrop:"static"
                           }

                     )
               })


            //获取部门信息
             function getDepts(ele) {
                   //清空
                 $(ele).empty();
                  //获取部门信息
                      $.ajax({
                          url: "${APP_path}/depts",
                          type:"GET",
                          success:function (result) {
                              $.each(result.extend.dept_data,function (index,item) {
                                 var options= $("<option></option>").append(item.deptName).attr("value",item.deptId);
                                     options.appendTo(ele);
                              });

                          }
                      });
             }


             //校验
        function check_addVal(){
                   var empName=$("#add_name").val();
                   var check_name=	/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
                  var email=$("#add_email").val();
                   var check_email=	/^([a-zA-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                  if(!check_name.test(empName)){
                      mis_Msg("#add_name","warning","用户名可以是2~5的中文或者6~16的英文！");

                      return false;
                  }
                  else {
                      mis_Msg("#add_name","success"," ");
                  }

                  if(!check_email.test(email)){
                     // alert("邮箱格式不正确！！！");
                      mis_Msg("#add_email","warning","邮箱不正确");
                      return false;
                  }
                  else {
                      mis_Msg("#add_email","success"," ");
                  }

                  return true;
        }

        /*
        *   模态框校验提示
        * */
        function mis_Msg(statement,status,msg){
            $(statement).parent().removeClass("has-success has-warning");
            $(statement).next("span").text(" ");

              if(status=="warning"){
                  $(statement).parent().addClass("has-warning");
                  $(statement).next("span").text(msg);
              }
              if(status=="success") {
                  $(statement).parent().addClass("has-success");
                  $(statement).next("span").text(msg);
              }
        }


        //校验名字是否重复
          $("#add_name").change(function () {
              var empName=this.value;
               $.ajax({
                   url:"${APP_path}/checkUser",
                   type:"POST",
                   data:"empName="+empName,
                   success:function (result) {
                        if (result.code==100){
                             mis_Msg("#add_name","success","用户可用！");
                             $("#save_emps").attr("ajax-va","success");
                        }else {
                            mis_Msg("#add_name","warning",result.extend.mess);
                            $("#save_emps").attr("ajax-va","failed");
                        }
                   }
               });
          })


           //保存员工信息
             $("#save_emps").click(function(){


                 //1、校验名字和邮箱
                 // if(check_addVal()==false){
                 //     return false;
                 // }
                if($(this).attr("ajax-va")=="failed"){
                    return  false;
                }
                 //2、上传数据到控制器
                 $.ajax(
                     {
                         url:"${APP_path}/emp",
                         type:"POST",
                         data:$("#addModal form").serialize(), //serialize()是将表格内容转换为字符串形式
                         success:function (result) {


                             if(result.code==100) {
                                  alert(result.msg);
                                 //关闭模态框
                                 $("#addModal").modal('hide');
                                 //直接来到最后一页
                                 to_Page(totalPage);
                             }else{

                                 // 后端校验的错误信息
                                 if(undefined!=result.extend.error.email){
                                     mis_Msg("#add_email","warning",result.extend.error.email);
                                 }
                                 if(undefined!=result.extend.error.empName){
                                     mis_Msg("#add_name","warning",result.extend.error.empName);
                                 }
                             }
                         }
                     });

             });
/*-----------------------------------------------------------------------分割线--------------------------------------------------------------*/
        //修改员工信息
        //我们是创建按钮之前就绑定了click事件，所以绑不上。
           $(document).on("click",".update_data",function () {
                    //0、弹出模态框
                          $("#updateModal").modal(
                              {
                                  backdrop:"static"
                              })

                   //1、查询员工信息，显示在模态框中
                      getEmp($(this).attr("emps_id"));
                          //把员工Id传到更新按钮上
                      $("#update_emps").attr("empId",$(this).attr("emps_id"));
                   //2、显示部门信息
                 getDepts("#dept_select1");

           })
           function getEmp(id) {
               $.ajax({
                   url:"${APP_path}/emp/"+id,
                   type:"GET",
                   success:function (result) {
                          console.log(result);
                          var EmployeeData=result.extend.emp;
                          $("#update_name").text(EmployeeData.empName);
                          $("#update_email").val(EmployeeData.email);
                          $("#updateModal input[name=gender]").val([EmployeeData.gender]);
                          $("#updateModal select").val([EmployeeData.dId]);

                   }
               })
           }
           $("#update_emps").click(function () {
               if($(this).attr("status")=="failed"){
                     return false;
               }
               else{
               //ajax更新数据
               $.ajax({
                   url:"${APP_path}/emp/"+$(this).attr("empId"),
                   type:"PUT",
                   data:$("#updateModal form").serialize(),
                   success:function (result) {
                       /*关闭模态框*/
                       $("#updateModal").modal("hide");
                       //跳转修改页面
                       to_Page(currentPage);
                     }
                  })
                }
           })
          //编辑的邮箱检验      //检验邮箱是否合法
           $("#update_email").change(function () {
               var email=$("#update_email").val();
               var check_email=	/^([a-zA-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
               if(!check_email.test(email)){
                   // alert("邮箱格式不正确！！！");
                   mis_Msg("#update_email","warning","邮箱格式不正确");
                   $("#update_emps").attr("status","failed");
               }
               else {
                   mis_Msg("#update_email","success","邮箱合法！");
                   $("#update_emps").attr("status","success");
               }
           })
          /*----------------------------------分割线-------------------------------------------*/
          /*
          * 逐行删除
          * */
          $(document).on("click",".delete_data",function () {
                //先获取id、员工姓名
              var id= $(this).attr("emps_id");
              var empName=$(this).parents("tr").find("td").eq(0).text();//根据子元素找到父元素通过find()找到元素标签，然后通过eq()的index来匹配对应的文本
               //弹出框提醒员工是否删除
              if(confirm("确认删除【"+empName+"】吗？")==true){    //confirm()是Windows对象,是用来判断的
                //通过ajax进行删除
              $.ajax({
                  url:"${APP_path}/emp/"+id,
                  type:"DELETE",
                  success:function (result) {
                         alert(result.msg);
                         to_Page(currentPage);
                  }

              })
              }
          })
        /*
        * 按钮 全选 全不选
        * */
        $("#check_all").click(function () {
                var flag=$(this).prop("checked");
                $(".check_item").prop("checked",flag);
        })

        $(document).on("click",".check_item",function () {
                   var flag=$(".check_item:checked").length==$(".check_item").length;
                   $("#check_all").prop("checked",flag);
        })
      /*
      * 批量删除
      * */
        $("#delete_emps").click(function () {

            var empsNames="";
            var empsId="";
               //弹出提示框是否确认删除
             // var empsName=$(".check_item:checked").parents("tr").find("td").eq(0).text();
             $.each($(".check_item:checked"),function () {
                   empsNames+=$(this).parents("tr").find("td").eq(0).text()+",";
                   empsId+=$(this).parents("tr").find("th").eq(1).text()+"-";

             })
            empsNames=empsNames.substring(0,empsNames.length-1);
            empsId=empsId.substring(0,empsId.length-1);
               if(confirm("是否要删除【"+empsNames+"】吗？")==true){
                        //提交ajax请求进行删除
                    $.ajax({
                        url:"${APP_path}/emp/"+empsId,
                        type:"DELETE",
                        success:function (result) {
                              alert(result.msg);
                              to_Page(currentPage);
                        }
                    })
               }
        })
    </script>

</body>
</html>
