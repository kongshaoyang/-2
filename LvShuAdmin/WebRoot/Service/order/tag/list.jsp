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
			    <ul class="am-icon-flag on"> 标签列表</ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top:2px;">客户名称：</li>
					<li><input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">合同名称：</li>
					<li><input name="queryParams.productName" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
			   		<li style="margin-left: 10px;font-size: 14px; margin-top:2px;">标签类型：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">				
							<select id="queryStatusCombox" data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
								<option value="start">A</option>
								<option value="stop">B</option>
							</select>
						</div>
					</li>
					<li style="margin-left: 10px;font-size: 14px; margin-top:2px;">状态：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">				
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
				                <th class="table-title">合同状态</th>
				                <th class="table-title">标签类型</th>
								<th class="table-title">标签数量</th>
								<th class="table-title">标签规格描述</th>
								<th class="table-title">申请日期</th>
								<th class="table-title">交付日期</th>
								<th class="table-title">状态</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>14</td>
				                <td>Rose</td>
								<td>Agreement of China and America</td>
								<td>valid</td>
								<td>A</td>
								<td>10</td>
								<td>no description</td>
								<td>2016-12-28</td>
								<td>2016-12-31</td>
								<td>start</td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button id="add_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button id="delete_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#delete_confirm'}"><span class="am-icon-trash-o"></span> 删除</button>
						<button id="update_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 更新</button>
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
		
		<!-- 添加标签信息 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:520px;height:480px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加标签</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" required="required" oninvalid="setCustomValidity('客户名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入客户名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" required="required" oninvalid="setCustomValidity('合同名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入合同名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同状态：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productModel" style="width:70%" required="required" oninvalid="setCustomValidity('合同状态不能为空');" oninput="setCustomValidity('');" placeholder="请输入合同状态">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">标签类型：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_instruction" style="width:70%" required="required" oninvalid="setCustomValidity('标签类型不能为空');" oninput="setCustomValidity('');" placeholder="请输入标签类型">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">标签数量：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" required="required" oninvalid="setCustomValidity('标签数量不能为空');" oninput="setCustomValidity('');" placeholder="请输入标签数量">
		          			</div>
		        		</div>
				       <div class="am-form-group am-cf">
		          			<div class="zuo">标签规格描述：</div>
		          			<div class="you">
		            			<textarea rows="4" class="am-input-sm" id="add_pictureDesc" style="width:70%" placeholder="请输入标签规格描述"></textarea>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">申请日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择申请日期" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">交付日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择交付日期" data-am-datepicker="{theme: 'success',}"  readonly/>
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
				        <div class="am-form-group am-cf btn-margin-top">
					         <div align="center">
					         	<button type="submit" class="am-btn am-btn-success am-radius">提交</button>
					         </div>
				        </div>
					</form>
		    	</div>
	    	</div>
		</div>
		<!-- 修改标签信息 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:520px;height:480px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改标签</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">客户名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" required="required" oninvalid="setCustomValidity('客户名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" required="required" oninvalid="setCustomValidity('合同名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">合同状态：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productModel" style="width:70%" required="required" oninvalid="setCustomValidity('合同状态不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">标签类型：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_instruction" style="width:70%" required="required" oninvalid="setCustomValidity('标签类型不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">标签数量：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" required="required" oninvalid="setCustomValidity('标签数量不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				       <div class="am-form-group am-cf">
		          			<div class="zuo">标签规格描述：</div>
		          			<div class="you">
		            			<textarea rows="4" class="am-input-sm" id="add_pictureDesc" style="width:70%"></textarea>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">申请日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="2017-01-05" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">交付日期：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="2017-01-10" data-am-datepicker="{theme: 'success',}"  readonly/>
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
				        <div class="am-form-group am-cf btn-margin-top">
					         <div align="center">
					         	<button type="submit" class="am-btn am-btn-success am-radius">提交</button>
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
</script>
</html>
