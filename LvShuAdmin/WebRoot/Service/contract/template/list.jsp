<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<%@include file="/System/header.jspf" %>
</head>

<body>
	<div class="admin-content">
		<!-- 数据列表 -->
		<div class="admin-biaogelist">
		    <div class="listbiaoti am-cf">
			    <ul class="am-icon-flag on"> 合同模板列表</ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top: 2px;margin-left:23px">模板名称：</li>
					<li><input name="queryParams.templateName" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">客户对象：</li>
					<li><input name="queryParams.customer" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">行业：</li>
					<li><input name="queryParams.trade" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">子行业：</li>
					<li><input name="queryParams.childTrade" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
			   </ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">二级子行业：</li>
					<li><input name="queryParams.secondChildTrade" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs" style="margin-left:2px">				
							<select id="queryStatusCombox" data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
								<option value="start">启用</option>
								<option value="stop">禁用</option>
							</select>
						</div>
					</li>
					<li style="margin-left: 10px;"><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="query();return false;">筛选</button></li>
			   </ul>
			</div>	
			<div>
	    		<form class="am-form am-g" style="margin-top: -8px;">
		        	<table id="list_table" style="width:100%;" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
		            	<thead>
		            		<tr class="am-success">
			                	<th class="table-check"><input type="checkbox" /></th>
				                <th class="table-id">ID</th>
								<th class="table-title">模板名称</th>
				                <th class="table-title">客户对象</th>
				                <th class="table-title">行业</th>
				                <th class="table-title">子行业</th>
								<th class="table-title">二级子行业</th>
								<th class="table-title">版本</th>
								<th class="table-title">日期</th>
								<th class="table-title">状态</th>
								<th class="table-title">查看文件</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>8</td>
				                <td>模板1</td>
				                <td>所有人</td>
								<td>服务业</td>
								<td>服务业1</td>
								<td>服务业2</td>
								<td>v1.0</td>
								<td>2016-12-28</td>
								<td>启动</td>
								<td><a href="javascript:alert('不要使用a href = #,否则会影响样式');">查看</a></td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button id="add_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button id="delete_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#delete_confirm'}"><span class="am-icon-trash-o"></span> 删除</button>
						<button id="update_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 修改</button>
	            	</div>
	          		<ul class="am-pagination am-fr">
		                <li class="am-disabled"><a href="#">上一页</a></li>
						<li>当前第</li>
						<li><input type="text" class="am-form-field am-input-sm am-input-xm" style="width:20px"/></li>
						<li>页，共</li>
						<li>1</li>
						<li>页</li>
						<li><a href="#">下一页</a></li>
						<li>跳转到第</li>
						<li><input type="text" class="am-form-field am-input-sm am-input-xm" style="width:25px"/></li>
						<li>页</li>
						<li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;">go</button></li>
	              	</ul>
	        	</form>
        	</div>
        	<%@include file="/System/foot.jsp" %>
		</div>
		
		<!-- 添加模板信息 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:550px;height:450px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加模板信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">模板名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_templateName" style="width:70%" required="required" oninvalid="setCustomValidity('模板不能为空');" oninput="setCustomValidity('');" placeholder="请输入模板名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户对象：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_customer" style="width:70%" required="required" oninvalid="setCustomValidity('客户对象不能为空');" oninput="setCustomValidity('');" placeholder="请输入客户对象">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">行业：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_trade" style="width:70%" required="required" oninvalid="setCustomValidity('行业不能为空');" oninput="setCustomValidity('');" placeholder="请输入行业">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">子行业：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_childTrade" style="width:70%" required="required" oninvalid="setCustomValidity('子行业不能为空');" oninput="setCustomValidity('');" placeholder="请输入子行业">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">二级子行业：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_secondChildTrade" style="width:70%" required="required" oninvalid="setCustomValidity('二级子行业不能为空');" oninput="setCustomValidity('');" placeholder="请输入二级子行业">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_date" style="width:70%" placeholder="请选择日期" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">状态：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:20%">
							    	<input type="radio"  value="" id="add_status" name="add_status"> 启用
							    </label>
							    <label class="am-radio-inline" style="width:20%;margin-left:10%">
							    	<input type="radio" id="add_status" name="add_status" checked="checked"> 禁用
						    	</label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">Word文件路径：</div>
		          			<div class="you">
								<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				        			<ul>
					        		    <li><input type="file" id="add_file" onchange="getFilePath('add')" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/></li>
					        			<li style="width:73%;margin-left:-16px"><input id="add_filePath" name="add_filePath" type="text" class="am-form-field am-input-sm am-input-xm" required="required" oninvalid="setCustomValidity('文件路径不能为空');" oninput="setCustomValidity('');"/></li>
					        			<li style="margin-left: 15px;"><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="selectFile('add');">浏览</button></li>
				        			</ul>
		        				</div>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf btn-margin-top">
					         <div align="center">
					         	<button type="submit" class="am-btn am-btn-success am-radius">确定</button>
					         </div>
				        </div>
					</form>
		    	</div>
	    	</div>
		</div>
		<!-- 修改模板信息 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:550px;height:450px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改模板信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">模板名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_templateName" style="width:70%" required="required" oninvalid="setCustomValidity('模板不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户对象：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_customer" style="width:70%" required="required" oninvalid="setCustomValidity('客户对象不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">行业：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_trade" style="width:70%" required="required" oninvalid="setCustomValidity('行业不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">子行业：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_childTrade" style="width:70%" required="required" oninvalid="setCustomValidity('子行业不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">二级子行业：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_secondChildTrade" style="width:70%" required="required" oninvalid="setCustomValidity('二级子行业不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="update_date" style="width:70%" placeholder="2017-01-04" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">状态：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:20%">
							    	<input type="radio"  value="" id="update_status" name="update_status"> 启用
							    </label>
							    <label class="am-radio-inline" style="width:20%;margin-left:10%">
							    	<input type="radio" id="update_status" name="update_status" checked="checked"> 禁用
						    	</label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">Word文件路径：</div>
		          			<div class="you">
								<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				        			<ul>
					        		    <li><input type="file" id="update_file" onchange="getFilePath('update')" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/></li>
					        			<li style="width:73%;margin-left:-16px"><input id="update_filePath" name="update_filePath" type="text" class="am-form-field am-input-sm am-input-xm" required="required" oninvalid="setCustomValidity('文件路径不能为空');" oninput="setCustomValidity('');"/></li>
					        			<li style="margin-left: 15px;"><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="selectFile('update');">浏览</button></li>
				        			</ul>
		        				</div>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf btn-margin-top">
					         <div align="center">
					         	<button type="submit" class="am-btn am-btn-success am-radius">确定</button>
					         </div>
				        </div>
					</form>
		    	</div>
	    	</div>
		</div>
		<!-- 删除列表信息 -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="delete_confirm">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					<h4 >温馨提示</h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
				</div>
				<div class="am-modal-bd">您确定删除所选内容吗？</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>取消</span>
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 筛选按钮的点击事件
	function query() {
		alert('我是筛选按钮的点击事件');
	};
	
	//触发 文件选择的click事件 
	function selectFile(type) {
	    if (type == "add") {
			$("#add_file").trigger("click");  
	    } else {
	    	$("#update_file").trigger("click");
	    }
	} 
	
	/* 获取 文件的路径 ，用于测试*/
	function getFilePath(type) { 
		if (type == "add") {
			$("#add_filePath").attr("value", $("#add_file").val());
	    } else {
	    	$("#update_filePath").attr("value", $("#update_file").val());
	    }
	}  
</script>
</html>
