<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.com.model.Sick"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料修改</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/table.css" />
<style type="text/css">
input text {
	width: 150px;
	height: 20px;
}

input button {
	width: 100px;
	height: 30px;
}

select {
	width: 150px;
	height: 30px;
}
</style>
</head>
<body>
	<div align="center">
		<h2>个人资料</h2>
		<br>
		<form action="frontsick!update" method="post">
			<table class="table" style="width: 400px;">
				<tr>
					<th>用&nbsp;户&nbsp;名</th>
					<th><input type="text" name="sick.sickName"
						value="${sick.sickName }"></th>
				</tr>
				<tr>
					<th>真实姓名</th>
					<th><input type="text" name="sick.trueName"
						value="${sick.trueName }"></th>
				</tr>
				<tr>
					<th>性&nbsp;&nbsp;&nbsp;&nbsp;别</th>
					<th><select name="sick.sex">
							<option value="男"
								<%="男".equals(((Sick) session.getAttribute("sick")).getSex()) ? "selected"
					: ""%>>男</option>
							<option value="女"
								<%="女".equals(((Sick) session.getAttribute("sick")).getSex()) ? "selected"
					: ""%>>女</option>
					</select></th>
				</tr>
				<tr>
					<th>年&nbsp;&nbsp;&nbsp;&nbsp;龄</th>
					<th><input type="text" name="sick.age" value="${sick.age }"></th>
				</tr>
				<tr>
					<th>身份证号</th>
					<th><input type="text" name="sick.sid" value="${sick.sid }"></th>
				</tr>
				<tr>
					<th>病&nbsp;&nbsp;&nbsp;&nbsp;症</th>
					<th><input type="text" name="sick.sickDesc"
						value="${sick.sickDesc }"></th>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="保存">
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
					<s:if test="updateflag">
	                                        保存成功！
	                </s:if>
	                </th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>