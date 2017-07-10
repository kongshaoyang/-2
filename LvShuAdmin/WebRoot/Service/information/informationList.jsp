<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<meta name="" content="信息推广--信息推广">
	<%@include file="/System/header.jspf" %>
</head>

<body>
	<div class="admin-content">
		<div class="admin-biaogelist">
		    <div class="listbiaoti am-cf">
			    <ul class="am-icon-flag on"> 信息推广列表</ul>
			</div>
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li style="font-size: 14px; margin-top: 2px;margin-left:10px">信息标题：</li>
					<li><input name="queryParams.manufacture" type="text" class="am-form-field am-input-sm am-input-xm" style="width:128px"/></li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">信息类型：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">				
							<select id="queryStatusCombox" data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
								<option value="1">厂商公告</option>
								<option value="2">服务变更公告</option>
								<option value="3">新产品发布营销</option>
								<option value="4">活动客户通知</option>
								<option value="5">召回通知</option>
							</select>
						</div>
					</li>
					<li style="margin-left: 10px; font-size: 14px; margin-top:2px;">终端类型：</li>
					<li>
						<div class="am-btn-group am-btn-group-xs">				
							<select id="queryStatusCombox" data-am-selected="{btnWidth: 128, btnSize: 'sm', btnStyle: 'default'}">
								<option value="1">公众号</option>
								<option value="2">移动应用</option>
							</select>
						</div>
					</li>
					
					<li style="margin-left: 10px;"><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;" onclick="query();return false;">筛选</button></li>
			   </ul>
			</div>
			 
    		<form class="am-form am-g" style="margin-top: -8px;">
	        	<table id="list_table" style="width:100%;" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
	            	<thead>
	            		<tr class="am-success">
		                	<th class="table-check"><input type="checkbox" /></th>
			                <th class="table-id">ID</th>
							<th class="table-title">信息类型</th>
			                <th class="table-title">信息标题</th>
			                <th class="table-title">终端类型</th>
			                <th class="table-title">推送方式</th>
							<th class="table-title">用户范围</th>
							<th class="table-title">开始时间</th>
							<th class="table-title">结束时间</th>
		              	</tr>
	            	</thead>
	            	<tbody>
	              		<tr>
	                		<td><input type="checkbox" /></td>
			                <td>1</td>
			                <td>服务变更公告</td>
			                <td>
			                	<a href="javascript:showInfoMationDetail();">压力测试</a>
			                </td>
							<td>移动应用</td>
							<td>被动方式</td>
							<td>湖南省长沙市</td>
							<td>2017年1月4日 21:17:52</td>
							<td>2017年2月1日 24:00:00</td>
	              		</tr>
	            	</tbody>
	          	</table>
              	<div class="am-btn-group am-btn-group-xs">
					<button id="add_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#add_popup'}"><span class="am-icon-plus"></span> 增加</button>
	              	<button id="delete_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#delete_confirm'}"><span class="am-icon-trash-o"></span> 删除</button>
					<button id="update_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#update_popup'}"><span class="am-icon-edit"></span> 修改</button>
	              	<button id="upload_btn" type="button" class="am-btn am-btn-default" data-am-modal="{target: '#detail_popup'}"><span class="am-icon-search"></span> 推广信息详情</button>
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
        	<%@include file="/System/foot.jsp" %>
		</div>
			
		<!-- 添加推广信息 -->
		<div class="am-modal am-modal-no-btn" id="add_popup">
			<div class="am-modal-dialog" style="width:55%; height:410px;overflow: auto;">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">添加推广信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		      			<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">信息类型：</div>
		          			<div class="you">
		          				<select id="add_videoType" class="am-input-sm" style="width:70%">
		          					<option value="1">厂商公告</option>
									<option value="2">服务变更公告</option>
									<option value="3">新产品发布营销</option>
									<option value="4">活动客户通知</option>
									<option value="5">召回通知</option>
		          				</select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">信息标题：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" required="required" oninvalid="setCustomValidity('信息标题不能为空');" oninput="setCustomValidity('');" placeholder="请输入信息标题">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">终端类型：</div>
		          			<div class="you">
		          				<select id="add_videoType" class="am-input-sm" style="width:70%">
		          					<option value="1">公众号</option>
									<option value="2">移动应用</option>
		          				</select>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">推送方式：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:25%">
							    	<input type="radio"  value="" id="add_syetemStatus" name="add_syetemStatus">主动方式
							    </label>
							    <label class="am-radio-inline" style="width:25%;margin-left:10%">
							    	<input type="radio" id="add_syetemStatus" name="add_syetemStatus" checked="checked">被动方式
						    	</label>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">用户范围：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" required="required" oninvalid="setCustomValidity('用户范围不能为空');" oninput="setCustomValidity('');" placeholder="请输入用户范围">
		          			</div>
		        		</div>
		        		
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">开始时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择开始时间" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">结束时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择结束时间" data-am-datepicker="{theme: 'success',}"  readonly/>
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
		<!-- 修改推广信息 -->
		<div class="am-modal am-modal-no-btn" id="update_popup">
			<div class="am-modal-dialog" style="width:55%; height:410px;overflow: auto;">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">修改推广信息</h4>
					<span data-am-modal-close class="am-close" style="color:blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
		      		<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">信息类型：</div>
		          			<div class="you">
		          				<select id="add_videoType" class="am-input-sm" style="width:70%">
		          					<option value="1">厂商公告</option>
									<option value="2">服务变更公告</option>
									<option value="3">新产品发布营销</option>
									<option value="4">活动客户通知</option>
									<option value="5">召回通知</option>
		          				</select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">信息标题：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_productName" style="width:70%" required="required" oninvalid="setCustomValidity('信息标题不能为空');" oninput="setCustomValidity('');" placeholder="请输入信息标题">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">终端类型：</div>
		          			<div class="you">
		          				<select id="add_videoType" class="am-input-sm" style="width:70%">
		          					<option value="1">公众号</option>
									<option value="2">移动应用</option>
		          				</select>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">推送方式：</div>
		          			<div class="you">
		          				<label class="am-radio-inline" style="width:25%">
							    	<input type="radio"  value="" id="add_syetemStatus" name="add_syetemStatus">主动方式
							    </label>
							    <label class="am-radio-inline" style="width:25%;margin-left:10%">
							    	<input type="radio" id="add_syetemStatus" name="add_syetemStatus" checked="checked">被动方式
						    	</label>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">用户范围：</div>
		          			<div class="you">
		            			<input type="text" class="am-input-sm" id="add_version" style="width:70%" required="required" oninvalid="setCustomValidity('用户范围不能为空');" oninput="setCustomValidity('');" placeholder="请输入用户范围">
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">开始时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择开始时间" data-am-datepicker="{theme: 'success',}"  readonly/>
		          			</div>
		        		</div>
		        		
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">结束时间：</div>
		          			<div class="you">
		          				<input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" id="add_uploadTime" style="width:70%" placeholder="请选择结束时间" data-am-datepicker="{theme: 'success',}"  readonly/>
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
		<!-- 查看推广信息详情 -->
		<div class="am-modal am-modal-no-btn" id="detail_popup">
			<div class="am-modal-dialog" style="width: 55%;height:380px;overflow: auto;">
		    	<div class="am-popup-hd">
	      			<h4 class="am-popup-title">推广信息详情</h4>
					<span data-am-modal-close class="am-close" style="color: blue;">&times;</span>
	    		</div>
			    <div class="am-popup-bd">
			      	<form class="am-form tjlanmu">
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">信息类型：</div>
		          			<div class="you">
		          				<span>服务变更公告</span>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">信息标题：</div>
		          			<div class="you">
		            			<span>测试</span>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">终端类型：</div>
		          			<div class="you">
		            			<span>公众号</span>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">推送方式：</div>
		          			<div class="you">
		            			<span>被动方式</span>
		          			</div>
		        		</div>
				        <div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">用户范围：</div>
		          			<div class="you">
		            			<span>湖南省长沙</span>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">开始时间：</div>
		          			<div class="you">
		          				<span>2017年1月4日 21:16:32</span>
		          			</div>
		        		</div>
		        		<div class="am-form-group am-cf" style="margin-left:10%">
		          			<div class="zuo">结束时间：</div>
		          			<div class="you">
		          				<span>2017年3月2日 24:00:00</span>
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
