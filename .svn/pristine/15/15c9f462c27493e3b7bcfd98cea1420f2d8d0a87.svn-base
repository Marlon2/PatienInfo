<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
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
<h2>个人资料</h2>
<br>
	<table class="table" style="width: 400px;">
		<tr>
			<th>用户名</th>
			<th>${sick.sickName }</th>
		</tr>
		<tr>
			<th>真实姓名</th>
			<th>${sick.trueName }</th>
		</tr>
		<tr>
			<th>性别</th>
			<th>${sick.sex }</th>
		</tr>
		<tr>
			<th>年龄</th>
			<th>${sick.age }</th>
		</tr>
		<tr>
			<th>身份证号</th>
			<th>${sick.sid }</th>
		</tr>
		<tr>
			<th>病症</th>
			<th>${sick.sickDesc }</th>
		</tr>
		<tr>
			<th colspan="2" ><input type=button onclick="window.location.href='<%=basePath%>/front/userinfomodify.jsp'" value="修改">
		    &nbsp;&nbsp;&nbsp;&nbsp;<input type=button onclick="window.location.href='<%=basePath %>/frontDoctors.action'" value="返回"></th>
		</tr>
	</table>
</div>
</body>
</html>