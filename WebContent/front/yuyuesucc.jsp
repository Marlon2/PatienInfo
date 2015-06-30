<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预约成功</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/table.css" />
</head>
<body>
	<br>
	<br>
	<br>
	<div align="center" style="width: 600px;">
		<s:if test="flag">
			<font color="red" size="5px;">预约成功！</font><br><br><br>
			<table class="table">
				<tr>
					<th>预约人</th>
					<th>预约医生</th>
					<th>预约日期</th>
					<th>预约号码</th>
				</tr>
				<tr>
					<th>${sick.sickName }</th>
					<th><s:property value="yuyue.info" /></th>
					<th><s:date name="yuyue.yuyuetime" format="yyyy-MM-dd" /> </th>
					<th><s:property value="yuyue.turnnum" /></th>
				</tr>
			</table>
		</s:if>
		<s:else>
预约失败。。。<br>${yuyuemsg }
</s:else>
	</div>
</body>
</html>