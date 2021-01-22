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
<link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/userstyle.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
<link href="${pageContext.request.contextPath }/css/tanchu.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/swipebox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/goodsAdd.css">

<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	
		

<!--//Custom Theme files-->
<!--js-->
<script src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>

<script src="${pageContext.request.contextPath }/JS/fileinput.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/JS/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/JS/fileinput_locale_de.js" type="text/javascript"></script>

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
<style type="text/css">
 .cover > div{
		text-align:center;
		position: absolute;
		top: 0px;
		width: 47%;
		height:100%;
		background: rgba(0,0,0,0.6);
		line-height: 450px;
		font-size: 1.5em;
		color: white;
		display: none;
		border-radius: 50%;
	}

	.cover:hover >div{
		display: block;
	}
	
</style>
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

var success=0;
var fail=0;
var imgurls="";


	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});

		$('.pop-close').click(function() {
			$('.bgPop,.pop').hide();
		});
		$('.click_pop').click(function() {
			$('.bgPop,.pop').show();
		});
		
		var imgsName="";
		layui.use(['upload','layer'],function() {
			var upload = layui.upload;
			var layer=layui.layer;
	 
			upload.render({
				elem: '#test1',
				url: '${pageContext.request.contextPath}/user/upload.action',
				multiple: true,
				auto:false,
//				上传的单个图片大小
				size:10240,
//				最多上传的数量
				number:20,
//				MultipartFile file 对应，layui默认就是file,要改动则相应改动
				field:'file',
				bindAction: '#test9',
				before: function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#demo2').append('<img src="' + result 
							+ '" alt="' + file.name 
							+'"height="92px" width="92px" class="layui-upload-img uploadImgPreView">')
					});
				},
				done: function(res) {
					//每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交
					if(res.code=="1"){
						fail++;
					}else{
						success++;
						imgurls=imgurls+""+res.data.src+",";
						$('#imgUrls').val(imgurls);	
					}
				},
				allDone:function(obj){
				    layer.msg("总共要上传图片总数为："+(fail+success)+"\n"
				    			+"其中上传成功图片数为："+success+"\n"
				    			+"其中上传失败图片数为："+fail
				    		 )
				}
			});
	 
		});
		
		//清空预览图片
		cleanImgsPreview();
		//保存商品
		goodsSave();
		
		
		$('.cover').click(function(){
			layer.open({
				type : 2,
				skin : 'layui-layer-rim', //加上边框
				area : [ '390px', '200px' ], //宽高
				anim:3,
				content : '${pageContext.request.contextPath }/user/picform.action',
				end : function(){
					location.reload();
				}
			});
		});
		
		
		
		var uid = ${user.uid};
		$.post("${pageContext.request.contextPath}/user/findpicbyUser.action",{"uid":uid},function(data){
			
			
			$(data).each(function(){
				var urls = this.p_address;
			    var arr = urls.split(",");
				
					
				
				$("#alldiv").append("<div class='col-md-4 portfolio-grids'>"+
						"<div class='grid'>"+
				     "<a href='${pageContext.request.contextPath}/pic/picdetailUI.action?pid="+this.pid+"' class='swipebox' >"+
					 
					 "<img src='"+arr[0]+"' class='img-responsive'/>"+
					 	
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
				     
				);
		
				});
			}
		,"json");
		
	});
	
			 
			/**
			 * 清空预览的图片及其对应的成功失败数
			 * 原因：如果已经存在预览的图片的话，再次点击上选择图片时，预览图片会不断累加
			 * 表面上做上传成功的个数清0，实际后台已经上传成功保存了的，只是没有使用，以最终商品添加的提交的为准
			 */
			function cleanImgsPreview(){
				$("#cleanImgs").click(function(){
					success=0;
					fail=0;
					$('#demo2').html("");
					$('#imgUrls').val("");
				});
			}
			 
			/**
			 * 保存商品
			 */
			function goodsSave(){
				$('#btnSubmit').click(function(){
					var tt=$("#title").val();
					var st=$("#smallTit").val();
					var ius=$("#imgUrls").val();
					var uid=$("#uid").val();
					var cid=$("#selected").val();
				
					$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/user/saveGoods.action",
						   data: {
							   pname:tt,
							   pdesc:st,
							   imgUrls:ius,
							   uid:uid,
							   cid:cid,
						   },
						   success: function(msg){
							   if(msg=="1"){
								   alert("保存成功");
							   }else{
								   alert("保存失败");
							   }
						   }
					});
				});
			}
</script>

