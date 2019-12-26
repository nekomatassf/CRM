<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!--日期格式化  -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 表单验证 jQuery Validation</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>任务考核修改</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="commentForm" action="/" target="_self">
                          <c:forEach items="${p.list }" var="k">
                             <div class="form-group">
                                 <label class="col-sm-3 control-label">任务编号：</label>
                                <div class="col-sm-8">
                                    <input id="cname" name="kpiId" minlength="2" type="text" value="${k.kpiId }"readonly="readonly" class="form-control" required="" aria-required="true">
                                </div>
                             </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">任务考核指标：</label>
                                <div class="col-sm-8">
                                    <input id="cemail" type="text" class="form-control" name="kpiKpi" value="${k.kpiKpi}"required="" aria-required="true">
                                </div>
                             </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">考核备注：</label>
                                <div class="col-sm-8">
                                <textarea id="ccomment" name="kpiDetail" class="form-control" value="${k.kpiDetail }" required="" aria-required="true"></textarea>
                                </div>
                             </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">所属公司：</label>
                                <div class="col-sm-8">
                                <input id="curl" type="text" class="form-control" name="companyId" value="${k.companyId }">
                                    </div>
                             </div>
                             <input type="hidden" name="finalUpdataTime" value="<%=new Date().getTime() %>">
                          </c:forEach>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button class="btn btn-primary" type="reset">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=basePath %>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath %>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath %>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath %>js/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=basePath %>js/plugins/validate/messages_zh.min.js"></script>
    <script src="<%=basePath %>js/demo/form-validate-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>
