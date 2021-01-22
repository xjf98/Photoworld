<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<title>自然风光</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath }/css/spanof4.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath }/css/spanof3.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath }/css/header.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/css/stylecategory.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/layer/layer.js"></script>
<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Metushi Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>


<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
	
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
			layui.use('element', function() {
				var element = layui.element;
				//一些事件监听
				element.on('nav', function(data) {
					console.log(data);
				});
			});
</script>		
	
<script type="text/javascript">

 jQuery(document).ready(function($) {
	$(".scroll").click(function(event) {
		event.preventDefault();
		$('html,body').animate({
			scrollTop : $(this.hash).offset().top
		}, 1200);
	});
	
		//页面加载完后请求最新图片
		$.post("${pageContext.request.contextPath}/pic/naturepic.action",function(data){
			$(data).each(function(){
				var urls = this.p_address;
			    var arr = urls.split(",");
				$("#newPicdiv").append($("<div class='span1_of_3'>"+"<a href='${pageContext.request.contextPath}/pic/picdetailUI.action?pid="+this.pid+"'>"+
						"<img src='"+arr[0]+"'/>"+"</a>"+
						"<div class='span1_of_3_text'>"+"<h3>"+
						"<a href='javascript:void(0)'>"+
						"<i class='layui-icon layui-icon-username' style='color: #5E5E5E;font-size:20px;float: left'>"+
						"<font style='font-size: 16px;'>"+this.username+"</font>"+"</i>"+
						"</a>"+
						"<a href='javascript:void(0)'>"+" <c:if test='${not empty user }'>"+
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
						"</h3>"+"<br/>"+
					"<p>"+this.pname+"</p>"+
					"</div>"+"</div>"
					));
			});
		},"json");
	
 });

</script>
</head>
<body>
	<!-- header-section-starts -->
	<div class="wrap" id="header">
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
	
	
	
	<div class="header-bottom">
		<div class="container">
			<h3>
				自然风光是一道 <span>美丽</span> 的风景线
			</h3>
		</div>
	</div>
	<div class="navigation-strip">
		<div class="container">
			<div class="nav_content">
				<div class="home">
					<a href="${pageContext.request.contextPath }/nature/backindex.action"><img src="${pageContext.request.contextPath }/images/home1.png" alt="" /></a>
				</div>
				<div class="search">
					<form>
						<input type="text" value="" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search..';}" /> <input
							type="submit" value="">
					</form>
				</div>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>
						<li><a href="${pageContext.request.contextPath }/category/artUI.action">文化艺术</a></li>
						<li><a href="${pageContext.request.contextPath }/category/cityUI.action">城市风光</a></li>
						<li><a class="active" href="javascript:void(0)">自然风光</a></li>
						<li><a href="${pageContext.request.contextPath }/category/tourismUI.action">旅游地理</a></li>
						<li><a href="${pageContext.request.contextPath }/category/foodUI.action">美味食物</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<!-- script for menu -->
				<script>
					$("span.menu").click(function() {
						$(".top-menu").slideToggle("slow", function() {
							// Animation complete.
						});
					});
				</script>
				<!-- script for menu -->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<div class="content">
		<div class="container">
			<div class="blog-posts-section">
			
				<!-- head-section -->
				<div class="head-section text-center">
					<h2>自然风光</h2>
					<span> </span>
				</div>
				
				
				<!-- /head-section -->
				<div class="blog_grids">
				
				<!-- start span_of_3 -->
						<div class="span_of_3">
						
                         <div id="newPicdiv"></div>
	
						<div class="clear"></div>
					
					</div>
					
				</div>
				
				
				<!-- 分页 -->
				<div class="pagination text-center">
					<ul>
						<li><a class="prev" href="#">上一页</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><span>.....</span></li>
						<li><a href="#">12</a></li>
						<li><a href="#" class="next">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 页脚 -->
	<div class="footer">
		<div class="footer-top">
			<div class="container">
			
				<div class="col-md-4 footer-grid">
					<h5>关于我们</h5>
					<p></p>
				</div>
				
				<div class="col-md-4 footer-grid">
					<h5>开发日记</h5>
					<p></p>
					<span></span>
					<p></p>
					<span></span>
				</div>
				
				<div class="col-md-4 footer-grid">
				 <div class="span1_of_4">
					<h5>联系我们</h5>
					<p class="btm">您可以通过以下方式联系我们</p>
					<p class="btm1 pin">China</p>
					<p class="btm1 mail">
					<a href="mailto:info@mycompany.com">5454544545@qq.com</a>
					</p>
					<p class="call">1010101010</p>
				 </div>
				</div>
				
				<div class="clearfix"></div>
			</div>
		</div>
		
		<!-- 底部meihome和回顶部 -->
		<div class="footer-bottom">
			<div class="container">
				<div class="copyrights">
					<p>Copyright &copy; 2018-2019 meiHome</p>
				</div>
				<div class="go-top">
					<a href="#header" class="scroll"><img src="${pageContext.request.contextPath }/images/go-to-top.png" alt="" /></a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		
		
	</div>
</body>
</html>