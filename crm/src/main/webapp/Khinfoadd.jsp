<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!--日期格式化  -->
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
    <base target="_blank">

  </head>
  
  <body class="gray-bg">
    <center>
    <h1>添加客户信息</h1>
    </center>
    
         <div class="ibox-content">
             <form class="form-horizontal m-t" id="commentForm" action="SalekhinfoController/add.do" method="post" target="_self">                
                   <div class="form-group">
                        <label class="col-sm-3 control-label">客户名称：</label>
                        <div class="col-sm-8">
                            <input id="userName" name="userName" class="form-control" type="text" required>
                        </div>
                    </div>
                    <div class="form-group">
                                <label class="col-sm-3 control-label">客户属性：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="userAttribute">
                                        <option  value="民营企业">民营企业</option>
                                        <option  value="国营企业">民营企业</option>
                                    </select>
                              </div>   
                    </div>
                  
                    <div class="form-group">
                        <label class="col-sm-3 control-label">网站:</label>
                        <div class="col-sm-8">
                            <input id="web" name="web" class="form-control" type="text" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">股票代号：</label>
                        <div class="col-sm-8">
                            <input id="stockCode" name="stockCode" class="form-control" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">上级单位：</label>
                        <div class="col-sm-8">
                            <input id="superiorUnit" name="superiorUnit" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所有人：</label>
                        <div class="col-sm-8">
                            <input id="owner" name="owner" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">员工数：</label>
                        <div class="col-sm-8">
                            <input id="employeesNumber" name="employeesNumber" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">行业编码：</label>
                        <div class="col-sm-8">
                            <input id="industryId" name="industryId" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户类型：</label>
                        <div class="col-sm-8">
                            <input id="userType" name="userType" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                                <label class="col-sm-3 control-label">客户状态：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="userState">
                                        <option  value="正在合作">正在合作</option>
                                        <option  value="合作终止">合作终止</option>
                                    </select>
                              </div>   
                    </div>
                   
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户来源：</label>
                        <div class="col-sm-8">
                            <input id="userSource" name="userSource" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">固定电话：</label>
                        <div class="col-sm-8">
                            <input id="gdphone" name="gdphone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">移动电话：</label>
                        <div class="col-sm-8">
                            <input id="mphone" name="mphone" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户传真：</label>
                        <div class="col-sm-8">
                            <input id="userFax" name="userFax" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                                <label class="col-sm-3 control-label">开户银行：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="depositBank">
                                        <option  value="农业银行">农业银行</option>
                                        <option  value="建设银行">建设银行</option>
                                        <option  value="工商银行">工商银行</option>
                                        
                                    </select>
                              </div>   
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label">银行账户：</label>
                        <div class="col-sm-8">
                            <input id="bankAccount" name="bankAccount" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">下次联系时间：</label>
                        <div class="col-sm-8">
                        <input type="text" class="form-control" name="nextContactTime" data-mask="9999-99-99 99:99:99" placeholder="" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电子邮箱：</label>
                        <div class="col-sm-8">
                            <input id="eMail" name="eMail" class="form-control" type="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">SIC编码：</label>
                        <div class="col-sm-8">
                            <input id="sicCode" name="sicCode" class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group">
                                <label class="col-sm-3 control-label">支付方式：</label>
                                <div class="col-sm-8">
                                    <select class="form-control m-b" name="payMethod">
                                        <option  value="支付宝">支付宝</option>
                                        <option  value="微信">微信</option>
                                        <option  value="银行转账">银行转账</option>
                                        
                                    </select>
                              </div>   
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label">是否有效：</label>
                        <div class="col-sm-8">
                            <input id="isEffective" name="isEffective" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">详细地址：</label>
                        <div class="col-sm-8">
                            <input id="detailedAddress" name="detailedAddress" class="form-control">
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
    <script>
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("../example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
    </script>

