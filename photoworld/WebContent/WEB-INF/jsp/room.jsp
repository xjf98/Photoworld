<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/chat.css" />
<title>聊天室</title>
</head>
<script type="text/javascript">
$(function(){
	var roomid=$(".roomid").html();//房间名
	var nickname = $(".uname").html();//自己的昵称
	var flag = "join";
	var info = flag + "|" +roomid + "|" +nickname;
	//建立一条与服务器之间的连接
	var socket = new WebSocket("ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/websocket/"+info);
	var text = "";
	var welcome = JSON.stringify({			//加入房间时的欢迎消息
						nickname:nickname,    //用户名
						content:text,		//消息内容
						target:roomid,		//推送到目标房间
						flag:"chatroom"});	//推送标识
						
	var exitroom = JSON.stringify({		//退出房间
		nickname:nickname,
		flag:"exitroom",
		roomid:roomid
	})
	//接收服务器的消息
	socket.onmessage=function(ev){
		var obj = eval(   '('+ev.data+')' );
		addMessage(obj)
	};
	//当服务端执行onopen后触发此方法
	socket.onopen = function(){
		socket.send(welcome); 
	};
	//发送按钮被点击时
	$(".ensure button").click(function(){
	    ensure();
    });
	
	$("body").keyup(function (event) {//监听回车键
		if (event.keyCode == "13") {//keyCode=13是回车键
			$(".ensure button").trigger("click");
		}
	});
	
	function ensure(){
		//获取输入框的内容
	    var txt = $(".center-input").val()
		if(txt==''){
			  alert("不能发送空内容")
		}else{
	    	//构建一个标准格式的JSON对象
	    	var obj = JSON.stringify({
		    		nickname:nickname,    //用户名
					content:txt,		//消息内容
					flag:'chatroom',			//标识--chatroom代表是聊天室的消息
					target:roomid	//消息推送的目的地
				});	
	        // 向服务器发送消息
	        socket.send(obj);
	     	// 清空消息输入框
	        $(".center-input").val("")
	        // 消息输入框获取焦点
	        $(".center-input").focus(); 
		}
	}
	
	function addMessage(msg){
		if(msg.isSelf&&msg.content==""){ //该消息是自己发送的，并且内容为空
			$(".center-info").append("<div class='welcome'>欢迎你加入群聊</div>");
			refreshMember(msg.uname);  //刷新成员 
		}
		if(!msg.isSelf&&msg.content==""){//该消息是别人发送的，并且内容为空
			$(".center-info").append("<div class='welcome'>欢迎"+msg.nickname+"加入群聊</div>");
			//刷新成员列表
			refreshMember(msg.uname)
		} 
		if(!msg.content==""){			//内容不为空时 
			var align;
			if(msg.isSelf){
				align = "right";
			}else{
				align = "left";
			}
			$(".center-info").append(
					"<div class='basicInfo' style=float:"+align+">"+
					"<div class='basicInfo-left' style=float:"+align+">"+
						"<img src='${pageContext.request.contextPath}/images/img1.jpg'>"+
					"</div>"+
					"<div class='basicInfo-right' style=float:"+align+">"+
						"<div class='username' style=text-align:"+align+">"+
							"<span>"+msg.nickname+"</span>&nbsp;"+
							"<span>"+msg.date+"</span>"+
						"</div>"+
						"<div class='context'>"+
							"<span>"+
								msg.content+
							"</span>"+
						"</div>"+
					"</div>"+
				"</div>"
			); 
		}
		if(msg.flag == "exitroom"){		//退出房间
			$(".center-info").append("<div class='welcome'>"+msg.message+"</div>");
			//刷新成员列表
			refreshMember(msg.uname)
		}
		$(".center-info").scrollTop(999999); //让滚动条始终保持在最下 
	}
	
	$(".exitroom").click(function(){			//退出房间
		socket.send(exitroom); //向服务器发送退出房间的信号
		location.href="${pageContext.request.contextPath}/home/list.action"; //跳转到前一个页面
	})
	
	function refreshMember(data){
		$(".member").html("");
		for(var i=0;i<data.length;i++){
			$(".member").append(
				"<div class='memberInfo'>"+
					"<div class='userpic'>"+
						"<img src='${pageContext.request.contextPath}/images/img1.jpg'>"+
					"</div>"+
					"<span class='username'>"+data[i]+"</span>"+
				"</div>"
			)
		}
	}
}) 
</script>

<body>
	<div class="body-left">
		<div class="left-info">
			<div class="exitroom">
				<--退出房间
			</div>
			<div class="roomname">
				欢迎来到：<h1 style="display: inline-block;" class="roomid">${roomid }</h1>
			</div>
			<div class="member">
				<c:forEach items="${requestScope.memberlist }" var="member">
					<div class="memberInfo">
						<div class="userpic">
							<img src="img/touxiang.jpg">
						</div>
						<span class="username">${member.username }</span>
						<span style = "display:none">${member.userid }</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="body-center">
		<div class="center-info">

		</div>
		<textarea class="center-input"></textarea>
		<div class="ensure">
			<button>发送</button>
		</div>
	</div>
	
	<div class="body-right">
	</div>
	
	<span class="uname" style="display:none">${sessionScope.uname }</span>
	
</body>

</html>