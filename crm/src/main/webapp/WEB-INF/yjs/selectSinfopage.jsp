<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>销售详情信息</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="<%=basePath%>favicon.ico">
<link href="<%=basePath%>css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="<%=basePath%>css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="<%=basePath%>css/plugins/footable/footable.core.css"
	rel="stylesheet">
  	<script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
<link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
<link href="<%=basePath%>css/style.min.css?v=4.0.0" rel="stylesheet">
<base target="_blank">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">

		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">

						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="#">选项 01</a></li>
								<li><a href="#">选项 02</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<!-- <div class="ibox-content">
					<form action="listPage.do" method="post" target="_self">
					<input type="text" id="t1" name="sorderInfoId" 
						placeholder="请输入销售单详情编号，或销售单编号，或商品编号" style=" width: 450px;
						height: 30px;font-size: 16pt; ">
   					&nbsp;
		   			<button  id="b1"  type="sumbit"  class="btn btn-primary btn-lg" 
		   			 style="width: 100px;height: 30px;
		   			border: 1px solid blue;position: absolute;top: 63px;line-height: 10px" >搜索</button>
		   			</form>
		   			<br>
		   			<h2><a href="add.do" target="_self">添加</a></h2>
		   			<br> -->
		   			
		   			<h2><a href="add.do" target="_self">添加</a></h2> 
		   			<h2><a id="deleteSelect" target="_self">删除选中</a></h2> 

						<table class="footable table table-stripped toggle-arrow-tiny"
							data-page-size="8">
							<thead>
								<tr>
									<th data-toggle="true"><input type="checkbox" id="selectAll" ></th>
									<th>销售单详情编号</th>
									<th>销售单编号</th>
									<th>商品编号</th>
									<th>商品数量</th>
									<th>商品价格</th>
									<th>备注说明</th>
									<th>公司编号</th>
									<th>最后修改时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
				                   <c:forEach items="${p.list}" var="k">
									<tr style="text-align: center;">
									<td><input type="checkbox" name="c1" class="c1" value="${k.sorderInfoId}"></td>
										<td>${k.sorderInfoId}</td>
										<td>${k.sorderId}</td>
										<td>${k.goodsId}</td>
										<td>${k.goodsQuantity}</td>
										<td>${k.goodsPrice}</td>
										<td>${k.note}</td>
										<td>${k.companyId}</td>
										<td>${k.lastModifyTime}</td>
										<td>
										<fmt:formatDate value="${k.lastModifyTime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
										<td>										
										<a href="goupdate.do?sid=${k.sorderInfoId }" target="_self">修改</a>
										<a href="delete.do?sid=${k.sorderInfoId}"onclick="return confirm('是否确定删除？')" target="_self">删除</a>
											
											</td>
											</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td style="text-align: center;" colspan="12"><a
									target="_self"
										href="listPage1.do?pageNum=${p.firstPage }">首页</a>
										<a target="_self" href="listPage1.do?pageNum=${p.prePage }">上一页</a>
										<a target="_self" href="listPage1.do?pageNum=${p.nextPage }">下一页</a>
										<a target="_self" href="listPage1.do?pageNum=${p.lastPage }">尾页</a>
										当前${p.pageNum }/${p.pages }页，共${p.total }条</td>
								</tr>
						 </tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
	

		 //全选
		$("#selectAll").click(function(){
			if($(this).prop("checked")){
				$(".c1").prop("checked", true)
			}else{
				$(".c1").prop("checked",false)
			}
		})
	
		//选中删除
		$("#deleteSelect").click(function(){
		
			 var myArr=new Array();
			 var a=""
			myArr=$("input[name='c1']")
			var i
			for(i=0;i<myArr.length;i++){
				if(myArr[i].checked==true){
					a+="sid="+myArr[i].value+"&";
				}
			}
				var isdelete=confirm("是否确定删除？" );
				if(isdelete){
					location.href="sinfoDeleteSelect.do?"+a;
				}
			
		})
			
				
	})
</script>