<script type="text/javascript">
	function clicktan() {
		layer.open({
			type : 2,
			skin : 'layui-layer-rim', //加上边框
			area : [ '390px', '400px' ], //宽高
			anim:3,
			content : '${pageContext.request.contextPath }/user/tanform.action',
			end : function(){
				location.reload();
			}
		});
	};
	
	function deletePic(pid){
		 if(pid != ""){
			 $.post("${pageContext.request.contextPath}/pic/deletepic.action",{"pid":pid},function(){
				 
			 }); 
			 layer.msg("刪除成功");
			 }	
		 
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
						src="${user.userphoto}"
						alt="" />
						<div>修改头像<i class="layui-icon layui-icon-edit"
							style="font-size: 20px;"></i></div>
						</a>
				</div>
				<div class="col-md-8 header-right">
					<h1>
						${user.username } &nbsp&nbsp&nbsp<a href="javascript:void(0)"
							class="click_pop">编辑<i class="layui-icon layui-icon-edit"
							style="font-size: 30px;"></i></a>
					</h1>
					<h6>${user.tag }</h6>
					<ul class="address">
						<li>
							<ul class="address-text">
								<li><b>粉丝</b></li>
								<li>${user.fans }</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>关注 </b></li>
								<li>${user.follow }</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>发布作品数 </b></li>
								<li>11</li>
							</ul>
						</li>
						<li>
							<ul class="address-text">
								<li><b>上传作品</b></li>
								<li><a href="#" onclick="clicktan()"><i
										class="layui-icon layui-icon-upload-drag"
										style="color: black; font-size: 28px;"></i></a></li>
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
	    <li lay-id="333">上传作品</li>
	    <li lay-id="444">粉丝</li>
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
	    
	    <!-- 3 -->
	    <div class="layui-tab-item">

	    <form class="layui-form goodsAddForm" action="" method="post">
	    <input id="uid" type="hidden" name="uid" value="${user.uid }" />
		    <div class="layui-form-item">
		        <label class="">作品名称</label>
		        <div class="layui-inline" >
		            <input type="text" name="pname" id="title" required lay-verify="required" placeholder="请输入作品名称" autocomplete="off" class="layui-input">
		        </div>
		    </div>
		    
		    <div class="layui-form-item layui-form-text">
		        <label class="">作品描述</label>
		        <div class="layui-inline">
		            <textarea name="pdesc" id="smallTit" placeholder="商品副标题：" class="layui-textarea"></textarea>
		        </div>
		    </div>
		
		  <div class="layui-form-item">
		        <label class="">图片所属分类</label>
		        <div class="layui-inline">
			      <select name="cid" lay-verify="required" id="selected">
			        <option value=""></option>
			        <option value="1">自然风光</option>
			        <option value="2">文化艺术</option>
			        <option value="3">城市风光</option>
			        <option value="4">旅游地理</option>
			        <option value="5">美味食物</option>
			      </select>
			    </div>
		    </div>
		    
		 
		    <div class="layui-form-item">
		        <label class="">图片上传</label>
		        <div class="layui-inline">
		            <button type="button" class="layui-btn" id="test1">
		                <i class="layui-icon">&#xe67c;</i>选择图片
		            </button>
		            <button type="button" class="layui-btn" id="test9">开始上传</button>
		            <button type="button" class="layui-btn" id="cleanImgs"> <i class="fa fa-trash-o fa-lg"></i>清空图片预览</button>
		        </div>
		        <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
		            图片预览：
		            <div class="layui-upload-list" id="demo2"></div>
		        </blockquote>
		    </div>
		    
		    <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
		    <div class="layui-form-item">
		        <div class="layui-input-block">
		            <button class="layui-btn" type="button" style="width: 800px;" id="btnSubmit">提交作品</button>
		        </div>
		    </div>
		</form>

	    </div>
	    <div class="layui-tab-item">4</div>
	  
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

<!-- 点击编辑弹出层 -->
	<!--遮罩层-->
	<div class="bgPop"></div>
	<!--弹出框-->
	<div class="pop">
		<div class="pop-top">
			<h2>修改个人信息</h2>
			<span class="pop-close">Ｘ</span>
		</div>
		<div class="pop-content">
			<div class="pop-content-left">
				<img src="" alt="" class="teathumb">
			</div>
			<div class="pop-content-right">
				<form class="layui-form" action="${pageContext.request.contextPath }/user/updateuser.action" method="post">
                  <input type="hidden" name="uid" value="${user.uid }" />
					<div class="layui-form-item">
						<label class="lname">用户名</label>
						<div class="layui-input-block">
							<input type="text" name="username" required lay-verify="required"
								value="${user.username }" autocomplete="off" class="layui-input">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="lname">评价自己</label>
						<div class="layui-input-block">
							<input type="radio" name="tag" value="摄影萌新" title="摄影萌新"> <input
								type="radio" name="tag" value="摄影迷" title="摄影迷"> <input
								type="radio" name="tag" value="摄影痴" title="摄影痴"> <input
								type="radio" name="tag" value="摄影狂" title="摄影狂"> <input
								type="radio" name="tag" value="摄影大咖" title="摄影大咖" checked>
						</div>
					</div>

						<div class="pop-foot" style="margin-left: 200px">
							<input type="button" value="关闭" class="pop-cancel pop-close">
							<button class="layui-btn" lay-submit lay-filter="formDemo" >修改</button>
						</div>
				</form>
			</div>
		</div>
	</div>
<!-- 点击编辑弹出层 -->


	
	<script src="${pageContext.request.contextPath }/JS/bootstrap.js"></script>
</body>
</html>