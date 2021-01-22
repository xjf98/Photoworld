<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>用户中心</title>
<!--mobile apps-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="My Resume Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1);
</script>
<!--mobile apps-->
<!--Custom Theme files-->
<link href="${pageContext.request.contextPath }/css/bootstrap.css"
	type="text/css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath }/css/stylecategory.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/css/tooplate-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/userstyle.css"
	type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
<link href="${pageContext.request.contextPath }/css/tanchu.css"
	type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/swipebox.css">


<!--//Custom Theme files-->
<!--js-->
<script src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/velocity.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/velocity.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/Quttons.js"></script>
<!-- //js -->
<!--web-fonts-->
<link
	href='//fonts.googleapis.com/css?family=Overlock:400,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<!--//web-fonts-->
<!--start-smooth-scrolling-->

<script>
	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(formDemo)', function(data) {
			
			layer.msg('提交成功');
		});
	});
</script>

<script type="text/javascript">
			layui.use('element', function() {
				var element = layui.element;
				//一些事件监听
				  //监听Tab切换，以改变地址hash值
				element.on('tab(test1)', function(){
				    location.hash = 'test1='+ this.getAttribute('lay-id');
				});
				
				 var layid = location.hash.replace(/^#test1=/, '');
				  element.tabChange('test1', layid); //假设当前地址为：http://a.com#test1=222，那么选项卡会自动切换到“发送消息”这一项
				 
				  
			});
		</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/JS/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/JS/easing.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});

		
		var uid = ${auser.uid};
		$.post("${pageContext.request.contextPath}/user/findpicbyUser.action",{"uid":uid},function(data){
			$(data).each(function(){
				var urls = this.p_address;
			    var arr = urls.split(",");
			
				$("#alldiv").append($("<div class='col-md-4 portfolio-grids'>"+
						"<div class='grid'>"+
				     "<a href='${pageContext.request.contextPath}/pic/picdetailUI.action?pid="+this.pid+"' class='swipebox' >"+
				     "<img src='"+arr[0]+"' class='img-responsive'>"+
				     "</img>"+
				     "<div class='figcaption'>"+
				     "<h3>"+this.pname+
				     "</h3>"+
				     "</div>"+
				     "</a>"+
				     "</div>"+
				     "<p>"+"<i class='layui-icon layui-icon-delete' style='font-size:25px;float:right' onclick='deletePic(\""+this.pid+ "\")'>"+
				     "</i>"+
				     "</p>"+
				     "</div>"
				     
				));
				
				});
			}
		,"json");
		
		
		
	
	});
</script>

<script type="text/javascript">
    var count = 0;

	function deletePic(pid){
		 if(pid != ""){
			 $.post("${pageContext.request.contextPath}/pic/deletepic.action",{"pid":pid},function(){
				 
			 }); 
			 layer.msg("刪除成功");
			 }	
		 
		}
	function checklogin(){
		layer.msg("请先登录");
	}
	
	function follow(uid,followid){
		$.post("${pageContext.request.contextPath}/follow/addfans.action",{"uid":uid,"followid":followid},function(data){
			if(data == 1){
				$("#follow1").html("已关注");
			}
			else if(data == 0){
				$("#follow1").html("关注");
			}
		});	
	}
	
	function loadFans(){
		var uid = ${auser.uid};
		$.post("${pageContext.request.contextPath}/follow/loadfans.action",{"uid":uid},function(data){
			 
		
			$(data).each(function(){
				
			
				$("#imgpai").append($(
				 "<div class='imgban'>"+
				 "<a href='javascript:void(0)'>"+
				 "<img src='"+this.userphoto+"'>"+
				 "<p>"+this.username+
				 "</p>"+
				 "</a>"+
				 "</div>"
				
				));
			});
			
			},"json");
		
	}
</script>
<!--//end-smooth-scrolling-->
</head>

