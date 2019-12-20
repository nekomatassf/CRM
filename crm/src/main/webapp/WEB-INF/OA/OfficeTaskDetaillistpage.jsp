<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!--日期格式化  -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 数据表格</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="<%=basePath%>favicon.ico"> <link href="<%=basePath %>css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>基本 <small>分类，查找</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="table_data_tables.html#">选项1</a>
                                </li>
                                <li><a href="table_data_tables.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                            <a class="close-link" href="../OfficeKpictrl/inaddofficeKpi.do">
                                                                                                                                             添加任务
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>任务编号</th>
                                    <th>接受用户</th>
                                    <th>是否完成</th>
                                    <th>状态</th>
                                    <th>公司编号</th>
                                    <th>最后修改时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
        <tbody>
         <c:forEach items="${p.list }" var="d">
            <tr>
               <td>
                 ${d.taskDetailId }
               </td>
               
               <td>
                 ${d.taskId}
               </td>
               <td>
                 ${d.taskUserId }
               </td>
               <td>
                 ${d.taskIsfinshed }
               </td>
               <td>
                 ${d.status }
               </td>
               <td>
                 ${d.companyId }
               </td>
               <td>
               <fmt:formatDate value="${k.finalUpdataTime }" pattern="yyyy-MM-dd"/>
               </td>
               
               <td>
                 <a href="<%=basePath %>OfficeTaskDetailController/goupdate.do?taskDetailId=${d.taskDetailId }">修改</a>
                 /
                 <a href="<%=basePath %>OfficeTaskDetailController/delete.do?taskDetailId=${d.taskDetailId }"
                   onclick="return confirm('是否确定删除？')">删除</a>
                   /
                 <a href="<%=basePath %>OfficeTaskDetailController/delete.do?taskDetailId=${d.taskDetailId }"
                   onclick="return confirm('是否确定删除？')">修改</a>
               </td>
            </tr>
         </c:forEach>
          <tr>
             <td style="text-align: center;" colspan="4">
                <a href="OfficeKpictrl/listPage.do?pageNum=${p.firstPage }">首页</a>
                <a href="OfficeKpictrl/listPage.do?pageNum=${p.prePage }">上一页</a>
                <a href="OfficeKpictrl/listPage.do?pageNum=${p.nextPage }">下一页</a>
                <a href="OfficeKpictrl/listPage.do?pageNum=${p.lastPage }">尾页</a></td>
               <td style="text-align: center;" colspan="4">当前${p.pageNum }/${p.pages }页，共${p.total }条
             </td>
          </tr>
        </table>
       </div>
      </div>
     </div>
    </div>   
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>