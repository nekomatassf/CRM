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
    <base href="<%=basePath%>">
    
    <title>My JSP 'goupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
      <center>
         <form action="OfficeKpictrl/OfficeKpiupdate.do" method="post" target="_self">
         <table style="font-family:宋体; ">
          
           <tr style="font-family:宋体; ">
              <td style="font-family:宋体; ">任务编号</td>
              <td style="font-family:宋体; "><input type="text" name="kpiId" value="${kpi.kpiId}" readonly="readonly"></td>
           </tr>
           <tr style="font-family:宋体; ">
              <td style="font-family:宋体; ">任务考核指标</td>
              <td style="font-family:宋体; "><input type="text" name="kpiKpi" value="${kpi.kpiKpi}"></td>
           </tr>
           <tr style="font-family:宋体; ">
              <td style="font-family:宋体; ">备注信息</td>
              <td style="font-family:宋体; "><input type="text" name="kpiDetail" value="${kpi.kpiDetail }"></td>
           </tr>
            <tr style="font-family:宋体; ">
              <td style="font-family:宋体; ">公司编号</td>
              <td style="font-family:宋体; "><input type="text" name="companyId" value=" ${kpi.companyId }"></td>
            </td>
            </tr>
           
            <tr style="font-family:宋体; "><td style="font-family:宋体; "><input type="submit" value="提交"></td><td><input type="reset" value="重置"></td></tr>
         </table>
         </form> 
      </center>
      </body>
</html>
      