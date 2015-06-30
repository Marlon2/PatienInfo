<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医生详情</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/table.css" />
</head>
<body>
	<div align="center">
		<h2>医生详情</h2>
		<table class="table" style="width: 400px;">
			<tr>
				<th>编号</th>
				<th><s:property value="doctordetail.doctorId" /></th>
			</tr>
			<tr>
				<th>医生姓名</th>
				<th><s:property value="doctordetail.doctorName" /></th>
			</tr>
			<tr>
				<th>性别</th>
				<th><s:property value="doctordetail.sex" /></th>
			</tr>
			<tr>
				<th>出生日期</th>
				<th><s:date name="doctordetail.birthday" format="yyyy-MM-dd"/> </th>
			</tr>
			<tr>
				<th>毕业院校</th>
				<th><s:property value="doctordetail.byyx" /></th>
			</tr>
			<tr>
				<th>从业年限</th>
				<th><s:property value="doctordetail.cynx" /></th>
			</tr>
			<tr>
				<th>科室</th>
				<th><s:iterator value="keshis" var="keshi">
						<s:if test="[0].keshiId == doctordetail.keshiId">
							<s:property value="[0].keshiName" />
						</s:if>
					</s:iterator></th>
			</tr>
			<tr>
				<th>职称</th>
				<th><s:property value="doctordetail.zhicheng" /></th>
			</tr>
			<tr>
				<th>专长</th>
				<th><s:property value="doctordetail.zhuanchang" /></th>
			</tr>
			<tr>
				<th colspan='2'><s:if test="null==#session.sick||#session.sick.isEmpty()">
					</s:if> <s:else>
						<input type=button onclick="window.location.href='<%=basePath %>/frontDcotorWork!detailWork?f_doctorid=<s:property value="doctordetail.doctorId" />'" value="预约">
					</s:else>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type=button onclick="window.location.href='<%=basePath %>/frontDoctors.action'" value="返回">
			</tr>
		</table>
	</div>
</body>
</html>