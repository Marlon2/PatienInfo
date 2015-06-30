<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的预约</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/table.css" />
</head>
<body>
<div align="center">
<h2>预约信息</h2>
<br>
	<table class="table" style="width: 600px;">
		<tr>
			<th>预约人</th>
			<th>预约医生</th>
			<th>预约时间</th>
			<th>预约号码</th>
		</tr>
		<s:iterator value="yuyues" var="yuyue">
		<tr>
			<th>${sick.sickName }</th>
			<th><s:property value="#yuyue.info" /></th>
			<th><s:date name="#yuyue.yuyuetime" format="yyyy-MM-dd" /></th>
			<th><s:property value="#yuyue.turnnum" /></th>
		</tr>
		</s:iterator>
	</table>
	</div>
</body>
</html>