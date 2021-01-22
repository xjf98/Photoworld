<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css"
	media="all" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<!---strat-slider---->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/slider.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/modernizr.custom.28468.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery.cslider.js"></script>
<script src="${pageContext.request.contextPath }/JS/layer/layer.js"></script>
<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>

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
  function addCount(pid){
		var count = $("#"+pid).html();
		var rgb = $("#"+pid).parent().css("color");
		var hex = colorRGB2Hex(rgb);
		if(hex=="#5e5e5e"){
		++count;
		$("#"+pid).html(count);
		$("#"+pid).parent().css("color","#ff0000");
		$.post("${pageContext.request.contextPath}/pic/addcount.action",{"pid":pid},function(data){
		}); 
		}
		else if(hex == "#ff0000"){
		layer.msg("您已经赞过了哦");
		}
  }
 
  function colorRGB2Hex(color) {
	    var rgb = color.split(',');
	    var r = parseInt(rgb[0].split('(')[1]);
	    var g = parseInt(rgb[1]);
	    var b = parseInt(rgb[2].split(')')[0]);
	    var hex = "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
	    return hex;
	 }

  function checkLogin(){
	  layer.msg("请先登录哟");
  }
</script>
<script type="text/javascript">
	$(function() {
		$('#da-slider').cslider({
			autoplay : true,
			bgincrement : 450
		});
		//页面加载完后请求最新图片
		$.post("${pageContext.request.contextPath}/pic/newpic.action",function(data){
			$(data).each(function(){
				var urls = this.p_address;
			    var arr = urls.split(",");
				$("#newPicdiv").append($("<div class='span1_of_3'>"+"<a href='${pageContext.request.contextPath}/pic/picdetailUI.action?pid="+this.pid+"'>"+
						"<img src='"+arr[0]+"'/>"+"</a>"+
						"<div class='span1_of_3_text'>"+"<h3>"+
						"<a href='${pageContext.request.contextPath}/user/tousercent.action?uid="+this.uid+"'>"+
						"<i class='layui-icon layui-icon-username' style='color: #5E5E5E;font-size:20px;float: left'>"+
						"<font style='font-size: 16px;'>"+this.username+"</font>"+"</i>"+
						"</a>"+
						"<a href='javascript:void(0)'>"+" <c:if test='${not empty user}'>"+
						"<i class='layui-icon layui-icon-praise' style='color:#5E5E5E;font-size:17px;float:right' onclick='addCount(\""+this.pid+ "\")'>"+
							"<font id='"+this.pid+"' style='font-size: 10px;'>"+this.g_count+"</font>"+
						"</i>"+
						"</c:if>"+
						" <c:if test='${empty user }'>"+
						"<i class='layui-icon layui-icon-praise' style='color:#5E5E5E;font-size:17px;float:right' onclick='checkLogin()'>"+
						"<font id='"+this.pid+"' style='font-size: 10px;'>"+this.g_count+"</font>"+
						"</i>"+
						"</c:if>"+
						"</a>"+
					"<p>"+this.pname+"</p>"+
					"</div>"+"</div>"
					
					));
			});
		},"json");
		
		
	    $.post("${pageContext.request.contextPath}/user/findhotuser.action",function(data){
	    	$(data).each(function(){
	    		$("#flexiselDemo3").append("<li>"+"<img src='"+this.userphoto+"' />"+"</li>");
	    		
	    	});		
	    },"json");
		
	});
</script>

