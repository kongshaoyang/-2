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
			    <ul class="am-icon-flag on"> 合同列表</ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top: 2px;">客户名称：</li>
					<li><input name="queryParams.customerName" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">合同名称：</li>
					<li><input name="queryParams.templateName" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">销售员：</li>
					<li><input name="queryParams.salesman" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">状态：</li>
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
								<th class="table-title">客户名称</th>
				                <th class="table-title">合同名称</th>
				                <th class="table-title">主要协议内容</th>
				                <th class="table-title">销售员</th>
								<th class="table-title">起始时间</th>
								<th class="table-title">结束时间</th>
								<th class="table-title">签署日期</th>
								<th class="table-title">版本</th>
								<th class="table-title">状态</th>
								<th class="table-title">查看文件</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>8</td>
				                <td>特朗普</td>
				                <td>中国收购美国合同</td>
								<td>美国无条件服从收购</td>
								<td>欧阳灿</td>
								<td>2017-01-01</td>
								<td>2050-01-01</td>
								<td>2016-12-28</td>
								<td>v1.0</td>
								<td>启用</td>
								<td><a href="javascript:alert('不要使用a href = #,否则会影响样式');">查看</a></td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button id="detail_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#detail_popup'}"><span class="am-icon-search"></span> 查看详情</button>
						<button id="add_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button id="delete_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#delete_confirm'}"><span class="am-icon-trash-o"></span> 删除</button>
						<button id="update_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 修改</button>
						<button id="stop_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#stop_popup'}"><span class="am-icon-pause"></span> 终止</button>
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
		
		<!-- 添加合同信息 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:600px;height:480px;overflow: auto">
		    	<div class="am-popup-hd">
		     			<h4 class="am-popup-title">添加合同信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
		   		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_customerName" style="width:70%" required="required" oninvalid="setCustomValidity('客户名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入客户名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_templateName" style="width:70%" required="required" oninvalid="setCustomValidity('合同名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入合同名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">主要协议内容：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_mainAgreement" style="width:70%" required="required" oninvalid="setCustomValidity('主要协议内容不能为空');" oninput="setCustomValidity('');" placeholder="请输入主要协议内容">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">销售员：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_salesman" style="width:70%" required="required" oninvalid="setCustomValidity('销售员不能为空');" oninput="setCustomValidity('');" placeholder="请输入销售员">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">起始时间：</div>
		          			<div class="you">
		            			<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_startTime" style="width:70%" placeholder="请选择起始时间" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">结束时间：</div>
		          			<div class="you">
		            			<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_startTime" style="width:70%" placeholder="请选择结束时间" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		 <div class="am-form-group am-cf">
		          			<div class="zuo">版本：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_salesman" style="width:70%" required="required" oninvalid="setCustomValidity('版本不能为空');" oninput="setCustomValidity('');" placeholder="请输入版本">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">签署日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_date" style="width:70%" placeholder="请选择签署日期" data-am-datepicker="{theme: 'success',}"  readonly/>
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
		<!-- 修改合同信息 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:600px;height:480px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改合同信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_customerName" style="width:70%" required="required" oninvalid="setCustomValidity('客户名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_templateName" style="width:70%" required="required" oninvalid="setCustomValidity('合同名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">主要协议内容：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_mainAgreement" style="width:70%" required="required" oninvalid="setCustomValidity('主要协议内容不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">销售员：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_salesman" style="width:70%" required="required" oninvalid="setCustomValidity('销售员不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">起始时间：</div>
		          			<div class="you">
		            			<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_startTime" style="width:70%" placeholder="2017-01-01" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">结束时间：</div>
		          			<div class="you">
		            			<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_startTime" style="width:70%" placeholder="2050-01-01" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">签署日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_date" style="width:70%" placeholder="2016-12-28" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">版本：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_salesman" style="width:70%" required="required" oninvalid="setCustomValidity('版本不能为空');" oninput="setCustomValidity('');">
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
		<!-- 查看合同详细信息 -->
		<div class="am-modal am-modal-no-btn" id="detail_popup">
			<div class="am-modal-dialog" style="width:480px;height:440px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">合同详细信息</h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
			      	<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户名称：</div>
		          			<div id="detail_manufacture" class="you">
		            			特朗普
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同名称：</div>
		          			<div id="detail_productModel" class="you">
								中国收购美国合同
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" >
		          			<div class="zuo">主要协议内容：</div>
		          			<div id="detail_productName" class="you">
	          					美国无条件服从收购
	          					美国无条件服从收购
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">销售员：</div>
		          			<div id="detail_instruction" class="you">
	          					美国无条件服从收购
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">起始时间：</div>
		          			<div id="detail_version" class="you">
		          				2017-01-01
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">结束时间：</div>
		          			<div id="detail_author" class="you">
		          				2050-01-01
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">签署日期：</div>
		          			<div id="detail_uploadTime" class="you">
		          				2016-12-28
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">版本：</div>
		          			<div id="detail_status" class="you">
	          					v1.0
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">状态：</div>
		          			<div id="detail_systemStatus" class="you">
		          				启用
		          			</div>
		        		</div>
				        <div>
					    	<div class="am-form-group am-cf btn-margin-top" align="center">
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
