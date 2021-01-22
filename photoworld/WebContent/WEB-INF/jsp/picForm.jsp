<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/JS/layui/css/layui.css" />
	
<script src="${pageContext.request.contextPath }/JS/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/layui/layui.js"></script>
<title>Insert title here</title>

<script>
	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(formDemo)', function(data) {
			layer.msg(JSON.stringify(data.field));
			layer.msg('提交成功');
			
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index);
		});
		
	
	});
</script>

</head>
<body>
<form  class="layui-form" action="${pageContext.request.contextPath }/user/updateUserpic.action" method="post" enctype="multipart/form-data">
			<input type="hidden" name="uid" value="${user.uid }" />
			
			<div class="layui-form-item" style="margin-top: 25px">
			<label class="layui-form-label">选择图片 :</label>
				<div class="layui-input-block">
					<input type="file" name="pictureFile" required lay-verify="required" />
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-left: 150px">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo" >修改头像</button>
				</div>
			</div>
		</form>
</body>
</html>