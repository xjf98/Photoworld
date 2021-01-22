<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>作品详情</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.css"
	type="text/css" rel="stylesheet" media="all">
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/css/stylecategory.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
<link href="${pageContext.request.contextPath }/css/spanof4.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
<link href="${pageContext.request.contextPath }/css/header.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<script src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/layer/layer.js"></script>
<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Metushi Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
 <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
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
  
  
function checkForm(){
	var user = "${user}";
	if(!user){
		 layer.msg("请先登录哟");
		 return false;
	}
	var content = $("#contentText").val();
	if(content == ""){
		layer.msg("评论不能为空");
		return false;
	}
	return true;
}

function tanReply(comment_id,uid){
	
		  layer.prompt({title: '回复内容', formType: 2}, function(text, index){
			  $.post("${pageContext.request.contextPath}/reply/uploadreply.action",{"r_content":text,"comment_id":comment_id,"uid":uid},function(data){
				  
			  })
		    layer.close(index);
		  });
		
}

function tanReply2(rid,uid){
	
	  layer.prompt({title: '回复内容', formType: 2}, function(text, index){
		  $.post("${pageContext.request.contextPath}/reply/addreplycomment.action",{"rc_content":text,"rid":comment_id,"uid":uid},function(data){
			  
		  })
	    layer.close(index);
	  });
	
}
</script>
</head>
<body>
	<!-- header-section-starts -->
	
			<div class="header1" id="header">
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
		
	
	<div class="header-bottom">
		<div class="container">
			<h3>许多事情不是你想的那么无趣</h3>
		</div>
	</div>
	<div class="navigation-strip">
		<div class="container">
			<div class="nav_content">
				<div class="home">
					<a href="${pageContext.request.contextPath }/food/backindex.action"><img src="${pageContext.request.contextPath }/images/home1.png" alt="" /></a>
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
						<li><a href="${pageContext.request.contextPath }/category/natureUI.action">自然风光</a></li>
						<li><a href="${pageContext.request.contextPath }/category/tourismUI.action">旅游地理</a></li>
						<li><a class="active" href="javascript:void(0)">美味食物</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<!-- script for menu -->
				<script>
				$( "span.menu" ).click(function() {
				  $( ".top-menu" ).slideToggle( "slow", function() {
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
			<div class="single">				
				<!-- head-section -->
					<div class="head-section text-center">
						<h2>作品详情</h2>
						<span> </span>
					</div>
					<!-- /head-section -->	
				<div class="single-top">
				<c:forTokens items="${userphoto.p_address}" delims="," var="url">
					<img  src="${url}" alt=""/>
					</c:forTokens>
				</div>
				<div class="top-single">
				<!-- 作品标题 -->
				<h2></h2>
					<div class="grid-single">
						<div class="single-one"><span><i class="layui-icon layui-icon-date" style="font-size:21px;"> </i>${userphoto.p_time }</span></div>
						<div class="single-one"><span><a href="#"><i class="layui-icon layui-icon-reply-fill" style="font-size:21px;"> </i>${userphoto.c_count }</a></span></div>
						<div class="single-one"><c:if test="${not empty user}"><span><a href='javascript:void(0)'>
						<i class="layui-icon layui-icon-praise" style="color:#5E5E5E;font-size:21px;" onclick="addCount('${userphoto.pid}')">
						<font id='${userphoto.pid }' style='font-size: 14px;'>${userphoto.g_count }</font></i>
						</a></span></c:if>
						
						<c:if test="${empty user}"><span><a href='javascript:void(0)'>
						<i class="layui-icon layui-icon-praise" style="font-size:21px;" onclick='checkLogin()'></i>
						</a><font id='${userphoto.pid }' style='font-size: 14px;'>${userphoto.g_count }</font></span></c:if>
						
						</div>
						<div class="clearfix"> </div>
					</div>
					
					<!-- 作品的描述 -->
                   <p class="eget">这是我在天山拍的，很美，很赞 </p>
			<hr/>
			
			
			<div class="top-comments">
			
			<div class="leave">
				<h3>留下评论</h3>
					<form action="${pageContext.request.contextPath }/comment/addcomment.action" method="post" onSubmit="return checkForm()">
					<input type="hidden" name="uid" value="${user.uid }" />
					<input type="hidden" name="pid" value="${userphoto.pid }" />
						<div class="text-top">
							<div class="col-md-8 text-in">
								<textarea name="content" id="contentText" ></textarea>
							</div>
							<div class="col-md-4 text-in">
								<input type="submit" value="评论" >
							</div>
							<div class="clearfix"> </div>
						</div>
					</form>
			</div>
			
			<h3>10 条评论</h3>
			<hr/>
			
			
			
			
			
		 <c:forEach items="${usercomment}" var="uc">
			<div class="met">
				<div class="code-in">
						<!-- 评论人和评论时间 -->
					<p class="smith"><a href="#">${uc.username }</a> <span>${uc.c_time }</span></p>
					<p class="reply">
					<c:if test="${not empty user}">
					<a href="javascript:void(0)" onclick="tanReply('${uc.comment_id}','${user.uid }')"><i></i>回复 </a>
					</c:if>
					<c:if test="${empty user}">
					<a href="javascript:void(0)" onclick="checkLogin()"><i></i>回复 </a>
					</c:if>
					</p>
					<div class="clearfix"> </div>
				</div>
				
				<div class="comments-top-top">
					<div class="men" >
						<img src="${uc.userphoto }"  alt=""> 
					</div>		
					<!-- 评论内容 -->			
						<p class="men-it">${uc.content }</p>
						
					<div class="clearfix"> </div>
				</div>
			</div>
			<hr/>
			<!-- 回复评论 -->
			<c:if test="${not empty uc.rlist }">
			 <c:forEach items="${uc.rlist }" var="reply">
			<div class="met met-in">
				<div class="code-in">
					<p class="smith"><a href="#">${reply.username }  <span>回复了</span>     ${uc.username } </a><span>${reply.r_time }</span></p>
					
					<div class="clearfix"> </div>
				</div>
				<div class="comments-top-top top-in">
					<div class="men" >
						<img src="${reply.userphoto }" alt=""> 
					</div>					
						<p class="men-it">${reply.r_content }</p>
					<div class="clearfix"> </div>
				</div>
			</div>
			
			</c:forEach>
			</c:if>
			<hr/>
		</c:forEach>

			
			
			
			
			
		</div>
		
		
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