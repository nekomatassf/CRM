<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'khinfoadd.jsp' starting page</title>
    
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
    <base target="_self">

  </head>
  
  <body class="gray-bg">
    <center>
    <h1>添加联系人</h1>
    </center>
    
         <div class="ibox-content">
             <form class="form-horizontal m-t" id="commentForm" action="SalekhinfoController/lxadd.do" method="post" target="_self">                
                   <div class="form-group">
                        <input  name="userId" class="form-control" type="hidden" value="${id}">
                        <label class="col-sm-3 control-label">联系人姓名：</label>
                        <div class="col-sm-8">
                            <input id="contactName" name="contactName" class="form-control" type="text" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">英文名：</label>
                        <div class="col-sm-8">
                            <input  name="englishName" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid">
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <label class="col-sm-3 control-label">职务：</label>
                        <div class="col-sm-8">
                            <input id="post" name="post" class="form-control" type="text" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">部门：</label>
                        <div class="col-sm-8">
                            <input id="department" name="department" class="form-control" type="text" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机：</label>
                        <div class="col-sm-8">
                            <input id="mphone" name="mphone" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">办公电话：</label>
                        <div class="col-sm-8">
                            <input id="ophone" name="ophone" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电子邮箱：</label>
                        <div class="col-sm-8">
                            <input id="eMail" name="eMail" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">地址：</label>
                        <div class="col-sm-8">
                            <input id=address name="address" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注信息：</label>
                        <div class="col-sm-8">
                            <input id="remarksInfo" name="remarksInfo" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">公司编号：</label>
                        <div class="col-sm-8">
                            <input id="companyId" name="companyId" class="form-control" required>
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
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script src="js/plugins/validate/messages_zh.min.js"></script>
    <script src="js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>

