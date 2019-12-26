<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Khinfo.jsp' starting page</title>
    
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
    <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                       <form action="SalekhinfoController/list.do" method="post" target="_self">
                            <div class="input-group">
                            <input type="text" placeholder="请输入客户名称" name="userName" class="input form-control">
                            <span class="input-group-btn">
                            <button type="submit" class="btn btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
                            </span>    
                        </div>
                        </form>
                        </div>
                        <br>
                         <a href="Khinfoadd.jsp" target="_self">
                         <button type="button" class="btn btn-w-m btn-primary">添加客户</button>
                         </a>
                         <button type="button" class="btn btn-w-m btn-primary">总条数：${p.total}</button>
                         <a href="SalekhinfoController/list.do" target="_self">
                         <button type="button" class="btn btn-w-m btn-primary">返回上一级</button>
                         </a>
                        <br>

                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                                <thead>
                                <tr>

                                    <th data-toggle="true">客户编号</th>
                                    <th data-hide="all">客户名称</th>
                                    <th data-hide="all">客户属性</th>
                                    <th data-hide="all">客户类型</th>
                                    <th data-hide="all">移动电话</th>
                                    <th data-hide="all">公司编号</th>
                                    <th data-hide="all">下次联系信息</th>
                                    <th data-hide="all">详细信息</th>
                                    <th data-hide="all">状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${p.list}" var="info" >
                                <tr>
                                    <td>${info.userId}</td>
                                    <td>${info.userName}</td>
                                    <td>${info.userAttribute}</td>
                                    <td>${info.userType}</td>
                                    <td><span class="pie">${info.mphone}</span></td>
                                    <td>${info.companyId}</td>
                                    <td><fmt:formatDate value="${info.nextContactTime}" pattern="yyyy-MM-dd"/></td>
                                    <td>                                    
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#${info.userName}">
                                                                             查看详情 
                                    </button>
                            <div class="modal inmodal fade" id="${info.userName}" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">详细信息</h4>
                                        </div>
                                        <div class="modal-body">
                                           
                                           <span><ul><li>客户名称：${info.userName} </li></ul></span> 
                                           <span><ul><li>客户属性：${info.userAttribute}</li></ul></span>
                                           <span><ul><li>网站：${info.web}</li></ul></span>
                                           <span><ul><li>股票代号：${info.stockCode}</li></ul></span>
                                           <span><ul><li>上级单位：${info.superiorUnit}</li></ul></span>
                                           <span><ul><li>所有人：${info.owner}</li></ul></span>
                                           <span><ul><li>员工数：${info.employeesNumber}</li></ul></span>
                                           <span><ul><li>行业编码：${info.industryId}</li></ul></span>
                                           <span><ul><li>客户类型：${info.userType}</li></ul></span>
                                           <span><ul><li>客户状态：${info.userState}</li></ul></span>
                                           <span><ul><li>客户来源：${info.userSource}</li></ul></span>
                                           <span><ul><li>固定电话：${info.gdphone}</li></ul></span>
                                           <span><ul><li>移动电话：${info.mphone}</li></ul></span>
                                           <span><ul><li>客户传真：${info.userFax}</li></ul></span>
                                           <span><ul><li>开户银行：${info.depositBank}</li></ul></span>
                                           <span><ul><li>银行账户：${info.bankAccount}</li></ul></span>
                                           <span><ul><li>下次联系时间：<fmt:formatDate value="${info.nextContactTime}" pattern="yyyy-MM-dd"/></li></ul></span>
                                           <span><ul><li>电子邮箱：${info.eMail}</li></ul></span>
                                           <span><ul><li>SIC编码：${info.sicCode}</li></ul></span>
                                           <span><ul><li>支付方式：${info.payMethod}</li></ul></span>
                                           <span><ul><li>是否有效：${info.isEffective}</li></ul></span>
                                           <span><ul><li>详细地址：${info.detailedAddress}</li></ul></span>
                                           <span><ul><li>备注信息：${info.remarksInfo}</li></ul></span>
                                           <span><ul><li>公司编号：${info.companyId}</li></ul></span>
                                           <span><ul><li>最后修改时间：${info.lastModified}</li></ul></span>
                                        </div>
                                        <div class="modal-footer">
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                                    </td>
                                    <td>${info.userState}</td>
                                    <td>
                                    <button class="btn btn-outline btn-info  dim" data-toggle="modal" data-target="#${info.userId}"  data-placement="bottom" title="编辑">
                                     <i class="fa fa-paste"></i>
                                    </button>
                                    
                                <div class="modal inmodal fade" id="${info.userId}" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">编辑界面</h4>
                                        </div>
                                        <form action="SalekhinfoController/update.do" method="post" target="_self">
                                        <div class="modal-body">
                                              <div>
                                              <input type="hidden" name="userId" value="${info.userId}">
                                              
                                              &emsp;&emsp;&emsp;&emsp;<span>客户名称：<input type="text" name="userName"  value="${info.userName}" ></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>客户属性：<input type="text" name="userAttribute"  value="${info.userAttribute}"></span>
                                              </div>
                                              <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>网&emsp;&emsp;站：<input type="text" name="web"  value="${info.web}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>股票代号：<input type="text" name="stockCode"  value="${info.stockCode}"></span>
                                              </div>
                                              <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>上级单位：<input type="text" name="superiorUnit"  value="${info.superiorUnit}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>所有人：&emsp;<input type="text" name="owner"  value="${info.owner}"></span>
                                              </div>
                                              <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>员工数：&emsp;<input type="text" name="employeesNumber"  value="${info.employeesNumber}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>行业编码：<input type="text" name="industryId"  value="${info.industryId}"></span>
                                              </div>
                                              <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>客户类型：<input type="text" name="userType"  value="${info.userType}"></span>
                                              &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>
                                                                               客户状态：<select style="width:180px;height:22px" name="userState">
                                                  <option  value="正在合作">正在合作</option>
                                                  <option  value="合作终止">合作终止</option>
                                              </select></span>
                                              </div>
                                                                                            <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>客户来源：<input type="text" name="userSource"  value="${info.userSource}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>固定电话：<input type="text" name="gdphone"  value="${info.gdphone}"></span>
                                              </div>
                                                                                            <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>移动电话：<input type="text" name="mphone"  value="${info.mphone}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>客户传真：<input type="text" name="userFax"  value="${info.userFax}"></span>
                                              </div>
                                                                                            <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>开户银行：<input type="text" name="depositBank"  value="${info.depositBank}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>银行账户：<input type="text" name="bankAccount"  value="${info.bankAccount}"></span>
                                              </div>
                                                                                            <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>公司编号：<input type="text" name="companyId"  value="${info.companyId}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>电子邮箱：<input type="text" name="eMail"  value="${info.eMail}"></span>
                                              </div>
                                                                                            <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>SIC编码：<input type="text" name="sicCode"  value="${info.sicCode}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>支付方式：<input type="text" name="payMethod"  value="${info.payMethod}"></span>
                                              </div>
                                              <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>是否有效：<input type="text" name="isEffective"  value="${info.isEffective}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>详细地址：<input type="text" name="detailedAddress"  value="${info.detailedAddress}"></span>
                                              </div>
                                                                                            <div>
                                              &emsp;&emsp;&emsp;&emsp;<span>备注信息：<input type="text" name="remarksInfo"  value="${info.remarksInfo}"></span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span>下次联系时间：<input type="text" name="nextContactTime"  value="<fmt:formatDate value="${info.nextContactTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"></span>
                                              </div>
                                                       
                                        </div>

                                      <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="submit" class="btn btn-primary">保存</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                                    
                                    <a href="SalekhinfoController/lxcx.do?name=${info.userName}&id=${info.userId}" target="_self">联系人</a> 
                                    <a href="SalekhlxjlController/fkcx.do?name=${info.userName}&id=${info.userId}" target="_self">反馈</a></td>
                                    
                                </tr>
                                </c:forEach>
                                
                                <tr>
                                    <td style="text-align: center;" colspan="10">
                                    <a target="_self" href="SalekhinfoController/list.do?pageNum=${p.firstPage }">首页</a>
                                    <a target="_self" href="SalekhinfoController/list.do?pageNum=${p.prePage }">上一页</a>
                                    <a target="_self" href="SalekhinfoController/list.do?pageNum=${p.nextPage }">下一页</a>
                                    <a target="_self" href="SalekhinfoController/list.do?pageNum=${p.lastPage }">尾页</a>
                                                                             当前${p.pageNum }/${p.pages }页，共${p.total }条
                                     </td>
                                </tr>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="10">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath%>js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
  </body>
</html>
<script>
$(document).ready(function(){
   if(${iscg=="yes"}){
   swal({title:"太帅了",text:"添加成功",type:"success"})
   }
});
</script>