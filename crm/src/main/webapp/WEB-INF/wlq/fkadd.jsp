<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fkadd.jsp' starting page</title>
    
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
    <center>
    <h1>添加客户反馈</h1>
    </center>
    
         <div class="ibox-content">
             <form class="form-horizontal m-t" id="commentForm" action="SalekhlxjlController/fkadd.do" method="post" target="_self">                
                  
                   <div class="form-group">
                                <label class="col-sm-3 control-label">记录优先级：</label>
                                <input  name="userId" class="form-control" type="hidden" value="${id}">
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="recordPriority">
                                        <option  value="高">高</option>
                                        <option  value="中">中</option>
                                        <option  value="低">低</option>
                                    </select>
                              </div>   
                    </div>             
                    <div class="form-group">
                        <label class="col-sm-3 control-label">反馈类型：</label>
                        <div class="col-sm-8">
                            <input  name="feedbackType" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid" required>
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <label class="col-sm-3 control-label">反馈时间：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="feedbackTime" data-mask="9999-99-99 99:99:99" placeholder="" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">反馈主题：</label>
                        <div class="col-sm-8">
                            <input id="feedbaclTheme" name="feedbaclTheme" class="form-control" type="text" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">反馈描述：</label>
                        <div class="col-sm-8">
                            <input id="feedbackDiscribe" name="feedbackDiscribe" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">反馈来源：</label>
                        <div class="col-sm-8">
                            <input id="feedbackSource" name="feedbackSource" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">分析：</label>
                        <div class="col-sm-8">
                            <input id="analysis" name="analysis" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                                <label class="col-sm-3 control-label">状态：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="state">
                                        <option  value="未处理">未处理</option>
                                        <option  value="已处理">已处理</option>
                                    </select>
                              </div>   
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">负责人：</label>
                        <div class="col-sm-8">
                            <input id="personInCharge" name="personInCharge" class="form-control">
                        </div>
                    </div>
                                        
                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-3">
                            <button class="btn btn-primary" type="submit">提交</button>
                        </div>
                    </div>
             </form>
         </div>

<script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/chosen/chosen.jquery.js"></script>
    <script src="js/plugins/jsKnob/jquery.knob.js"></script>
    <script src="js/plugins/jasny/jasny-bootstrap.min.js"></script>
    <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
    <script src="js/plugins/nouslider/jquery.nouislider.min.js"></script>
    <script src="js/plugins/switchery/switchery.js"></script>
    <script src="js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="js/plugins/clockpicker/clockpicker.js"></script>
    <script src="js/plugins/cropper/cropper.min.js"></script>
    <script src="js/demo/form-advanced-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script src="js/plugins/validate/messages_zh.min.js"></script>
    <script src="js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
