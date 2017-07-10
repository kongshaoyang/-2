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
			    <ul class="am-icon-flag on"> 说明书列表</ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top:2px;">制造商：</li>
					<li><input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">产品名称：</li>
					<li><input name="queryParams.productName" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">产品型号：</li>
					<li><input name="queryParams.productModel" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">说明书名称：</li>
					<li><input name="queryParams.instruction" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
			   </ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top:2px;">状  &nbsp;&nbsp;&nbsp;态：</li>
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
								<th class="table-title">制造商</th>
				                <th class="table-title">产品名称</th>
				                <th class="table-title">产品型号</th>
				                <th class="table-title">说明书名称</th>
				                <th class="table-title">说明书描述</th>
								<th class="table-title">版本号</th>
				                <th class="table-author am-hide-sm-only">上传者</th>
				                <th class="table-date am-hide-sm-only">上传时间</th>
								<th class="table-title">状态</th>
								<th class="table-title">系统录入状态</th>
								<th class="table-title">录入者</th>
								<th class="table-title">录入时间</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>14</td>
				                <td><a href="javascript:showInfoMationDetail();">长城</a></td>
				                <td>长城存取款一体机</td>
								<td>PZ800</td>
								<td>长城PZ800机型指导手册</td>
								<td>官方文档</td>
								<td>v1.0</td>
								<td>欧阳灿</td>
				                <td class="am-hide-sm-only">2016年9月4日 7:28:47</td>
								<td>启动</td>
								<td>已录入</td>
								<td>欧阳灿</td>
								<td>2016年9月4日 7:28:47</td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button id="add_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button id="delete_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#delete_confirm'}"><span class="am-icon-trash-o"></span> 删除</button>
						<button id="update_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#checkError_popup'}"><span class="am-icon-edit"></span> 勘误</button>
		              	<button id="upload_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#updateVersion_popup'}"><span class="am-icon-refresh"></span> 更新版本</button>
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
		
		<!-- 添加说明书信息 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:550px;height:500px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加说明书</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">制造商：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_manufacture" style="width:70%" required="required" oninvalid="setCustomValidity('制造商不能为空');" oninput="setCustomValidity('');" placeholder="请输入制造商">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">产品名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" required="required" oninvalid="setCustomValidity('产品名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入产品名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">产品型号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productModel" style="width:70%" required="required" oninvalid="setCustomValidity('产品型号不能为空');" oninput="setCustomValidity('');" placeholder="请输入产品型号">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">说明书名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_instruction" style="width:70%" required="required" oninvalid="setCustomValidity('说明书名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入说明书名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">说明书描述：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_instructionDesc" style="width:70%" required="required" oninvalid="setCustomValidity('说明书描述不能为空');" oninput="setCustomValidity('');" placeholder="请输入说明书描述">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">版本号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" required="required" oninvalid="setCustomValidity('版本号不能为空');" oninput="setCustomValidity('');" placeholder="请输入版本号">
		          			</div>
		        	    </div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">上传者：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_author" style="width:70%" required="required" oninvalid="setCustomValidity('上传者不能为空');" oninput="setCustomValidity('');" placeholder="请输入上传者">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">上传时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择上传时间" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">状态：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:25%">
							    	<input type="radio"  value="" id="add_status" name="add_status"> 启用
							    </label>
							    <label class="am-radio-inline" style="width:25%;margin-left:10%">
							    	<input type="radio" id="add_status" name="add_status" checked="checked"> 禁用
						    	</label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">系统录入状态：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:25%">
							    	<input type="radio"  value="" id="add_syetemStatus" name="add_syetemStatus"> 已录入
							    </label>
							    <label class="am-radio-inline" style="width:25%;margin-left:10%">
							    	<input type="radio" id="add_syetemStatus" name="add_syetemStatus" checked="checked"> 未录入
						    	</label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">录入者：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_inputer" style="width:70%" required="required" oninvalid="setCustomValidity('录入者不能为空');" oninput="setCustomValidity('');" placeholder="请输入录入者">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">录入时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_insertTime" style="width:70%" placeholder="请选择录入时间" data-am-datepicker="{theme: 'success',}"  readonly/>
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
		<!-- 勘误  -->
		<div class="am-modal am-modal-no-btn" id="checkError_popup">
			<div class="am-modal-dialog" style="width:560px;height:500px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">勘误</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">制造商：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_manufacture" style="width:70%" required="required" oninvalid="setCustomValidity('制造商不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">产品名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_productName" style="width:70%" required="required" oninvalid="setCustomValidity('产品名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">产品型号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_productModel" style="width:70%" required="required" oninvalid="setCustomValidity('产品型号不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">说明书名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_instruction" style="width:70%" required="required" oninvalid="setCustomValidity('说明书名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">说明书描述：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_instructionDesc" style="width:70%" required="required" oninvalid="setCustomValidity('说明书描述不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">版本号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_version" style="width:70%" required="required" oninvalid="setCustomValidity('版本号不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        	    </div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">上传者：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_author" style="width:70%" required="required" oninvalid="setCustomValidity('上传者不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">上传时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="check_uploadTime" style="width:70%" placeholder="2017-01-10" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">状态：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:20%">
							    	<input type="radio"  value="" id="check_status" name="check_status"> 启用
							    </label>
							    <label class="am-radio-inline" style="width:20%;margin-left:10%">
							    	<input type="radio" id="check_status" name="check_status" checked="checked"> 禁用
						    	</label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">系统录入状态：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:20%">
							    	<input type="radio"  value="" id="check_syetemStatus" name="check_syetemStatus"> 已录入
							    </label>
							    <label class="am-radio-inline" style="width:20%;margin-left:10%">
							    	<input type="radio" id="check_syetemStatus" name="check_syetemStatus" checked="checked"> 未录入
						    	</label>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">录入者：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="check_inputer" style="width:70%" required="required" oninvalid="setCustomValidity('录入者不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">录入时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="check_insertTime" style="width:70%" placeholder="2017-01-10" data-am-datepicker="{theme: 'success',}"  readonly/>
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
		<!-- 查看说明书详细信息 -->
		<div class="am-modal am-modal-no-btn" id="detail_popup">
			<div class="am-modal-dialog" style="width:550px;height:170px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">说明书详细信息</h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
			      	<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		        			<span style="text-align: center;">说明书详情页要用到富文本编辑框，暂时未做...</span>
		        		</div>
				        <div>
					    	<div class="am-form-group am-cf" align="center" style="margin-top: 20px;">
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
		<!-- 更新版本  -->
		<div class="am-modal am-modal-no-btn" id="updateVersion_popup">
			<div class="am-modal-dialog" style="width:580px;height:180px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">更新说明书版本 </h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
			      	<form class="am-form" >
			      		<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf" style="margin-top: 50px;">
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
	</div>
</body>
<script type="text/javascript">
	// 筛选按钮的点击事件
	function query() {
		alert('我是筛选按钮的点击事件');
	};
	
	//触发 文件选择的click事件 
	function selectFile() { 
		$("#file").trigger("click");  
	} 
	
	/* 获取 文件的路径 ，用于测试*/
	function getFilePath() { 
		$("#filePath").attr("value", $("#file").val());
	} 
	
	// 查看详情
	function showInfoMationDetail()
	{
		$("#detail_popup").modal("open");
	}
	
</script>
</html>
