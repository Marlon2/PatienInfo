<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>医院自助挂号管理系统</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<style type="text/css">
* {
	font-size: 12pt;
}

body {
	text-align: center;
	margin-top: 0px;
}

.tab1 {
	position: relative;
	border: 1px solid gray;
	border-collapse: collapse;
	height: 654px;
	width: 924px;
}

.tab2 {
	position: relative;
	border: 1px solid gray;
	border-collapse: collapse;
	height: 224px;
	width: 250px;
}

.tab1 td {
	border: 1px solid gray;
}

.tab2 td {
	border: 1px solid gray;
	width: 55px;
	height: 14px;
}
.inputtext {
	width: 140px;
}
</style>
</head>
<body>
	<div align="center">
		<table class="tab1" >
			<tr>
				<td colspan="2" style="width: 924px; height: 150px;">
				<img alt="" src="<%=basePath %>/images/top.png">
				</td>
			</tr>
			<tr>
				<td align="center" valign="top" style="width: 250px;"  background="<%=basePath%>/images/left.png">
					<div style="width: 200; height: 100;" >
						<form action="userlogin" method="post">
							<h2>
								<font color="red">用户登录</font>
							</h2>
							<font color = "#fff">用户名：<input type="text" name="sick.sickName" class="inputtext"></font><br> 
							<font color = "#fff">密&nbsp;&nbsp;码：<input type="password" name="sick.sickPwd" class="inputtext"></font><br><font color="red">${msg }</font><br>
							 <input type="submit" value="登陆"> &nbsp;&nbsp;
							 <input type=button onclick="window.location.href='<%=basePath %>/front/register.jsp'" value="注册">
						</form><br>
						<a href="<%=basePath %>/index.jsp"><font color = "#fff"><b>管理员登陆</b></font></a>
					</div>
				</td>
				<td align="center" valign="top" style="width: 654px;"  background="<%=basePath%>/images/right.png">
					<iframe frameborder="0" width="654px" height="500px"
						name="dataFrame" src="<%=basePath %>/frontDoctors!list"></iframe>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>