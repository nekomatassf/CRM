<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Khinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <base target="_blank">

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                       <form action="SalekhinfoController/list.do" method="post" target="_self">
                            <div class="input-group">
                            <input type="text" placeholder="请输入客户名称" name="userName" class="input form-control">
                            <span class="input-group-btn">
                            <button type="submit" class="btn btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
                            </span>    
                        </div>
                        </form>
                        </div>
                        <br>
                         
                         <button type="button" class="btn btn-w-m btn-primary">总条数：${p.total}</button>
                        
                        <br>

                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
                                <tr>

                                    <th data-toggle="true">客户编号</th>
                                    <th data-hide="all">客户名称</th>
                                    <th data-hide="all">客户属性</th>
                                    <th data-hide="all">移动电话</th>
                                    <th data-hide="all">状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${p.list}" var="info" >
                                <tr>
                                    <td>${info.userId}</td>
                                    <td>${info.userName}</td>
                                    <td>${info.userAttribute}</td>
                                    <td>${info.mphone}</td>
                                    <td>${info.userState}</td>
                                    <td>

                                     <a href="SalekhlossController/losshuifu.do?id=${info.userId}" onclick="return confirm('是否确定恢复？')">恢复</a>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${info.userId}">
                                                                             流失
                                    </button>
                            <div class="modal inmodal fade" id="${info.userId}" tabindex="-1" role="dialog"  aria-hidden="true">
                                 
                                <div class="modal-dialog modal-sm">
                                    <form action="SalekhlossController/lossupdate.do?id=${info.userId} " method="post" target="_self">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">流失界面</h4>
                                        </div>
                                        <div class="modal-body">
                                           
                                           <input type="hidden" name="userId"  value="${info.userId}">
                                           <span><ul><li>操作人员编号：<input type="text" name="operatorId"  > </li></ul></span> 
                                           <span><ul><li>处理方式：<input type="text" name="processingMode"  > </li></ul></span> 
                                           <span><ul><li>处理措施：<input type="text" name="treatmentMeasures"  > </li></ul></span> 
                                           <span><ul><li>状态：<input type="text" name="isLoss" value="流失" > </li></ul></span> 
                                           
                                        </div>
                                      
                                       
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="submit" class="btn btn-primary">保存</button>
                                        </div>  
                                           </form>                                  
                                        </div>
                                    </div>
                                    </div>
                                   
                                    </td>
                                
                                
                            
                                   
                                    
                                    
                                </tr>
                                </c:forEach>
                                
                                <tr>
                                    <td style="text-align: center;" colspan="11">
                                    <a target="_self" href="SalekhlossController/list.do?pageNum=${p.firstPage }">首页</a>
                                    <a target="_self" href="SalekhlossController/list.do?pageNum=${p.prePage }">上一页</a>
                                    <a target="_self" href="SalekhlossController/list.do?pageNum=${p.nextPage }">下一页</a>
                                    <a target="_self" href="SalekhlossController/list.do?pageNum=${p.lastPage }">尾页</a>
                                                                             当前${p.pageNum }/${p.pages }页，共${p.total }条
                                     </td>
                                </tr>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="11">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath%>js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
  </body>
</html>
<script>
$(document).ready(function(){
   if(${iscg=="yes"}){
   swal({title:"太帅了",text:"添加成功",type:"success"})
   }
});
</script>