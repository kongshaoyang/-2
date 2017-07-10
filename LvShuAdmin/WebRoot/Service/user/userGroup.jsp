<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<%@include file="/System/header.jspf" %>
</head>

<body>
	<div class="admin-content">
		<!-- 查询列表 -->
		<div class="admin-biaogelist">
		    <div class="listbiaoti am-cf">
			    <ul class="am-icon-flag on"> 用户组列表 </ul>
			</div>
			
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">组名：</li>
					<li>
						<input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					
					<li style="margin-left: 10px;">
						<button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" data-am-modal="{target: '#doc-modal-1'}">筛选</button>
					</li>
			   </ul>
			</div>	
			<div>
	    		<form class="am-form am-g" style="margin-top: -8px;">
		        	<table id="list_table" style="width:100%;" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
		            	<thead>
		            		<tr class="am-success">
			                	<th class="table-check"><input type="checkbox" /></th>
				                <th class="table-id">ID</th>
								<th class="table-title">组名</th>
				                <th class="table-title">权限集</th>
				                <th class="table-title">状态</th>
								<th class="table-title">描述</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>1</td>
				                <td><a href="javascript:showDetailInfo();">测试用户组</a></td>
				                <td>权限1,权限2,权限3,权限4,权限5,权限6,权限7,权限8</td>
								<td>启用</td>
								<td>测试可以修改</td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 修改</button>
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#resetPassword_popup'}"><span class="am-icon-hand-paper-o"></span> 启用</button>
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#resetPassword_popup'}"><span class="am-icon-stop-circle"></span> 停用</button>
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
		
		<!-- 添加窗口 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:45%; height:360px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加用户组</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">组名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" placeholder="请输入组名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" >
		          			<div class="zuo">组权限集：</div>
		          			<div class="you">
		            			<label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="1">权限名1
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="2">权限名2
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="3">权限名3
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="4">权限名4
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="5">权限名5
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="6">权限名6
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="7">权限名7
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="8">权限名8
							    </label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">组状态：</div>
		          			<div class="you">
		            			<select style="width:70%;height: 32px;" class="am-input-sm">
					              	<option value="1">启用</option>
					              	<option value="2">停用</option>
					            </select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">组描述：</div>
		          			<div class="you">
		            			<textarea rows="4" class="am-input-sm" placeholder="请输入组描述"></textarea>
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
		
		<!-- 修改窗口 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:45%; height:360px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改用户组</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">组名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" placeholder="请输入组名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" >
		          			<div class="zuo">组权限集：</div>
		          			<div class="you">
		            			<label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="1">权限名1
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="2">权限名2
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="3">权限名3
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="4">权限名4
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="5">权限名5
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="6">权限名6
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="7">权限名7
							    </label>
							    <label class="am-checkbox-inline" style="margin-left:0px;">
							    	<input type="checkbox" value="8">权限名8
							    </label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">组状态：</div>
		          			<div class="you">
		            			<select style="width:70%;height: 32px;" class="am-input-sm">
					              	<option value="1">启用</option>
					              	<option value="2">停用</option>
					            </select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">组描述：</div>
		          			<div class="you">
		            			<textarea rows="4" class="am-input-sm" placeholder="请输入组描述"></textarea>
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
		
		<!-- 详细窗口 -->
		<div class="am-modal am-modal-no-btn" id="detail_popup">
			<div class="am-modal-dialog" style="width:45%; height:275px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">用户组详细信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd" >
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">组名称：</div>
		          			<div class="you">
		            			测试用户组
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">权限集：</div>
		          			<div class="you">
						                      权限1,权限2,权限3,权限4,权限5,权限6,权限7
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">状态：</div>
		          			<div class="you">
		          				启用
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">描述：</div>
		          			<div class="you">
		          				测试可以修改
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
		
		<div class="am-modal am-modal-alert" tabindex="-1" id="doc-modal-1">
			<div class="am-modal-dialog">
		    	<div class="am-modal-hd">筛选提示
		      		<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    	</div>
		    	<div class="am-modal-bd">
		      		并没用筛选结果
		    	</div>
		    	<div class="am-modal-footer">
			      	<span class="am-modal-btn">确定</span>
			    </div>
		  	</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 查看详情
	function showDetailInfo()
	{
		$("#detail_popup").modal("open");
	}
</script>
</html>
