<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>H+ 后台主题UI框架 - 查看收件箱详情</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="<%=basePath %>favicon.ico"> <link href="<%=basePath %>css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=basePath %>css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath %>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            <a class="btn btn-block btn-primary compose-mail" href="mail_compose.html">写信</a>
                            <div class="space-25"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li>
                                   <a href="../offmessdetactrl/listpagedeta.do"  target="_self"><i class="fa fa-envelope-o"></i> 收件箱</a>
                                </li>
                                <li>
                                     <a href="../offmessctrl/listpage.do"  target="_self"> <i class="fa fa-envelope-o"></i> 已发送</a>
                                </li>
                               
                                <li>
                                    <a target="_self" href="../offmessdetactrl/listlajixiang.do"> <i class="fa fa-trash-o"></i> 垃圾箱</a>
                                </li>
                            </ul>
                      
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="mail-box-header">
                    
                    <h2>
                    查看详情
                </h2>
                    <div class="mail-tools tooltip-demo m-t-md">


                        <h3>
                        <span class="font-noraml">主题： </span>${m.offMess.title }
                    </h3>
                        <h5>
                        <span class="pull-right font-noraml"><fmt:formatDate value="${m.offMess.lasttime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        <span class="font-noraml">发件人： </span>${m.offMess.sender }
                    </h5>
                    </div>
                </div>
                <div class="mail-box">


                    <div class="mail-body">
                       
                      内容：  <p>
                           ${m.offMess.content }
                        </p>

                        <p class="text-right">
                           思创IT培训有限公司
                        </p>
                    </div>
                    
                    <div class="mail-body text-right tooltip-demo">
                        <a target="_self" class="btn btn-sm btn-white" href="../offmessdetactrl/listpagedeta.do"><i class="fa fa-reply"></i> 返回</a>
                        
                        
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=basePath %>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath %>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath %>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath %>js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>