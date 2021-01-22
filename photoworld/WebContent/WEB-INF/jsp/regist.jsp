<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/lib/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/regist.css" />
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
<title>用户注册</title>
<script>
			//Demo
			layui.use('form', function() {
				var form = layui.form;
				
				form.verify({
					  username: function(value){ //value：表单的值、item：表单的DOM对象
					    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
					      return '用户名不能有特殊字符';
					    }
					    if(/(^\_)|(\__)|(\_+$)/.test(value)){
					      return '用户名首尾不能出现下划线\'_\'';
					    }
					    if(/^\d+\d+\d$/.test(value)){
					      return '用户名不能全为数字';
					    }
					  }
					  
					  //我们既支持上述函数式的方式，也支持下述数组的形式
					  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
					  ,pass: [
						  /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/
					    ,'只能输入5-20个以字母开头、可带数字、“_”、“.”的字串'
					  ] 
					});
				
				//监听提交
				form.on('submit(formDemo)', function(data) {
					layer.msg(JSON.stringify(data.field));
				});
			});
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
			
			<script type="text/javascript">
			//ajax检验用户名
			function checkUsername(){
				var url = "${pageContext.request.contextPath}/user/checkUser.action";
				var username = $("#Inusername").val(); 
				if(username == ""){
					$("#behindUser").html("<font color=red>"+"用户名不能为空"+"</font>");
				}
				$.post(url,{"username":username},function(data){
					if(data == "1"){
						$("#behindUser").html("<font color=#01AAED>"+"此用户名可用"+"</font>");
						
					}
					else if(data == "0"){
						$("#behindUser").html("<font color=red>"+"此用户名已被使用"+"</font>");
					}
				});
			};
			//正则匹配密码
			function checkPassword(s) {  
			  var patrn= /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;  
			  if (!patrn.exec(s)){
				  $("#behindPassword").html("<font color=red>"+"只能输入5-20个以字母开头、可带数字、“_”、“.”的字串"+"</font>");
				  
			  }
			  
			 }
			
			function clearPassdiv() {  
				 $("#behindPassword").html("");
				 }
			
			function clearUserdiv() {  
				 $("#behindUser").html("");
				 }
			
			
			
			</script>	
<script type="text/javascript">
     var count = 1;
     function run(){
    	 var divImg = document.getElementById("backdiv");
    	 var Img = divImg.getElementsByTagName("img");
    	 for(var i=0; i<Img.length;i++){
    		 Img[i].style.display="none";
    	 }
    	 Img[count].style.display="block";
    	 count++;
    	 if(count>2){
    		 count = 0;
    	 }
     }
     
     var time;
     time = setInterval("run()",3000);
</script>	 
		
</head>
<body>
		
		
		<div id="backdiv">
			<img style="display:none"  src="${pageContext.request.contextPath }/photo/rback.jpg" width="100%" height="754px">
			<img  src="${pageContext.request.contextPath }/photo/rback1.jpg" width="100%" height="754px">
			<img style="display:none"   src="${pageContext.request.contextPath }/photo/rback2.jpg" width="100%" height="754px">
		</div>
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
	
				<p align="center" style="margin-top: 130px;"><font style="font-size: 45px;color:#F6F6F6;">Welcome,Please regist !</font></p>
				
				
				<form id="form" class="layui-form  " action="${pageContext.request.contextPath }/user/regist.action" style="margin-left: 600px; margin-top: 140px;" method="post" >
					
					<div class="layui-form-item" style="margin-left: -30px;">
						<!-- 输入用户名-->
						<label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: #1E9FFF;"></i></label>
						<div class="layui-input-inline">
							<input id="Inusername"  type="text" name="username" required lay-verify="username" placeholder="请输入用户名" autocomplete="off" class="layui-input" onblur="checkUsername()" onfocus="clearUserdiv()">
						</div>
						<div id="behindUser" class="layui-form-mid layui-word-aux"></div>
					</div>


					<div class="layui-form-item" style="margin-left: -30px;">
						<!-- 输入密码-->
						<label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #1E9FFF;"></i></label>
						<div class="layui-input-inline">
							<input in="Inpassword" type="password" name="password" required lay-verify="pass" placeholder="请输入密码" autocomplete="off"
							 class="layui-input" onblur="checkPassword(this.value)" onfocus="clearPassdiv()">
						</div>
						<div id="behindPassword" class="layui-form-mid layui-word-aux"></div>
					</div>
				
				
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" style="width: 240px; margin-left: -85px;" lay-submit lay-filter="formDemo" >立即注册</button>
						</div>
					</div>
					
					
				</form>
				
				
				
              <!--尾版-->
              <div style="text-align: center;margin-top: 185px;">
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
		
		
		

</body>
</html>