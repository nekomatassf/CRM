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
	<link rel="shortcut icon" href="favicon.ico"> 
	<link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-sm-12">
                        
                        <br>
                        <button type="button" class="btn btn-w-m btn-primary">客户：${cname}</button>
                         <a href="SalekhlxjlController/golxjladd.do?id=${cid}" target="_self">
                         <button type="button" class="btn btn-w-m btn-primary">添加联系记录</button>
                         </a>
                         <a href="SalekhinfoController/lxcx.do" target="_self">
                         <button type="button" class="btn btn-w-m btn-primary">返回上一级</button>
                         </a>
                         <a id="deleteSelect">
                         <button type="button"  class="btn btn-w-m btn-primary">批量删除</button>
                         </a> 
                        <br>

                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
                                <tr>
                                    <th data-toggle="true"><input type="checkbox" id="selectAll" >全选</th>

                                    <th data-toggle="true">联系标题</th>
                                    <th data-hide="all">联系时间</th>
                                    <th data-hide="all">联系内容</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${q}" var="info" >
                                <tr>
                                    <td><input type="checkbox" name="c1" class="c1" value="${info.contactRecordId}"></td>
                                    <td>${info.contactTitle}</td>
                                    <td><fmt:formatDate value="${info.contactTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>${info.contactContent}</td>
                                    <td>                                    
                                    <button class="btn btn-outline btn-info  dim" data-toggle="modal" data-target="#${info.contactRecordId}"  data-placement="bottom" title="编辑">
                                     <i class="fa fa-paste"></i>
                                    </button>
                                    
                            <div class="modal inmodal fade" id="${info.contactRecordId}" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">编辑界面</h4>
                                        </div>
                                        <form action="SalekhlxjlController/lxjlupdate.do" method="post" target="_self">
                                       
                                        <div class="modal-body">
                                             <input type="hidden" name="contactRecordId" value="${info.contactRecordId}">
                                            <div>
                                            <div class="col-sm-8">
                                                                                              联系标题：<input  name="contactTitle" type="text" class="form-control" value="${info.contactTitle}">
                                            </div>
                                        </div>
                                        <br>
                                        <div>
                                            <div class="col-sm-8">
                                                                                              联系时间：<input  name="contactTime" class="form-control" type="text" value="<fmt:formatDate value="${info.contactTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                              <div class="col-sm-8">
                                                                                                   联系内容：<input id="contactContent" name="contactContent" class="form-control"   type="text" value="${info.contactContent}">
                                              
                                              </div>
                                         </div>
                                        <div class="form-group">
                                            <div class="col-sm-8">
                                             <input type="hidden" name="userId" value="${cid}">
                                            </div>
                                        </div> 
                                       
                                  
                                        
                                       

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="submit" class="btn btn-primary">保存</button>
                                        </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div> 
                                    
 
                                   <a href="SalekhlxjlController/lxjldelete.do?lxid=${info.contactRecordId}" onclick="return confirm('是否确定删除？')">删除</a> 
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
            
    
            
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath%>js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
  </body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
	
	$("#b1").click(function() {
		var gysName=$("#t1").val()
		alert(gysName)
		alert("GongYingShangctrl/list.do?gysName="+gysName)
		location.href="GongYingShangctrl/list.do?gysName="+gysName;
	})	

	
	//选中删除
	$("#deleteSelect").click(function(){
	
		 var myArr=new Array();
		 var a=""
		myArr=$("input[name='c1']")
		var i
		for(i=0;i<myArr.length;i++){
			if(myArr[i].checked==true){
				a+="lxid="+myArr[i].value+"&";
			}
		}
	
			location.href="SalekhlxjlController/lxjlDeleteSelect.do?"+a;
			
	})
			
				
		//下拉显示
        //$(document).ready(function(){$(".footable").footable();});
   
    	 //全选
			$("#selectAll").click(function(){
				if($(this).prop("checked")){
					$(".c1").prop("checked", true)
					$("#selectAll").prop("checked",true)
				}
				if(!$(this).prop("checked")){
					$(".c1").prop("checked",false)
				}
			})
				
	})
</script>
