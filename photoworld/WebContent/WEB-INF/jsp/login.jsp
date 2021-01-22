<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/lib/bootstrap.css" />
		<link href="${pageContext.request.contextPath }/css/header.css" rel='stylesheet' type='text/css' />
		<script src="${pageContext.request.contextPath }/JS/lib/jquery-1.11.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>
		<script src="${pageContext.request.contextPath }/JS/layer/layer.js"></script>
			<style>
			.nph_photo_prev {
			left: 0;
			position: absolute;
			top: 0;
			height:100%;
			width:100%;
			z-index: 99;
				}
		</style>
<title>用户登录</title>
</head>
<body>
		<script>
				layui.use('form', function() {
					var form = layui.form;
					//监听提交
					form.on('submit(formDemo)', function(data) {
						layer.msg(JSON.stringify(data.field));
						return false;
					});
				});
				
				
				function submitForm(){
					document.getElementById("form2").submit();
				};
		</script>
		
<script type="text/javascript">
			layui.use('element', function() {
				var element = layui.element;
				//一些事件监听
				element.on('nav', function(data) {
					console.log(data);
				});
			});
</script>
		
		<div style="position: relative;">
			<img  src="${pageContext.request.contextPath }/photo/timg%20(13).jpg" width="100%" height="758px">
			<div class="nph_photo_prev">
			<div class="wrap">
			<div class="header1">
			<!-- 放置logo -->
				<div class="logo">
					<a href="${pageContext.request.contextPath }/art/backindex.action"><img src="${pageContext.request.contextPath }/photo/l2.png" /></a>
				</div>
				<div class="social-icons">
					<ul class="layui-nav" lay-filter="">
					
					    <li class="layui-nav-item"  ><a href="" style="color:gray">发现</a></li>
						<li class="layui-nav-item"  ><a href="${pageContext.request.contextPath }/user/registUI.action" style="color:gray;">注册</a></li>
						<li class="layui-nav-item">
					 		 <c:if test="${empty user }">
							<a href="${pageContext.request.contextPath }/user/loginUI.action" style="color:gray"><img src="${pageContext.request.contextPath }/photo/5cfa26824f7bd9c98357b1995df832031b2377a45947-Wg5Plo_fw658.jpg" class="layui-nav-img">暂无登录</a>
							</c:if>
							 <c:if test="${not empty user}">
							<a href="${pageContext.request.contextPath }/user/usercenter.action" style="color:gray"><img src="${user.userphoto}" class="layui-nav-img">${user.username }</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:;">修改信息</a></dd>
								<dd><a href="javascript:;">安全管理</a></dd>
								<dd><a href="${pageContext.request.contextPath }/user/exituser.action">退出登录</a></dd>
							</dl>
							 </c:if>
							
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
				<p align="center" style="margin-top: 130px;">
					<font style="font-size: 45px;color:#F6F6F6;">Please login !</font>
				</p>
				<form id="form2" class="layui-form  " action="${pageContext.request.contextPath }/user/login.action" style="margin-left: 600px; margin-top: 100px;" method="post">

					<div class="layui-form-item" style="margin-left: -30px;">
						<!-- 输入用户名-->
						<label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1E9FFF;"></i></label>
						<div class="layui-input-inline">
							<input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux"></div>
					</div>

					<div class="layui-form-item" style="margin-left: -30px;">
						<!-- 输入密码-->
						<label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i></label>
						<div class="layui-input-inline">
							<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
							 class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux"></div>
					</div>
					<div  style="margin-left: 20px;">
						<input type="checkbox" name="" lay-skin="primary" style=""/>记住密码
						<a style="margin-left: 50px;">
							<font style="font-size: 15px;">忘记密码</font>
						</a>|<a href="${pageContext.request.contextPath }/user/registUI.action">立即注册</a>
					</div>
					
					<div class="layui-form-item" style="margin-top: 30px;">
						<div class="layui-input-block">
							<button class="layui-btn" style="width: 240px; margin-left: -80px;" lay-submit lay-filter="formDemo" onclick="submitForm()">立即登录</button>
						</div>
					</div>
				</form>

				<!--尾版-->
				<div style="text-align: center;margin-top: 165px;">
					<ul class="list-inline">
						<li><a>联系我们</a></li>
						<li><a>招贤纳士</a></li>
						<li><a>法律声明</a></li>
						<li><a>友情链接</a></li>
						<li><a>服务声明</a></li>
						<li><a>广告声明</a></li>
						<li><a>版权所有</a></li>
					</ul>
				</div>
				<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
					<font color="#007DDB">Copyright &copy; 2018-2019 meiHome</font>
				</div>

			</div>
		</div>
</body>
</html>