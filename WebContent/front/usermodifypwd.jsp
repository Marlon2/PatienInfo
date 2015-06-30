<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	if (session.getAttribute("sick") == null) {
		response.sendRedirect(basePath + "/front/main.jsp");
	}
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/table.css" />
<script type="text/javascript"
	src="<%=basePath%>/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#msg2").hide();
		$("#btn").bind('click', function() {
			if ($("#pwd2").val() != $("#pwd3").val()) {
				$("#msg").text("两次密码不一致！！！");
				return;
			}
			if($("#pwd2").val()==""){
				$("#msg").text("密码不能为空！！！");
				return;
			}
			if ($("#pwd1").val() != $("#msg2").text()) {
				$("#msg").text("原密码不正确！！！");
				return;
			}
			window.location.href = "frontsick!modifyPwd?pwd="+$("#pwd2").val();
		});
	});
</script>
</head>
<body>
	<div align="center">
		<form action="frontsick!modifyPwd" method="post" id="formpwd">
			<h2>修改密码</h2>
			<br>
			<table class="table" style="width: 400px;">
				<tr>
					<th>原密码</th>
					<th><input type="password" id="pwd1"></th>
				</tr>
				<tr>
					<th>新密码</th>
					<th><input type="password" name="pwd" id="pwd2"><span
						id="msg2">${sick.sickPwd }</span></th>
				</tr>
				<tr>
					<th>确认密码</th>
					<th><input type="password" id="pwd3"></th>
				</tr>
				<tr>
					<th colspan="2">
						<span id="msg"></span>
					</th>
				</tr>
				<tr>
					<th colspan='2'><input type="button" id="btn" value="保存"><span>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type=button onclick="window.location.href='<%=basePath %>/frontDoctors.action'" value="返回">
							<s:if test="saveflag">
	                         <font color="red">保存成功！</font>
	                        </s:if>
					</span></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>