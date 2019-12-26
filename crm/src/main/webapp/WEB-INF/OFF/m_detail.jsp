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
    

    <title>H+ 后台主题UI框架 - 查看已发送详情</title>
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
                                    <a target="_self" href="../offmessdetactrl/listpagedeta.do"> <i class="fa fa-inbox "></i> 收件箱 <!-- <span class="label label-warning pull-right">16</span> -->
                                    </a>
                                </li>
                                <li>
                                    <a target="_self" href="../offmessctrl/listpage.do"> <i class="fa fa-envelope-o"></i> 已发送</a>
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
                    <div class="pull-right tooltip-demo">
                        <!-- <a href="mail_compose.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="回复"><i class="fa fa-reply"></i> 回复</a>
                        <a href="mail_detail.html#" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="打印邮件"><i class="fa fa-print"></i> </a>
                        <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="标为垃圾邮件"><i class="fa fa-trash-o"></i> </a> -->
                    </div>
                    <h2>
                    查看邮件
                </h2>
                    <div class="mail-tools tooltip-demo m-t-md">

						<c:forEach items="${list }" var="m">
                        <h3>
                        <span class="font-noraml">主题： </span>${m.title }
                    </h3>
                        <h5>
                        <span class="pull-right font-noraml"><fmt:formatDate value="${m.lasttime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        <%-- <span class="font-noraml">收件人： </span>
                        <c:forEach items="${m.offMessdeta }" var="d">
                                 ${d.uanme}
                                 </c:forEach> --%>
                    </h5>
                    </div>
                </div>
                <div class="mail-box">


                    <div class="mail-body">
                        

                        <p>
                          ${m.content }
                        </p>

                        <p class="text-right">
                            思创IT培训有限公司
                        </p>
                    </div>
                    </c:forEach>
                    

                            <div class="file-box">
                               

                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="mail-body text-right tooltip-demo">
                        <a class="btn btn-sm btn-white" target="_self" href="../offmessctrl/listpage.do"><i class="fa fa-reply"></i> 返回</a>
                       <!--  <a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-arrow-right"></i> 下一封</a>
                        <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="打印这封邮件" class="btn btn-sm btn-white"><i class="fa fa-print"></i> 打印</button>
                        <button title="" data-placement="top" data-toggle="tooltip" data-original-title="删除邮件" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> 删除</button> -->
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