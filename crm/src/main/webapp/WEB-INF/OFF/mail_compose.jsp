<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 写信</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=basePath %>css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=basePath %>css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="<%=basePath %>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
		
	 <link rel="stylesheet" type="text/css" href="https://raw.githack.com/hnzzmsf/layui-formSelects/master/dist/formSelects-v4.css" /> 
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            
                            <div class="space-25"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li>
                                    <a href="../offmessdetactrl/listpagedeta.do"  target="_self"> <i class="fa fa-inbox "></i> 收件箱 
                                    </a>
                                </li>
                                <li>
                                    <a href="../offmessctrl/listpage.do"  target="_self"> <i class="fa fa-envelope-o"></i> 已发送</a>
                                </li>
                               

                                <li>
                                    <a target="_self" href="../offmessdetactrl/listlajixiang.do"> <i class="fa fa-trash-o"></i> 垃圾箱</a>
                                </li>
                            </ul>
                      
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="mail-box-header">
                    <div class="pull-right tooltip-demo">
                        
                    </div>
                    <h2>
                    	写信
                </h2>
                </div>
                <div class="mail-box">


                    <div class="mail-body">

                        <form target="_self" action="../offmessctrl/add.do" class="form-horizontal" method="post" onsubmit="cs(this)">
                            <div class="form-group">
                                <!-- <label class="col-sm-2 control-label">发送到：</label> -->
				
								<div  >
								<div style="padding-left:149px;width: 790px" >
            					发送到：<select name="city" xm-select="select1">
            					 <c:forEach items="${users}" var="u">
               						 <option value="${u.usersId }" >${u.usersName }</option>
               					</c:forEach>
              					  
            					<select>
            					</div>
        						</div>                             
                            </div>
                            <script type="text/javascript">
                            
                            function cs(x){
                           /*  alert("进入js了"); */
		                         var sid="";
		                          $(".xm-select-this").each(function(i,e) {	
		                    	
			                         sid += "sid=" + $(this).attr("lay-value")+"&";
			                         
		                                   });
		                                   
		                                  x.action=x.action+"?"+sid;
		                                          /* alert(x.action); */
                            }
              
                            </script>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">主题：</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" value=""  name="title">
                                </div>
                            </div>
            
                    </div>

		<!-- 模板自带 消息发送框样式
                    <div class="mail-text h-200">
                        <div class="summernote">
                            <p>在此输入内容</p>
                        </div>
                    </div>-->
                    <div style="padding-left: 75px ">
                   <textarea rows="10" cols="100"  name="content"></textarea>
                  </div>
              
                    
                    <div class="mail-body text-right tooltip-demo">
                        <input  class="btn btn-sm btn-primary" type="submit" value="发送">
                        <!-- <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i> 放弃</a>
                        <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to draft folder"><i class="fa fa-pencil"></i> 存为草稿</a> -->
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    </form>
    <script src="<%=basePath %>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath %>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath %>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath %>js/plugins/iCheck/icheck.min.js"></script>
    <script src="<%=basePath %>js/plugins/summernote/summernote.min.js"></script>
    <script src="<%=basePath %>js/plugins/summernote/summernote-zh-CN.js"></script>
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});$(".summernote").summernote({lang:"zh-CN"})});var edit=function(){$(".click2edit").summernote({focus:true})};var save=function(){var aHTML=$(".click2edit").code();$(".click2edit").destroy()};
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	
 	<script src="https://unpkg.com/jquery@3.4.1/dist/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script src="https://raw.githack.com/hnzzmsf/layui-formSelects/master/dist/formSelects-v4.min.js" type="text/javascript"
         charset="utf-8"></script> 
</body>

</html>