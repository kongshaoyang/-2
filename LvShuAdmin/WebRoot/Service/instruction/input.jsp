<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<%@include file="/System/header.jspf" %>
	<link rel="stylesheet" href="/css/am-md.css">
	<script src="/JavaScript/am-md.js"></script>
</head>

<body>
	<div class="admin-content">
			<div class="admin-biaogelist">
				<div style="margin-bottom: 5px">
				    <div class="listbiaoti am-cf">
					    <ul class="am-icon-flag on"> 说明书录入 </ul>
					</div>
					
				    <div class="listbiaoti am-cf" style="">
					    <h4 class="am-popup-title" style="text-align: center;">说明书录入 </h4>
					</div>
					<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf" id="testDiv">
						<textarea id="editor1" name="editor" rows="12" cols="160"></textarea>
					</div>
				</div>
				<%@include file="/System/foot.jsp" %>
			</div>
	</div>
</body>
<script type="text/javascript">
	//触发 文件选择的click事件 
	function selectFile() { 
		$("#file").trigger("click");  
	} 
	
	/* 获取 文件的路径 ，用于测试*/
	function getFilePath() { 
		$("#filePath").attr("value", $("#file").val());
	}
	
	$("#editor1").val("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan " +
		"et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. " + 
		"Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.");
	
	$("#editor1").markdown({
	  	savable:true,
	  	onShow: function(e){
	    
	  	},
	  	onPreview: function(e) {
	    	var previewContent;
	    	//if (e.isDirty()) {
	      		previewContent = e.getContent();
	    	//} else {
			//	previewContent = "Default content"
	    	//}
	
	    	return previewContent;
	  	},
	  	onSave: function(e) {
	    	alert("Saving '"+e.getContent()+"'...");
	  	},
	  	onChange: function(e){
	    	//console.log("Changed!")
	  	},
	  	onFocus: function(e) {
	    	//alert("Focus triggered!")
	  	},
	  	onBlur: function(e) {
	    	//alert("Blur triggered!")
	  	}
	});
</script>
</html>