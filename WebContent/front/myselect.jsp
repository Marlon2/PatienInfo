<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的查询</title>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link rel="icon" href="<%=basePath%>/images/favicon.ico"  type="image/x-icon">
</head>
<body>
<div align="center">
	<h1>
			<font color="red">特约医师</font>
	</h1>
	<form action="">
		医生：<input type="text" name="doctorname">
		科室<select></select>
		<input type="submit" value="查询">
	</form>
		<table class="table" style="width: 600px;">
			<tr>
				<th>专家编号</th>
				<th>姓名</th>
				<th>从业年限</th>
				<th>科室</th>
				<th>职称</th>
				<th>详细</th>
			</tr>
			<s:iterator value="doctors" var="doctor">
				<tr>
					<td><s:property value="#doctor.doctorId" /></td>
					<td><s:property value="#doctor.doctorName" /></td>
					<td><s:property value="#doctor.cynx" /></td>
					<td><s:property value="#doctor.keshiId" /></td>
					<td><s:property value="#doctor.zhicheng" /></td>
					<td><a href="#">详情</a></td>
				</tr>
			</s:iterator>
		</table>
	</div>
	<div>
		<ul id="menu">
			<s:if test="totalPage<6">
				<s:iterator var="counter" begin="1" end="totalPage">
					<li><a
						href="<%=basePath%>/frontDoctors.action?page=${counter}">${counter }</a>
					</li>
				</s:iterator>
			</s:if>
			<s:else>
				<s:if test="page-1<3">
					<s:iterator var="counter" begin="1" end="4">
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${counter}">${counter }</a>
						</li>
					</s:iterator>
					<li><a
						href="<%=basePath%>/frontDoctors.action?page=${totalPage}">...${totalPage }</a>
					</li>
					<li><a href="<%=basePath%>/frontDoctors.action?page=${page+1}">下一页</a>
					</li>
				</s:if>
				<s:else>
					<s:if test="totalPage-page>=3">
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${page-1}">上一页</a></li>
						<li><a href="<%=basePath%>/frontDoctors.action?page=1">1...</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${page-1}">${page-1 }</a>
						</li>
						<li><a href="<%=basePath%>/frontDoctors.action?page=${page}">${page }</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${page+1}">${page+1 }</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${totalPage}">...${totalPage }</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${page+1}">下一页</a></li>
					</s:if>
					<s:else>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${page-1}">上一页</a></li>
						<li><a href="<%=basePath%>/frontDoctors.action?page=1">1...</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${totalPage-3}">${totalPage-3 }</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${totalPage-2}">${totalPage-2 }</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${totalPage-1}">${totalPage-1 }</a>
						</li>
						<li><a
							href="<%=basePath%>/frontDoctors.action?page=${totalPage}">${totalPage }</a>
						</li>
					</s:else>
				</s:else>
			</s:else>
		</ul>
	</div>
</body>
</html>