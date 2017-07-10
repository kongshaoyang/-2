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
			    <ul class="am-icon-flag on">视频供应商列表 </ul>
			</div>
			
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top:2px;">供应商名称：</li>
					<li>
						<input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">地区：</li>
					<li>
						<input name="queryParams.productName" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">当前视频价格：</li>
					<li>
						<input name="queryParams.productModel" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">等级：</li>
					<li>
						<input name="queryParams.instruction" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
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
								<th class="table-title">供应商名称</th>
				                <th class="table-title">地区</th>
				                <th class="table-title">合作起始日期</th>
				                <th class="table-title">当前视频价格</th>
								<th class="table-title">累计视频数量</th>
				                <th class="table-author am-hide-sm-only">累计视频时长</th>
				                <th class="table-date am-hide-sm-only">累计视频金额</th>
				                <th class="table-title">等级</th>
								<th class="table-title">排名</th>
								<th class="table-title">异常项</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>1</td>
				                <td><a href="javascript:showDetailInfo();">长城</a></td>
				                <td>大中华地区</td>
								<td>2017年1月3号</td>
								<td>1800 元</td>
								<td>100 台</td>
								<td>500分钟</td>
				                <td class="am-hide-sm-only">800元</td>
								<td>1级</td>
								<td>No.4</td>
								<td>暂无</td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 修改</button>
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
			<div class="am-modal-dialog" style="width:50%; height:380px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加视频供应商</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">供应商名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" placeholder="请输入供应商名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">地区：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" placeholder="请输入地区">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">合作起始日期：</div>
		          			<div class="you">
		            			<input type="text" class="am-form-field am-input-sm am-input-zm am-icon-calendar" style="width:70%" placeholder="合作起始日期" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">当前视频价格：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_instruction" style="width:70%" placeholder="请输入当前视频价格">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">等级：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" placeholder="请输入等级">
		          			</div>
		        		</div>
				       <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">异常项：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_author" style="width:70%" placeholder="请输入异常项">
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
			<div class="am-modal-dialog" style="width:50%; height:480px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">视频供应商详细信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd" >
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">供应商名称：</div>
		          			<div class="you">
		            			长城
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">地区：</div>
		          			<div class="you">
		          				大中华地区
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">合作起始日期：</div>
		          			<div class="you">
		          				2017年1月3号
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">当前视频价格：</div>
		          			<div class="you">
		          				1800 元
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">累计视频数量：</div>
		          			<div class="you">
		          				100 台
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">累计视频时长：</div>
		          			<div class="you">
		          				500分钟
		          			</div>
		        		</div>
				       	<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">累计视频金额：</div>
		          			<div class="you">
		          				800元
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">等级：</div>
		          			<div class="you">
		          				1级
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">排名：</div>
		          			<div class="you">
		          				No.4
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">异常项：</div>
		          			<div class="you">
		          				暂无
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
		
		<!-- 修改窗口 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:50%; height:380px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改视频供应商</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">供应商名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" placeholder="请输入供应商名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">地区：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" placeholder="请输入地区">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">合作起始日期：</div>
		          			<div class="you">
		            			<input type="text" class="am-form-field am-input-sm am-input-zm am-icon-calendar" style="width:70%" placeholder="合作起始日期" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">当前视频价格：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_instruction" style="width:70%" placeholder="请输入当前视频价格">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">等级：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" placeholder="请输入等级">
		          			</div>
		        		</div>
				       <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">异常项：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_author" style="width:70%" placeholder="请输入异常项">
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