<script type="text/javascript" src="${pageContext.request.contextPath }/JS/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
</head>
<body>
	<div class="slider_bg">
		<div class="wrap">
			<div class="header1">
			<!-- 放置logo -->
				<div class="logo">
					<a href="index.html"><img src="${pageContext.request.contextPath }/photo/l2.png" /></a>
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
							<a href="${pageContext.request.contextPath }/user/usercenter.action" target="_black"><img src="${user.userphoto}" class="layui-nav-img">${user.username }</a>
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
			<div class="slider">
				<!--start-->
				<div id="da-slider" class="da-slider">
					<div class="da-slide">
						<h2>欢迎来到 meiHome</h2>
						<p></p>
					</div>
					<div class="da-slide">
						<h2>我们的优势&特点</h2>
						<p></p>
					</div>
					<div class="da-slide">
						<h2>发挥一技之长</h2>
						<p></p>
					</div>
				</div>
				<!--End-->
			</div>
		</div>
	


	<!-- start main -->
	<div class="wrap">
		<div class="main">
			<div class="main_text">
				<h2>
					这里是 <span>属于你</span> 的平台.
				</h2>
				<p class="para"></p>
			</div>
			<!-- start -->
			<div class="grids_of_3">
				<div class="grid1_of_3">
					<img src="${pageContext.request.contextPath }/images/icon1.png" alt="" />
					<h3>
						<a href="#">通过你的 <span> 电脑 </span>
						</a>
					</h3>
					<p>在本网站中注册,成功之后即可登录独享账户，开始你的记录之美</p>
				</div>
				<div class="grid1_of_3">
					<img src="${pageContext.request.contextPath }/images/icon2.png" alt="" />
					<h3>
						<a href="#">记录你的 <span> 美好 </span>
						</a>
					</h3>
					<p>将身边的点点滴滴，美好的事物记录在此，分享他人</p>
				</div>
				<div class="grid1_of_3">
					<img src="${pageContext.request.contextPath }/images/icon3.png" alt="" />
					<h3>
						<a href="#">上传你的 <span> 作品 </span>
						</a>
					</h3>
					<p>将你喜欢的图片上传，有人会给你点赞哦！</p>
				</div>
				<div class="clear"></div>
			</div>
			<!-- end  -->
		</div>
	</div>
	
	<!-- start header -->
	<div class="header_btm">
		<div class="wrap">
			<div class="header_sub">
				<div class="h_menu">
					<ul>
						<li class="active"><a href="javascript:void(0)">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/category/natureUI.action">自然风光</a></li>
						<li><a href="${pageContext.request.contextPath }/category/artUI.action">文化艺术</a></li>
						<li><a href="${pageContext.request.contextPath }/category/cityUI.action">城市风光</a></li>
						<li><a href="${pageContext.request.contextPath }/category/tourismUI.action">旅游地理</a></li>
						<li><a href="${pageContext.request.contextPath }/category/foodUI.action">美味食物</a></li>
					</ul>
				</div>
				<div class="h_search">
					<form>
						<input type="text" value="" placeholder="搜索...">
						<input type="submit" value="">
					</form>
				</div>
				
				<div class="menu">
					<ul>
						<li class="active"><a href="javascript:void(0)">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/category/natureUI.action">自然风光</a></li>
						<li><a href="${pageContext.request.contextPath }/category/artUI.action">文化艺术</a></li>
						<li><a href="${pageContext.request.contextPath }/category/cityUI.action">城市风光</a></li>
						<li><a href="${pageContext.request.contextPath }/category/tourismUI.action"">旅游地理</a></li>
						<li><a href="${pageContext.request.contextPath }/category/foodUI.action">美味食物</a></li>
					</ul>
				</div>
				<div class="search">
					<form action="/iphone/search.html">
						<input type="text" value="Search" onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = 'Search';}"
							class="text">
					</form>
				</div>
				<div class="sub-head">
					<ul>
						<li><a href="#" id="menu">Menu <span></span></a></li>
						<li><a href="#" id="search">Search <span></span></a></li>
					</ul>
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					$(".menu,.search").hide();
					$("#menu").click(function() {
						$(".menu").toggle();
						$(".search").hide();
						$("#search").removeClass("active");
						$("#menu").toggleClass("active");
					});
					$("#search").click(function() {
						$(".search").toggle();
						$(".menu").hide();
						$("#menu").removeClass("active");
						$("#search").toggleClass("active");
						$(".text").focus();
					});
				</script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/JS/script.js"></script>
				<div class="clear"></div>

				<div class="clear"></div>
			</div>
		</div>
	</div>
	
	
	
	<!-- start main_bg -->
	<div class="main_bg">
		<div class="wrap">
			<div class="main content_top">
				<!-- start span_of_3 -->
				<!-- start span_of_3 -->
				<div class="head-section">
					<h2>最新作品</h2>
					<span> </span>
				</div>
				
						<div class="span_of_3" style="padding-left: 7%">
						
				         <div id="newPicdiv"></div>
							
						<div class="clear"></div>
					
					</div>
			</div>
		</div>
	</div>
	<div class="wrap">
	 <div class="bgdiv">
		<h2>热门摄影师</h2>
		<ul id="flexiselDemo3">
          
		</ul>
	</div>
		<script type="text/javascript">
			$(window).load(function() {
				$("#flexiselDemo1").flexisel();
				$("#flexiselDemo2").flexisel({
					enableResponsiveBreakpoints : true,
					responsiveBreakpoints : {
						portrait : {
							changePoint : 480,
							visibleItems : 1
						},
						landscape : {
							changePoint : 640,
							visibleItems : 2
						},
						tablet : {
							changePoint : 768,
							visibleItems : 3
						}
					}
				});

				$("#flexiselDemo3").flexisel({
					visibleItems : 5,
					animationSpeed : 1000,
					autoPlay : true,
					autoPlaySpeed : 3000,
					pauseOnHover : true,
					enableResponsiveBreakpoints : true,
					responsiveBreakpoints : {
						portrait : {
							changePoint : 480,
							visibleItems : 1
						},
						landscape : {
							changePoint : 640,
							visibleItems : 2
						},
						tablet : {
							changePoint : 768,
							visibleItems : 3
						}
					}
				});

			});
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery.flexisel.js"></script>
	</div>
	<!-- start footer -->
	<div class="footer_bg">
		<div class="wrap">
			<div class="footer">
				<!-- start span_of_4 -->
				<div class="span_of_4">
					<div class="span1_of_4">
						<h4>记录美好时光</h4>
						<p>享受每一天带给你的快乐.</p>
						<ul class="f_nav1">
							<li class="timer"><a href="#">22-april 2019 </a></li>
						</ul>
						<p class="top">望所有心想事成.</p>
						<ul class="f_nav1">
							<li class="timer"><a href="#">22-april 2019 </a></li>
						</ul>
					</div>
					<div class="span1_of_4">
						<h4>开发日记</h4>
						<p>
						
						</p>
					</div>
					<div class="span1_of_4">
						<h4>关于我们</h4>
						<p class="btm"></p>
						<p></p>

					</div>
					<div class="span1_of_4">
						<h4>联系我们</h4>
						<p class="btm">您可以通过以下方式联系我们</p>
						<p class="btm1 pin">China</p>
						<p class="btm1 mail">
							<a href="mailto:info@mycompany.com">5454544545@qq.com</a>
						</p>
						<p class="call">1010101010</p>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- start footer -->
	<div class="footer_bg1">
		<div class="wrap">
			<div class="footer1">
				<!-- scroll_top_btn -->
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
				<a href="#" id="toTop" style="display: block;"><span
					id="toTopHover" style="opacity: 1;"></span></a>
				<!--end scroll_top_btn -->
				<div class="social-icons">
					<ul>
						<li><a href="#" target="_blank"></a></li>
						<li><a href="#" target="_blank"></a></li>
						<li><a href="#" target="_blank"></a></li>
						<li><a href="#" target="_blank"></a></li>
					</ul>
				</div>
				<div class="copy">
					<p class="link">
						<span>Copyright &copy; 2018-2019 meiHome</span>
					</p>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>

</body>
</html>