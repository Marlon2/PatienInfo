<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function resetValue(){
	document.getElementById("uesrName").value="";
	document.getElementById("password").value="";
	document.getElementById("imageCode").value="";
}
function loadimage(){
	document.getElementById("randImage").src = "image.jsp?"+Math.random();
}

</script>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>病人挂号系统登录</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:30px;background:#C0DEED;border-bottom: 1px solid #dcdcdc;">
		<span style="float:right;margin-right:150px">
		    <a href="http://www.java1234.com" style="text-decoration:none">关于java1234</a>
		    · <a href="http://www.java1234.com" style="text-decoration:none" >友情链接</a>
		</span>
	</div>
	<div data-options="region:'west', border:false" style="width:700px;"align="center">
		<div style="margin-top:100px;"></div>
		<div class="easyui-panel"  title="用&nbsp;&nbsp;户&nbsp;&nbsp;登&nbsp;&nbsp;录"  style="width:200px; height:auto; padding:20px ; align:center; font-size:15px">
			<form id="fm" action="login" method="post" >
				<table>
					<tr><td>用户名:</td></tr>
					<tr><td><input class="easyui-validatebox" type="text" value="${user.userName}" name="user.userName" data-options="required:true" id="uesrName"></td></tr>
					<tr><td>密&nbsp;&nbsp;码:</td></tr>
					<tr><td><input class="easyui-validatebox" type="password" data-options="required:true" value="${user.password}" name="user.password" id="password"/></td></tr>
					<tr><td>验证码:</td></tr>
					<tr><td><input type="text" value="${imageCode}" name="imageCode" id="imageCode" size="10"/>&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="image.jsp" width="58" height="20" border="1" align="absmiddle"></td></tr>
					<tr><td><input type="submit" value="登录" style="margin-top:10px"/>&nbsp;&nbsp;&nbsp;
					<input type="button" value="重置" onclick="resetValue()"/></td>
					</tr>
					<tr><td><font color="red">${error }</font></td></tr>
				</table>
			</form>
		</div>
	
	</div>
	<div data-options="region:'south',border:false" style="height:30px;background:#ededed;"></div>
	<div data-options="region:'center',border:false">
		<img alt="" src="images/u.jpg" style="margin:80px"/>
	</div>
</body>
</html>
