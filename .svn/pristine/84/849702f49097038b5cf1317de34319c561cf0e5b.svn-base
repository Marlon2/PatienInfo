<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户预约</title>
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
<h2>值班时间</h2>
<br><br>
	<table class="table">
		<tr>
			<th>医生</th>
			<th>科室</th>
			<th>擅长</th>
			<th>上班时间</th>
			<th>备注</th>
		</tr>
		<tr>
			<th><s:property value="doctor.doctorName" /></th>
			<th><s:property value="f_keshiname" /></th>
			<th><s:property value="doctor.zhuanchang" /></th>
			<th>
				<table border="0" align="center">
					<s:iterator value="doctorWorks" var="doctorWork">
						<tr>
							<td style="border-bottom-color: white;"><s:date name="#doctorWork.time" format="yyyy-MM-dd" /></td>
							<td style="border-bottom-color: white;"><s:if test="#doctorWork.num<#doctorWork.maxnum">
									<form action="<%=basePath%>/frontyuyue!save" method="post">
										<input type="hidden" name="yuyue.did" value='<s:property value="doctor.doctorId" />'> 
										<input type="hidden" name="yuyue.sid" value="${sick.sickId}">
										<input type="hidden" name="workid" value='<s:property value="#doctorWork.workid" />'>
										<input type="hidden" name="yuyue.yuyuetime" value='<s:date name="#doctorWork.time" format="yyyy-MM-dd"/>'>
										<input type="hidden" name="yuyue.info" value='<s:property value="doctor.doctorName" />'> 
										<input type="hidden" name="yuyue.turnnum" value='<s:property value="#doctorWork.num+1" />'> 
										<input type="submit" value="预约">
									</form>
								</s:if> <s:else>
									<font color="red"><b>已满</b></font>
								</s:else></td>
						</tr>
					</s:iterator>
				</table>
			</th>
			<th></th>
		</tr>
	</table>
	<br><br>
	<input type=button onclick="window.location.href='<%=basePath %>/frontDoctors.action'" value="返回">
	</div>
</body>
</html>