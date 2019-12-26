<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>My JSP 'JH-gysAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    
    
    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath%>css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/footable/footable.core.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
  </head>
  
  <body>
   		    
  <div class="container">
        
        
   		
   			<h2 id="h1" style="font-weight: bolder;">楞头一下</h2>
   			<input type="text" id="t1" style=" width: 200px;height: 30px;font-size: 16pt; ">
   			
   			<button  id="b1"  type="button" class="btn btn-primary btn-lg" 
   			 style="width: 100px;height: 30px;
   			border: 1px solid blue;position: absolute;top: 56px;line-height: 10px" >楞头一下</button>
   			
   			<div id="div1" style="width: 200px;height: 160px;
   			border: 1px solid red;position:absolute;
   			left: 60px;top:87px;display: none"></div>
   		  <br>  <br> 
   		<%-- <h3 style="display: inline-block;"><a href="cgdXqCtrl/cgdxqToAdd.do?cgdId=${cgdId}" target="_self">添加入库商品</a></h3>
       	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add">添加商品</button> --%>
         
                	<!-- 弹窗---查看详情 -->
    <div class="modal inmodal fade" id="add" tabindex="-1" role="dialog"  aria-hidden="true">
       <div class="modal-dialog modal-sm">
           <div class="modal-content">
               <!-- <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                   <h4 class="modal-title">添加商品</h4>
               </div> -->
               <div class="modal-body">
                   				<table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
	                                <tr>
											 <th>产品编号</th>
	                                      	 <th>产品名称</th>
		                                     <th>单价</th>
		                                     <th>数量</th>
		                                     <th>总价</th>
		                                     <th>备注信息</th>
		                                     <th>入库</th>
	                                </tr>
                                </thead>
                                <tbody>
                                	<tr>
                                		<td>
                                			<select id="s1">
                                				<option>1</option>
                                				<option>2</option>
                                				<option>3</option>
                                			</select>
                                		</td>
                                		<td></td>
                                		<td></td>
                                		<td></td>
                                		<td></td>
                                		<td ></td>
                                	</tr>
                                </tbody>
                               </table>
                        </div>
                       <div class="modal-footer">
                       
                       </div>
                   </div>
               </div>
           </div>
                                             	 
        &emsp;
      	<h3 style="display: inline-block;"><a id="deleteSelect"  target="_self">删除选中</a></h3>
       
             <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
                                <tr>

                                    <th data-toggle="true"><input type="checkbox" id="selectAll" >全选</th>
                                    <th>采购单详情编号</th>
                                    <th>采购单编号</th>
                                    <th>产品编号</th>
                                    <th>产品数量</th>
                                    <th>产品价格</th>
                                    <th>是否入库</th>
                                    <th>操作人员</th>
                                    <th>备注信息</th>
                                    <th>公司编号</th>
                                    <th>修改时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
             				<c:forEach items="${pcgdxq.list}"  var="pcgdxq">                   
            					 <tr>
                   					 <td><input type="checkbox" name="c1" class="c1" value="${pcgdxq.cgXqId}"></td>
                    
                                 	<td>${pcgdxq.cgXqId}</td>
									<td id="cgdId">${pcgdxq.cgdId}</td>
				                    <td>${pcgdxq.cpId}</td>
				                    <td>${pcgdxq.cpNumber} </td>
				                    <td>${pcgdxq.cpPrice} </td>
				                    <td>${pcgdxq.isRk} </td>
				                    <td>${pcgdxq.operator} </td>
				                    <td>${pcgdxq.remark} </td>
				                    <td>${pcgdxq.gsId} </td>
				                    <td>${pcgdxq.ltime} </td>    
				                    <td>
				                   		<td>
										<c:if test="${pcgdxq.isRk=='未入库'}">							
										<a href="../KCGSControllerCtrl/cgdxqRk.do?cgdId=${pcgdxq.cgdId }&cgXqId=${pcgdxq.cgXqId}">入库</a>
										</c:if>
										<a href="cgdxqDelete.do?cgdId=${pcgdxq.cgdId}&cgdxqId=${pcgdxq.cgXqId}" target="_self" >删除</a>	
										</td>
				                   </td>
               		 </tr>
			       
            </c:forEach>
          
                	 
         </tbody>
        </table>
        	
             <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
        		 	<tr>
			             <td style="text-align: center;" colspan="8">
			                <a href="cgdxqList.do?pageNum=${pcgdxq.firstPage }" target="_self">首页</a>
			                <a href="cgdxqList.do?pageNum=${pcgdxq.prePage }" target="_self">上一页</a>
			                <a href="cgdxqList.do?pageNum=${pcgdxq.nextPage }" target="_self">下一页</a>
			                <a href="cgdxqList.do?pageNum=${pcgdxq.lastPage }" target="_self">尾页</a>
			                                       当前${pcgdxq.pageNum }/${pcgdxq.pages }页，共${pcgdxq.total }条
			             </td>
			          </tr> 
			 </table>
    </div>
  </body>
</html>




<script type="text/javascript">
	$(document).ready(function(){
	
	

	
	//选中删除
	$("#deleteSelect").click(function(){
	
		 var myArr=new Array();
		 var a=""
		myArr=$("input[name='c1']")
		var i
		for(i=0;i<myArr.length;i++){
			if(myArr[i].checked==true){
				a+="cgdxqId="+myArr[i].value+"&";
			}
		}
		
		/* $("#cgdxqId").html()
		$("#cgdId").html() */
	
			location.href="cgdXqCtrl/cgdDeleteSelect.do?"+a;
			
	})
			//仿百度提示搜索
		
			/* 	$("#t1").keyup(function(){
				
						if($("#t1").val()!=""){
							var data=$(this).val();
							$.post("GongYingShangctrl/gysSearch.do",{data:data},function(data,status){
								
										$("#div1").show();
										$("#div1").html(data)
									
								
							})
						}else{
							$("#div1").hide()
						}
				}) */
			
				
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




   <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/plugins/footable/footable.all.min.js"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
	<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