<body>


	


	<!--banner-->
	<div id="home" class="banner">
		<div class="header1">
			<!-- 放置logo -->
				<div class="logo">
					<a href="${pageContext.request.contextPath }/art/backindex.action"><img src="${pageContext.request.contextPath }/photo/l2.png" /></a>
				</div>
				<div class="social-icons">
					<ul class="layui-nav" lay-filter="">
					
					    <li class="layui-nav-item"  ><a href="">发现</a></li>
						<li class="layui-nav-item"  ><a href="${pageContext.request.contextPath }/user/registUI.action">注册</a></li>
						<li class="layui-nav-item">
					 		 <c:if test="${empty user }">
							<a href="${pageContext.request.contextPath }/user/loginUI.action"><img src="${pageContext.request.contextPath }/photo/5cfa26824f7bd9c98357b1995df832031b2377a45947-Wg5Plo_fw658.jpg" class="layui-nav-img">暂无登录</a>
							</c:if>
							 <c:if test="${not empty user}">
							<a href="${pageContext.request.contextPath }/user/usercenter.action"><img src="${user.userphoto}" class="layui-nav-img">${user.username }</a>
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
		
	
			
			
			
				<div class="col-md-4 header-left">
					<a href="javascript:void(0)" class="cover"> <img
						src="${auser.userphoto}"
						alt="" />
						</a>
				</div>
				<div class="col-md-8 header-right">
					<h1>
						${auser.username } &nbsp&nbsp&nbsp<c:if test="${empty user }">
						<i class="layui-icon layui-icon-add-1"
							style="font-size: 24px;background-color: #5FB878;" onclick="checklogin()">关注</i>
							</c:if>
							<c:if test="${not empty user }">
							<i id="follow1" class="layui-icon layui-icon-add-1"
							style="font-size:24px;background-color: #5FB878;" onclick="follow(${user.uid},${auser.uid})">
							<c:if test="${relation == '2' || relation == '4' }">已关注</c:if>
							<c:if test="${relation != '2' && relation != '4' || empty relation }">关注</c:if>
							</i></c:if>
							&nbsp&nbsp&nbsp
							<i class="layui-icon layui-icon-dialogue"
							style="font-size: 24px;background-color: #5FB878;">私信</i>
					</h1>
					<h6>${auser.tag }</h6>
					<ul class="address">
						<li>
							<ul class="address-text">
								<li><b>粉丝</b></li>
								<li>${auser.fans }</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>关注 </b></li>
								<li>${auser.follow }</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>发布作品数 </b></li>
								<li></li>
							</ul>
						</li>		
					</ul>
				</div>
				<div class="clearfix"></div>
				
			</div>
	
	
	
	
		 
	<!--//banner-->
	
	<!--top-nav-->
	
	
	<div class="layui-tab layui-tab-brief" lay-filter="test1">
	  <ul class="layui-tab-title">
	    <li class="layui-this" lay-id="111" >个性签名</li>
	    <li lay-id="222">作品</li>
	    <li lay-id="333">文章</li>
	    <li lay-id="444" onclick="loadFans()">粉丝</li>
	  </ul>
	  <div class="layui-tab-content">
	    <div class="layui-tab-item layui-show">
	      <div id="about" class="about">
			<div class="container">
				<div class="col-md-8 about-left">
					<p>我就是我，不一样的烟火</p>
					<p></p>
				</div>
				<div class="col-md-4 about-right">
	
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	    </div>
	    
	    <div class="layui-tab-item">
			       <div id="projects" class="portfolio">
						<div class="container">
								<div class="sap_tabs">
								<div id="horizontalTab"
							style="display: block; width: 100%; margin: 0px;">
							<ul class="resp-tabs-list wow fadeInUp animated"
								data-wow-delay=".7s">
								<li class="resp-tab-item"><span>所有作品</span></li>
							</ul>
							<div class="clearfix"></div>
							<div class="resp-tabs-container">
		
								<!-- 所有 -->
								<div class="tab-1 resp-tab-content">
									<div class="tab_img">
		                               <div id="alldiv"></div>
		                               
		
										<div class="clearfix"></div>
									</div>
								</div>
								<!-- 所有 -->
		
								
							</div>
						</div>
					</div>
					<!--ResponsiveTabs-->
					<script
						src="${pageContext.request.contextPath }/JS/easyResponsiveTabs.js"
						type="text/javascript"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							$('#horizontalTab').easyResponsiveTabs({
								type : 'default', //Types: default, vertical, accordion           
								width : 'auto', //auto or any width like 600px
								fit : true
							// 100% fit in a container
							});
						});
					</script>
					<!--//ResponsiveTabs-->
					<!-- swipe box js -->
					<script src="js/jquery.swipebox.min.js"></script>
					<script type="text/javascript">
						jQuery(function($) {
							$(".swipebox").swipebox();
						});
					</script>
					<!-- //swipe box js -->
				</div>
			</div>
	    </div>
	    
	    <div class="layui-tab-item">3</div>
	    
	    <div class="layui-tab-item">
	    
	    <div id="about" class="about">
			<div class="container">
			 <div id="imgpai" class="imgpai">
	
					
					</div>
				<div class="clearfix"></div>
			</div>
		</div>
	    
	       
	       
	    </div>
	    
	  
	  </div>
	</div>
	


	<!--//contact -->

	<!--footer-->
	<div class="footer">
		<div class="container">
			<p>Copyright &copy; 2018-2019 meiHome</p>
		</div>
	</div>
	<!--//footer-->
	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		$(document).ready(function() {

			var defaults = {
				containerID : 'toTop', // fading element id
				containerHoverID : 'toTopHover', // fading element hover id
				scrollSpeed : 1200,
				easingType : 'linear'
			};

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>




	
	<script src="${pageContext.request.contextPath }/JS/bootstrap.js"></script>
</body>
</html>