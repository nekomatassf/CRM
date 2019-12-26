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
    
    <title>My JSP 'khfk.jsp' starting page</title>
    
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
                        
                        <br>
                        <button type="button" class="btn btn-w-m btn-primary">客户：${name}</button>
                         <a href="SalekhlxjlController/gofkadd.do?id=${id}" target="_self">
                         <button type="button" class="btn btn-w-m btn-primary">添加客户反馈</button>
                         </a>
                         <a href="SalekhinfoController/list.do" target="_self">
                         <button type="button" class="btn btn-w-m btn-primary">返回上一级</button>
                         </a>
                        <br>

                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
                                <tr>

                                    <th data-toggle="true">记录优先级</th>
                                    <th data-hide="all">反馈类型</th>
                                    <th data-hide="all">反馈时间</th>
                                    <th data-hide="all">反馈主题</th>
                                    <th data-hide="all">反馈描述</th>
                                    <th data-hide="all">反馈来源</th>
                                    <th data-hide="all">分析</th>
                                    <th data-hide="all">负责人</th>
                                    <th data-hide="all">状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${q}" var="info" >
                                <tr>
                                    <td>${info.recordPriority}</td>
                                    <td>${info.feedbackType}</td>
                                    <td><fmt:formatDate value="${info.feedbackTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>${info.feedbaclTheme}</td>
                                    <td>${info.feedbackDiscribe}</td>
                                    <td>${info.feedbackSource}</td>
                                    <td>${info.analysis}</td>
                                    <td>${info.personInCharge}</td>                                    
                                    <td>${info.state}</td>
                                    <td>
                                    <button class="btn btn-outline btn-info  dim" data-toggle="modal" data-target="#${info.feedbackRecorId}"  data-placement="bottom" title="处理">
                                     <i class="fa fa-paste"></i>
                                    </button>
                                    
                           <div class="modal inmodal fade" id="${info.feedbackRecorId}" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">处理界面</h4>
                                        </div>
                                        <form action="SalekhlxjlController/fkupdate.do" method="post" target="_self">
                                       
                                        <div class="modal-body">
                                        
                                            <div>
                                            <div class="col-sm-8">
                                            <input type="hidden" name="feedbackRecorId" value="${info.feedbackRecorId}">
                                            <input type="hidden" name="userId" value="${info.userId}">
                                            <input type="hidden" name="recordPriority" value="${info.recordPriority}">
                                            <input type="hidden" name="feedbackType" value="${info.feedbackType}">
                                            <input type="hidden" name="feedbackTime" value="${info.feedbackTime}">
                                            <input type="hidden" name="feedbaclTheme" value="${info.feedbaclTheme}">
                                            <input type="hidden" name="feedbackDiscribe" value="${info.feedbackDiscribe}">
                                            <input type="hidden" name="feedbackSource" value="${info.feedbackSource}">
                                                                                              分析：<input id="analysis" name="analysis" type="text" class="form-control" value="${info.analysis}">
                                            </div>
                                        </div>
                                        <div>
                                            <div class="col-sm-8">
                                                                                              负责人：<input id="personInCharge" name="personInCharge" class="form-control" type="text" value="${info.personInCharge}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-8">
                                                                                              状态：<input id="state" name="state" class="form-control" type="text" value="已处理">
                                            </div>
                                        </div>
                                        
                                        
                                  
                                        </div>
                                       

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="submit" class="btn btn-primary">保存</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>                                     
                                    <a href="SalekhlxjlController/fkdelete.do?id=${info.feedbackRecorId}" target="_self" onclick="return confirm('是否确定删除？')">删除</a> 
                                    
                                    </td>
                                    
                                </tr>
                                </c:forEach>
                                


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



    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script src="js/plugins/validate/messages_zh.min.js"></script>
    <script src="js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
