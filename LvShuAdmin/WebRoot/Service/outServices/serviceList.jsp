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
			    <ul class="am-icon-flag on"> 服务明细列表 </ul>
			</div>
			
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px; width: 90px;">服务提供商：</li>
					<li>
						<input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px; width: 30px;">值：</li>
					<li>
						<input name="queryParams.productName" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">服务名称：</li>
					<li>
						<input name="queryParams.productModel" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px;"/>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">状态：</li>
					<li>
						<select data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
							<option value="start">启用</option>
							<option value="stop">禁用</option>
						</select>
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
								<th class="table-title">服务提供商</th>
				                <th class="table-title">服务名称</th>
				                <th class="table-title">服务内容</th>
				                <th class="table-title">标签号码</th>
				                <th class="table-date am-hide-sm-only">录入时间</th>
				                <th class="table-title">状态</th>
								<th class="table-title">异常项</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>4</td>
				                <td><a href="javascript:showDetailInfo();">海尔兄弟</a></td>
				                <td>游泳</td>
								<td>趴着游泳</td>
								<td>1002</td>
				                <td>2016-12-22</td>
				                <td>启用</td>
								<td>暂无</td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" data-am-modal="{target: '#import_popup'}"><span class="am-icon-upload"></span> 批量导入</button>
		              	<button type="button" class="am-btn am-btn-default"><span class="am-icon-sign-out"></span> 导出到Excel</button>
						<button type="button" class="am-btn am-btn-default" ><span class="am-icon-photo"></span> 查看二维码</button>
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
		
		<!-- 详细窗口 -->
		<div class="am-modal am-modal-no-btn" id="detail_popup">
			<div class="am-modal-dialog" style="width:50%; height:380px; overflow: auto;">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">服务详细信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd" >
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">服务提供商：</div>
		          			<div class="you">
		            			海尔兄弟
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">服务名称：</div>
		          			<div class="you">
						                      游泳
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">服务内容：</div>
		          			<div class="you">
		          				趴着游泳
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">标签号码：</div>
		          			<div class="you">
		          				1002
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">录入时间：</div>
		          			<div class="you">
		          				2016-12-22
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:15%">
		          			<div class="zuo">状态：</div>
		          			<div class="you">
		          				启用
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
		
		<!-- 上传文件  -->
		<div class="am-modal am-modal-no-btn" id="import_popup">
			<div class="am-modal-dialog" style="width: 50%;height: 180px;overflow: auto;">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">批量导入服务信息 </h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
			      	<form class="am-form" >
			      		<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf" style="margin-top: 50px;">
			        		<ul>
			        		    <li><input type="file" id="file" onchange="getFilePath()" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/></li>
			        			<li style="font-size: 14px;margin-top:3px">服务文件路径：</li>
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
	//触发 文件选择的click事件 
	function selectFile() { 
		$("#file").trigger("click");  
	} 
	
	/* 获取 文件的路径 ，用于测试*/
	function getFilePath() { 
		$("#filePath").attr("value", $("#file").val());
	} 
	// 查看详情
	function showDetailInfo()
	{
		$("#detail_popup").modal("open");
	}
</script>
</html>
