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
		    <div class="listbiaoti am-cf">
			    <ul class="am-icon-flag on"> 产品制造商详情 </ul>
			</div>
			
		    <div class="listbiaoti am-cf" style="">
			    <h4 class="am-popup-title" style="text-align: center;">测试厂商服务网点 </h4>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf" id="testDiv">
				<textarea id="editor1" name="editor" rows="12" cols="160"></textarea>
			</div>
			<%@include file="/System/foot.jsp" %>
		</div>
			
		<!-- 上传文件  -->
		<div class="am-popup am-popup-inner" id="upload_popup" style="width: 50%;height: 28%;overflow: auto;">
	    	<div class="am-popup-hd">
      			<h4 class="am-popup-title">上传说明书电子版 </h4>
				<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
    		</div>
		    <div class="am-popup-bd">
		      	<form class="am-form" >
		      		<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf" style="margin-top: 10px;margin-left: 15px;">
		        		<ul>
		        		    <li><input type="file" id="file" onchange="getFilePath()" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/></li>
		        			<li style="font-size: 14px;margin-top:3px">Word文件路径：</li>
		        			<li style="width:60%"><input id="filePath" name="filePath" type="text" class="am-form-field am-input-sm am-input-xm" required="required" oninvalid="setCustomValidity('文件路径不能为空');" oninput="setCustomValidity('');"/></li>
		        			<li style="margin-left: 15px;"><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="selectFile();">浏览</button></li>
		        		</ul>
	        		</div>
	        		<div>
				    	<div class="am-cf" align="center" style="margin-top: 30px">
				         	<button type="submit" class="am-btn am-radius am-btn-xs am-btn-success">确定</button>
				        </div>
			        </div>
			    </form>
			</div>
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
