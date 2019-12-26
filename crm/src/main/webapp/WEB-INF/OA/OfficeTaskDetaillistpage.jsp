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
                            
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr style="font-family:宋体; ">
                                    <th style="font-family:宋体; ">编号</th>
                                    <th style="font-family:宋体; ">任务编号</th>
                                    <th style="font-family:宋体; ">接受用户</th>
                                    <th style="font-family:宋体; ">是否完成</th>
                                    <th style="font-family:宋体; ">状态</th>
                                    <th style="font-family:宋体; ">公司编号</th>
                                    <th style="font-family:宋体; ">最后修改时间</th>
                                    <th style="font-family:宋体; " colspan="3"><center>操作</center></th>
                                </tr>
                            </thead>
        <tbody>
         <c:forEach items="${p.list }" var="d">
            <tr style="font-family:宋体; ">
               <td style="font-family:宋体; ">
                 ${d.taskDetailId }
               </td>
               
               <td style="font-family:宋体; ">
                 ${d.taskId}
               </td>
               <td style="font-family:宋体; ">
                 ${d.taskUserId }
               </td>
               <td style="font-family:宋体; ">
                 ${d.taskIsfinshed }
               </td>
               <td style="font-family:宋体; ">
                 ${d.status }
               </td>
               <td style="font-family:宋体; ">
                 ${d.companyId }
               </td>
               <td style="font-family:宋体; ">
               <fmt:formatDate value="${d.finalUpdataTime }" pattern="yyyy-MM-dd"/>
               </td>
               
               <td style="font-family:宋体; ">
                  <center><button type="button" class="btn btn-primary" data-toggle="modal" target="_self" onclick="return update(${d.taskDetailId })">
                                                                             √
                    </button></center>
                 </td>
                   <td>                              
                   <center>
                     <button type="button" class="btn btn-primary" onclick="return deletw(${d.taskDetailId })" data-toggle="modal" >
                                                                                                      删除
                    </button>
                    </center>
                   </td>
                   <td>
                   <center>
                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${d.taskDetailId }">
                                                                             查看详情 
                    </button>
                    </center>
                    </td>
                    <div class="modal inmodal fade" id="${d.taskDetailId }" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">详细信息</h4>
                                        </div>
                                        <div class="modal-body">
                                           
                                           <span><ul><li>任务编号：${d.task.taskId} </li></ul></span> 
                                           <span><ul><li>任务标题： ${d.task.tsakTitle }</li></ul></span>
                                           <span><ul><li>任务具体内容：${d.task.taskConcreteContent}</li></ul></span>
                                           <span><ul><li>任务发布人： ${d.task.taskIssuer }</li></ul></span>
                                           <span><ul><li>考核指标： ${d.task.taskKpi }</li></ul></span>
                                           <span><ul><li>任务开始时间：${d.task.taskStartTime} </li></ul></span>
                                           <span><ul><li>任务结束时间：${d.task.taskStopTime} </li></ul></span>
                                           <span><ul><li>最后修改时间:${d.task.finalUpdateTime}</li></ul></span>
                                           <span><ul><li>公司编号：${d.task.companyId}</li></ul></span>
                                           
                                        </div>
                                        <div class="modal-footer">
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
            </tr>
         </c:forEach>
          <tr style="font-family:宋体; ">
             <td style="text-align: center;" colspan="4">
                <a href="<%=basePath %>OfficeTaskDetailController/listpage.do?pageNum=${p.firstPage }" target="_self">首页</a>
                <a href="<%=basePath %>OfficeTaskDetailController/listpage.do?pageNum=${p.prePage }" target="_self">上一页</a>
                <a href="<%=basePath %>OfficeTaskDetailController/listpage.do?pageNum=${p.nextPage }" target="_self">下一页</a>
                <a href="<%=basePath %>OfficeTaskDetailController/listpage.do?pageNum=${p.lastPage }" target="_self">尾页</a></td>
               <td style="text-align: center;" colspan="6">当前${p.pageNum }/${p.pages }页，共${p.total }条
             </td>
          </tr>
        </table>
       </div>
      </div>
     </div>
    </div>   
    </div>
    <script type="text/javascript">
        function  deletw(e){
        if(confirm("确认删除")==true){
        
        location.href="<%=basePath %>OfficeTaskDetailController/delete.do?taskDetailId="+e;
        }
        };
        function  update(e){
        if(confirm("确认修该")==true){
        location.href="<%=basePath %>OfficeTaskDetailController/goupdate.do?taskDetailId="+e;
        }
        
        }
    
    
    </script>
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath%>js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="<%=basePath%>js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<%=basePath%>js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script>
        //$(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>