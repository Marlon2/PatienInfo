<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<script type="text/javascript"
	src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<style type="text/css">
* {
	font-size: 12pt;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tijiao").unbind('click').bind('click', function() {
			var flag = true;
			if ($("#loginname").val() == "") {
				$("#loginnamemsg").text("用户名不能为空！");
				flag = false;
			} else {
				$("#loginnamemsg").text("");
			}
			if ($("#pwd1").val() == "") {
				$("#pwd1msg").text("密码不能为空！");
				flag = false;
			} else {
				$("#pwd1msg").text("");
			}
			if ($("#pwd2").val() == "") {
				$("#pwd2msg").text("密码不能为空！");
				flag = false;
			} else {
				$("#pwd2msg").text("");
			}
			if ($("#truename").val() == "") {
				$("#truenamemsg").text("真实姓名不能为空！");
				flag = false;
			} else {
				$("#truenamemsg").text("");
			}
			if ($("#age").val() == "") {
				$("#agemsg").text("年龄不能为空！");
				flag = false;
			} else {
				$("#agemsg").text("");
			}
			if ($("#sid").val() == "") {
				$("#sidmsg").text("身份证号不能为空！");
				flag = false;
			} else {
				$("#sidmsg").text("");
			}
			if ($("#desc").val() == "") {
				$("#descmsg").text("描述不能为空！");
				flag = false;
			} else {
				$("#descmsg").text("");
			}
			var a = $("#pwd1").val();
			var b = $("#pwd2").val();
			if (a != b) {
				$("#pwd2msg").text("两次输入的密码不一致！");
				flag = false;
			} else {
				$("#pwd2msg").text("");
			}
			if (flag) {
				$("#from1").submit();
			}
		});
	});
</script>
</head>
<body>
	<div align="center">
		<div>
			<img alt="" src="../images/top1.png">
		</div>
		<form action="register" method="post" id="from1">
			<table>
				<tr>
					<th colspan="2"><br> <font color="red">新用户注册</font> <br>
						<br></th>
				</tr>
				<tr>
					<td>登&nbsp;陆&nbsp;名：</td>
					<td><input type="text" name="sick.sickName" id="loginname">
						<font color="red"><span id="loginnamemsg"></span></font></td>
				</tr>
				<tr>
					<td>输入密码：</td>
					<td><input type="password" name="sick.sickPwd" id="pwd1">
						<font color="red"><span id="pwd1msg"></span></font></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input type="password" name="pwd2" id="pwd2"> <font
						color="red"><span id="pwd2msg"></span></font></td>
				</tr>
				<tr>
					<td>真实姓名：</td>
					<td><input type="text" name="sick.trueName" id="truename">
						<font color="red"><span id="truenamemsg"></span></font></td>
				</tr>
				<tr>
					<td>性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
					<td><select style="width: 60px;" name="sick.sex" id="sex">
							<option>男</option>
							<option>女</option>
					</select> <font color="red"><span id="sexmsg"></span></font></td>
				</tr>
				<tr>
					<td>年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
					<td><input type="text" name="sick.age" id="age"> <font
						color="red"><span id="agemsg"></span></font></td>
				</tr>
				<tr>
					<td>身份证号：</td>
					<td><input type="text" name="sick.sid" id="sid"> <font
						color="red"><span id="sidmsg"></span></font></td>
				</tr>
				<tr>
					<td>症状描述：</td>
					<td><textarea name="sick.sickDesc" rows="5" cols="20"
							id="desc"></textarea> <font color="red"><span id="descmsg"></span></font></td>
				</tr>
				<tr>
					<th colspan='2'><br> 
					<input type="button" id="tijiao" value="提交">&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="清空"> <font color="red"">${msg }</font>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>