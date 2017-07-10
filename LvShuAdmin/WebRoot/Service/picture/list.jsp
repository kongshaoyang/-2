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
			    <ul class="am-icon-flag on"> 图片列表</ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top: 2px;margin-left:23px">制造商：</li>
					<li><input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">产品名称：</li>
					<li><input name="queryParams.productName" type="text"  class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">产品型号：</li>
					<li><input name="queryParams.productModel" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">状态：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">				
							<select id="queryStatusCombox" data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
								<option value="start">启用</option>
								<option value="stop">禁用</option>
							</select>
						</div>
					</li>
			   </ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">图片名称：</li>
					<li><input name="queryParams.pictureName" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">图片类型：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">				
							<select id="queryTypeCombox" data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
								<option value="1">仅图片</option>
								<option value="2">带详情图片</option>
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
								<th class="table-title">版本号</th>
								<th class="table-title">图片名称</th>
								<th class="table-title">图片类型</th>
								<th class="table-title">关键字</th>
				                <th class="table-author am-hide-sm-only">上传者</th>
				                <th class="table-date am-hide-sm-only">上传时间</th>
								<th class="table-title">状态</th>
			              	</tr>
		            	</thead>
		            	<tbody>
		              		<tr>
		                		<td><input type="checkbox" /></td>
				                <td>6</td>
				                <td>百一自联</td>
				                <td>绿书</td>
								<td>绿书001</td>
								<td>绿书后台管理系统操作手册</td>
								<td>v1.0</td>
								<td>蒙娜丽莎的微笑</td>
								<td>仅图片</td>
								<td>绿书</td>
								<td>欧阳灿</td>
				                <td class="am-hide-sm-only">2016年12月16日 9:28:47</td>
								<td>启动</td>
		              		</tr>
		            	</tbody>
		          	</table>
	              	<div class="am-btn-group am-btn-group-xs">
						<button id="add_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
		              	<button id="delete_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#delete_confirm'}"><span class="am-icon-trash-o"></span> 删除</button>
						<button id="update_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 修改</button>
						<button id="detail_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#detail_popup'}"><span class="am-icon-search"></span> 图片详情</button>
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
		
		<!-- 添加图片信息 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:550px;height:500px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加图片信息</h4>
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
		          			<div class="zuo">版本号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" required="required" oninvalid="setCustomValidity('版本号不能为空');" oninput="setCustomValidity('');" placeholder="请输入版本号">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_pictureName" style="width:70%" required="required" oninvalid="setCustomValidity('图片名称不能为空');" oninput="setCustomValidity('');" placeholder="请输入图片名称">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片描述：</div>
		          			<div class="you">
					    		<textarea rows="6" class="am-input-sm" id="add_pictureDesc" style="width:70%" placeholder="请输入图片描述"></textarea>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片类型：</div>
		          			<div class="you">
		          				<select id="add_pictureType" class="am-input-sm" style="width:70%">
		          					<option value="1">仅图片</option>
									<option value="2">带详情图片</option>
		          				</select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片文件路径：</div>
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
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">关键字：</div>
		          			<div class="you">
					    		<textarea rows="6" class="am-input-sm" id="add_keywords" style="width:70%" placeholder="请输入关键字（以换行方式分隔）"></textarea>
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
		<!-- 修改图片信息 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:550px;height:500px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改图片信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">制造商：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_manufacture" style="width:70%" required="required" oninvalid="setCustomValidity('制造商不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">产品名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_productName" style="width:70%" required="required" oninvalid="setCustomValidity('产品名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">产品型号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_productModel" style="width:70%" required="required" oninvalid="setCustomValidity('产品型号不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">说明书名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_instruction" style="width:70%" required="required" oninvalid="setCustomValidity('说明书名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf">
		          			<div class="zuo">版本号：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_version" style="width:70%" required="required" oninvalid="setCustomValidity('版本号不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片名称：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="update_pictureName" style="width:70%" required="required" oninvalid="setCustomValidity('图片名称不能为空');" oninput="setCustomValidity('');">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片描述：</div>
		          			<div class="you">
					    		<textarea rows="6" class="am-input-sm" id="update_pictureDesc" style="width:70%"></textarea>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片类型：</div>
		          			<div class="you">
		          				<select id="update_pictureType" class="am-input-sm" style="width:70%">
		          					<option value="1">仅图片</option>
									<option value="2">带详情图片</option>
		          				</select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">图片文件路径：</div>
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
		        		<div class="am-form-group am-cf">
		          			<div class="zuo">关键字：</div>
		          			<div class="you">
					    		<textarea rows="6" class="am-input-sm" id="update_keywords" title="关键字（以换行方式分隔）" style="width:70%"></textarea>
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
		<!-- 查看图片详情 -->
		<div class="am-modal am-modal-no-btn" id="detail_popup">
			<div class="am-modal-dialog" style="width:550px;height:170px;overflow: auto">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">图片详情</h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
			      	<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf">
		          			<span style="text-align: center;">图片详情页要用到富文本编辑框，暂时未做...</span>
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
