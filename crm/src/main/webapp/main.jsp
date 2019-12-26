<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>CRM系统</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="upload/${nowuser.sysUserinfo.empPhoto }" style="height: 80px;width: 80px"/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">你好：${nowuser.usersName }</strong></span>
                                <span class="text-muted text-xs block">${cinfo.companyName }公司<b class="caret"></b></span>
                                </span>
                            </a>
                            <!-- <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="profile.html">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="logout.do" onclick="return confirm('是否确认退出？')">安全退出</a>
                                </li>
                            </ul> -->
                   
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">系统管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                       
                            <li>
                                <a href="#">权限管理<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="SysPowerColumnsCtrl/inAddPowerColumns.do">添加权限分栏</a>
                                    </li>
                                    <li><a class="J_menuItem" href="SysPowerinfoCtrl/goaddPower.do">添加基本权限</a>
                                    </li>
                                    <li><a class="J_menuItem" href="SysPowerColumnsCtrl/PowerinfoList.do">查看所有权限</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">角色管理<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="SysRoleCtrl/goaddRole.do">添加角色</a>
                                    </li>
                                    <li><a class="J_menuItem" href="SysRoleCtrl/roleList.do">角色列表</a>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#">用户管理<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="SysUsersCtrl/userList.do?isall=yes">用户列表</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">日志管理<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="SysLogCtrl/selectLog.do?isall=yes">日志信息</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>  
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">人事管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="SysUsersInfoCtrl/listPage.do">员工信息</a>
                            </li>
                            <li><a class="J_menuItem" href="SyDeptCtrl/listPage.do">部门信息</a>
                            </li>
                            <li><a class="J_menuItem" href="SysPostCtrl/listPage.do">职务信息</a>
                            </li>
                            <li><a class="J_menuItem" href="SysCompanyInfoCtrl/listPage.do">公司信息</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">库存管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">库存_仓库<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">                                   
                                    <li><a class="J_menuItem" href="KCCKControllerCtrl/listPage.do">仓库信息</a>
                                    </li>
                                </ul>
                            </li>
                             
                            <li>
                                <a href="#">库存_商品信息<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                   
                                    <li><a class="J_menuItem" href="KCGSControllerCtrl/listPage.do">仓库商品信息</a>
                                    </li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="cgdXqCtrl/cgdxqList.do">采购_出库<span class="fa arrow"></span></a>
                               
                            </li>  
                            
                              
                            <li>
                                <a href="#">销售_出库单<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">                                    
                                    <li><a class="J_menuItem" href="SOUTControllerCtrl/listPage.do">销售_出库单</a>
                                    </li>
                                </ul>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">办公管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="offmessctrl/listpage.do">短消息</a>
                            </li>
                            <li><a class="J_menuItem" href="offmessdetactrl/richeng.do">个人日程</a>
                            </li>
                            <li>
                                <a href="#">办公考核 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="OfficeTaskAssessmentController/listpage.do">办公考核任务 </a>
                                    </li>
                                    <li><a class="J_menuItem" href="OfficeKpictrl/listpage.do">办公考核指标 </a>
                                    </li>
                                    <li><a class="J_menuItem" href="OfficeTaskDetailController/listpage.do">办公任务详情</a>
                                    </li>
                                </ul>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">销售管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="KCCKControllerCtrl/listPage.do">库存_仓库信息表</a>
                            </li>
                             <li><a class="J_menuItem" href="#">库存_商品信息表</a>
                            </li>
                            <li>
                                <a href="#">客户管理 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="SalekhinfoController/list.do">客户信息</a>
                                    </li>
                                    <li><a class="J_menuItem" href="SalekhlossController/list.do">客户流失</a>
                                    </li>
                                </ul>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">进货管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="GongYingShangctrl/list.do">供应商</a></li>
                            <li><a class="J_menuItem" href="caiGouDanCtrl/cgdList.do">采购单</a></li>
                            <li><a class="J_menuItem" href="xuBuHuoCtrl/xbhList.do">需补货</a></li>
                            
                            
                            
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="mson.jsp">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose J_tabCloseAll" >关闭全部

                    </button>
                    
                </div>
                <a href="logout.do" class="roll-nav roll-right J_tabExit" onclick="return confirm('是否确认退出？')"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="mson.jsp" frameborder="0" data-id="mson.jsp" seamless></iframe>
            </div>
            
        </div>
        <!--右侧部分结束-->
        
        
       
    </div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.5"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>
    <script src="js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="js/contabs.min.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
</body>

</html>
