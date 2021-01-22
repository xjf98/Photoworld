<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header" id="header">
		<div class="container">
			<div class="logo">
				<a href="index.jsp"></a>
			</div>
			<div class="social-icons header-social-icons">
				<a href="#"><font color="blue">注册</font></a> 
				 <c:if test="${empty user }">
				<a  href="${pageContext.request.contextPath }/user/loginUI.action" style="margin-left: 20px"><img src="${pageContext.request.contextPath }/photo/5cfa26824f7bd9c98357b1995df832031b2377a45947-Wg5Plo_fw658.jpg" class="layui-nav-img" ><font color="blue">暂无登录</font></a>
				</c:if>
				 <c:if test="${not empty user}">
				<a href="${pageContext.request.contextPath }/user/usercenter.action" style="margin-left: 20px"><img src="${user.userphoto}" class="layui-nav-img"><font color="blue">${user.username }</font></a>
				</c:if>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</body>
</html>