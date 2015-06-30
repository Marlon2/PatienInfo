<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	if (session.getAttribute("sick") == null) {
		response.sendRedirect(basePath + "/front/main.jsp");
	}
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<style type="text/css">
* {
	font-size: 12pt;
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

#topid {
	background-image: url('<%=basePath%>/images/top.png');
}

body {
	text-align: center;
	margin-top: 0px;
}
</style>
</head>
<body>
	<div align="center">
		<table class="tab1">
			<tr>
				<td colspan="2" style="width: 924px; height: 148px;" id="topid"><br><br><br><br><br><br> 
					<div style="float: right;">
						<b>欢迎你：<a href="#">${sick.sickName}</a> | <a href="exit.jsp">退出</a>&nbsp;&nbsp;</b>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" valign="top" style="width: 250px;" background="<%=basePath%>/images/left.png">
					<div style="width: 180; height: 100;"><br>
					    <font style="font-style: italic; font-size: 22px;color: #fff;">个人中心</font><br><br> 
						<b><a href="<%=basePath%>/front/succ.jsp"><font color = "#fff">用户首页</font></a></b><br><br> 
						<b><a href="<%=basePath%>/frontDoctors!list" target="dataFrame"><font color = "#fff">我的查询</font></a></b><br><br> 
						<b><a href="<%=basePath%>/frontyuyue!detail" target="dataFrame"><font color = "#fff">我的预约</font></a></b><br><br> 
						<b><a href="<%=basePath%>/front/usermodifypwd.jsp" target="dataFrame"><font color = "#fff">修改密码</font></a></b><br><br> 
						<b><a href="<%=basePath%>/front/userinfo.jsp" target="dataFrame"><font color = "#fff">个人资料</font></a></b><br><br>
					</div>
				</td>
				<td  background="<%=basePath%>/images/right.png">
				    <iframe frameborder="0" width="654px" height="500px"name="dataFrame" src="<%=basePath%>/frontDoctors!list"></iframe>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>