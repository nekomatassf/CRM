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
    

    <title>H+ 后台主题UI框架 - 收件箱</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="<%=basePath %>favicon.ico"> <link href="<%=basePath %>css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=basePath %>css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath %>css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath %>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <link href="<%=basePath %>css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                           <a target="_self" class="btn btn-block btn-primary compose-mail" href="../offmessctrl/goadd.do">写信</a>
                            
                            
                            <div class="space-25"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li>
                                    <a  target="_self" href="../offmessdetactrl/listpagedeta.do"> <i class="fa fa-envelope-o"></i> 收件箱</a>
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

                    <form target="_self" method="get" action="../offmessdetactrl/sousuod.do" class="pull-right mail-search">
                        <div class="input-group">
                            <input type="text" class="form-control input-sm" name="search" placeholder="搜索邮件标题">
                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-sm btn-primary">
                                    	搜索
                                </button>
                            </div>
                        </div>
                    </form>
                    <h2>
                    收件箱 (${p.total })
                </h2>
                    <div class="mail-tools tooltip-demo m-t-md">
                        <div class="btn-group pull-right">
                         <a target="_self"  href="../offmessdetactrl/listpagedeta.do?pageNum=${p.prePage }">
                            <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i>
                            </button></a>
                            <a  target="_self" href="../offmessdetactrl/listpagedeta.do?pageNum=${p.nextPage }"><button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i>
                            </button>
                             </a>

                        </div>
                        <a target="_self" href="../offmessdetactrl/listpagedeta.do">
                        <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="
邮件列表" id="btn1"><i class="fa fa-refresh"></i> 刷新</button></a>
                        


                    </div>
                </div>
                <div class="mail-box">

                    <table class="table table-hover table-mail">
                        <tbody>
                            <tr class="unread">
                                <td class="check-mail">
                                    删除
                                </td>
                                <td class="mail-ontact">发件人</td>
                                
                                <td class="mail-subject">主题 </td>
                               
                                <td class=""><i class="fa fa-paperclip"></i></td>
                                
                                 <td class="mail-subject">状态 </td>
                                
                                <td class="text-right mail-date">发送时间</td>
                            </tr>
                             
                             <c:forEach items="${p.list }" var="d">
                            <tr class="read">
                                <td class="check-mail">
                                     <button   class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="放入垃圾箱">
                                     <a id="a1" target="_self" onclick="del(${d.detailsid })"
                                     href="javascript:;"  >
                                     <%-- ../offmessdetactrl/delete.do?did=${d.detailsid } --%>
                                     <i class="fa fa-trash-o"></i></a>
                        			</button>
                        			
                        			 
                            
                                </td>
                                
                                <td class="mail-ontact"><a target="_self" href="../offmessdetactrl/details.do?did=${d.detailsid }">${d.offMess.sender }</a> 
                                </td>
                                
                                <td class="mail-subject"><a target="_self" href="../offmessdetactrl/details.do?did=${d.detailsid }">${d.offMess.title }</a>
                                </td>
                                
                                <td class=""><i class="fa fa-paperclip"></i><a target="_self" href="../offmessdetactrl/details.do?did=${d.detailsid }">
                                </td>
                                
                                <td class="text-right mail-date"><a target="_self" href="../offmessdetactrl/details.do?did=${d.detailsid }">${d.messstate }</a></td>
                                
                                <td class="text-right mail-date"><a target="_self" href="../offmessdetactrl/details.do?did=${d.detailsid }"><fmt:formatDate value="${d.lasttime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                
                            </tr>
                            
                             </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script language="javascript">
    
</script>


    <script src="<%=basePath %>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath %>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath %>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath %>js/plugins/iCheck/icheck.min.js"></script>
     <script src="<%=basePath %>js/plugins/sweetalert/sweetalert.min.js"></script>
   
    <script>
       //swal({title:"欢迎使用SweetAlert",text:"Sweet Alert 是一个替代传统的 JavaScript Alert 的漂亮提示效果。"})
      
        
        
        $(document).ready(function(){
      
           $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})
        
           
        });
        
        function del(did){
        
               swal({title:"您确定要将这条消息放入垃圾箱吗？",
               		text:"删除后可从垃圾箱恢复！",
               		type:"warning",
               		showCancelButton:true,
               		confirmButtonColor:"#DD6B55",
               		confirmButtonText:"删除",
               		closeOnConfirm:false},
               		function(){
               		
			  			$.ajax({
			  				type: "post",
			  				url: "../offmessdetactrl/delete.do?did="+did,
			  				dataType:"json",
			  				success:function(d){
			  				    console.log(11111)
			  					swal({title:"删除成功！",text:"您已经删除了这条信息。",type:"success"},function(){
			  					    $("#btn1").click();
			  					});
			  					
			  				}
			  			});
               		    
               		 }
               	)
        
        }
        
        
        
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>