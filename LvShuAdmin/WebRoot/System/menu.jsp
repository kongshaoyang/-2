<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="nav-navicon admin-main admin-sidebar">
    <div class="sideMenu">
		<h3 class="am-icon-user" ><em></em> <a href="#">用户管理</a></h3>
		<ul>
	     	<li><a onclick="addTab('101', '/Service/user/list.jsp', '用户列表'); return false;"  href="">用户列表</a></li>
	        <li><a onclick="addTab('102', '/Service/user/userGroup.jsp', '用户组'); return false;" href="">用户组</a></li>
	        <li><a onclick="addTab('103', '/Service/user/userAuthor.jsp', '用户权限'); return false;" href="">用户权限</a></li>
      	</ul>
      	<h3 class="am-icon-gears"><em></em> <a href="#">系统参数</a></h3>
     	<ul>
	        <li><a onclick="addTab('121', '/Service/systemParameter/operatingParameter.jsp', '运行参数 '); return false;" href="">运行参数 </a></li>
	        <li><a onclick="addTab('122', '/Service/systemParameter/serviceBaseData.jsp', '业务基础数据'); return false;" href="">业务基础数据</a></li>
	        <li><a onclick="addTab('123', '/Service/systemParameter/serviceParameter.jsp', '业务参数'); return false;" href="">业务参数</a></li>
      	</ul>
      	<h3 class="am-icon-tags"><em></em> <a href="#">说明书</a></h3>
     	<ul>
	        <li><a onclick="addTab('131', '/Service/instruction/manufactureList.jsp', '厂商原始说明书'); return false;" href="">厂商原始说明书</a></li>
			<li><a onclick="addTab('132', '/Service/instruction/input.jsp', '录入'); return false;" href="">录入</a></li>
	        <li><a onclick="addTab('133', '/Service/instruction/list.jsp', '说明书'); return false;"href="">说明书</a></li>
      	</ul>
      	<h3 class="am-icon-th-large"><em></em> <a href="#">内部厂商</a></h3>
      	<ul>
	        <li><a onclick="addTab('141', '/Service/innerManu/lableSupplier.jsp', '标签供应商'); return false;" href="">标签供应商</a></li>
	        <li><a onclick="addTab('142', '/Service/innerManu/videoSupplier.jsp', '视频供应商'); return false;" href="">视频供应商</a></li>
      	</ul>
      	<h3 class="am-icon-file-o"><em></em> <a href="#">外部厂商</a></h3>
      	<ul>
      		<li><a onclick="addTab('151', '/Service/outManu/manufacturers.jsp', '产品制造商'); return false;" href="">产品制造商</a></li>
      		<li><a onclick="addTab('152', '/Service/outManu/servicesproviders.jsp', '服务提供商'); return false;" href="">服务提供商</a></li>
      		<li><a onclick="addTab('153', '/Service/outManu/manuDetail.jsp', '厂商详情'); return false;" href="">产品制造商--厂商详情</a></li>
      		<li><a onclick="addTab('154', '/Service/outManu/maintainFacilitator.jsp', '维修服务商'); return false;" href="">维修服务商</a></li>
      		<li><a onclick="addTab('155', '/Service/outManu/secondFacilitator.jsp', '二手服务商'); return false;" href="">二手服务商</a></li>
	        <li><a onclick="addTab('156', '/Service/outManu/displaceFacilitator.jsp', '置换服务商'); return false;" href="">置换服务商</a></li>
	        <li><a onclick="addTab('157', '/Service/outManu/recycleFacilitator.jsp', '回收服务商'); return false;" href="">回收服务商</a></li>
      	</ul>
      	<h3 class="am-icon-external-link"><em></em> <a href="#">外部产品</a></h3>
      	<ul>
	        <li><a onclick="addTab('161', '/Service/outProduct/productModel.jsp', '型号'); return false;" href="">型号 </a></li>
	        <li><a  href="" id="product">产品</a></li>
	        <!-- onclick="addTab('162', '/Service/outProduct/productList.jsp', '产品'); return false;" -->
      	</ul>
      	<h3 class="am-icon-sign-in"><em></em> <a href="#">外部服务</a></h3>
      	<ul>
	        <li><a onclick="addTab('171', '/Service/outServices/serviceList.jsp', '服务'); return false;" href="">服务 </a></li>
      	</ul>
      	<h3 class="am-icon-play-circle-o"><em></em> <a href="#">视频</a></h3>
      	<ul>
      		<li><a onclick="addTab('181', '/Service/video/list.jsp', '视频'); return false;" href="">视频</a></li>
      	</ul>
      	<h3 class="am-icon-camera"><em></em> <a href="#">图片</a></h3>
      	<ul>
      		<li><a onclick="addTab('191', '/Service/picture/list.jsp', '图片'); return false;" href="">图片</a></li>
      	</ul>
      	<h3 class="am-icon-folder"><em></em> <a href="#">知识库</a></h3>
      	<ul>
      		<li><a onclick="addTab('201', '/Service/repository/list.jsp', '知识库'); return false;" href="">知识库</a></li>
			<li><a onclick="addTab('202', '/Service/repository/manufactureTotalList.jsp', '厂商总表'); return false;" href="">厂商总表</a></li>
      		<li><a onclick="addTab('203', '/Service/repository/detail.jsp', '明细'); return false;" href="">明细</a></li>
      	</ul>
      	<h3 class="am-icon-book"><em></em> <a href="#">合同</a></h3>
      	<ul>
      		<li><a onclick="addTab('211', '/Service/contract/template/list.jsp', '模板'); return false;" href="">模板</a></li>
      		<li><a onclick="addTab('212', '/Service/contract/contract/list.jsp', '合同'); return false;" href="">合同</a></li>
      	</ul>
      	<h3 class="am-icon-shopping-cart"><em></em> <a href="#">订单</a></h3>
      	<ul>
      		<li><a onclick="addTab('221', '/Service/order/tag/list.jsp', '标签'); return false;" href="">标签</a></li>
      		<li><a onclick="addTab('222', '/Service/order/video/list.jsp', '视频'); return false;" href="">视频</a></li>
      	</ul>
      	<h3 class="am-icon-volume-up"><em></em> <a>信息推广</a></h3>
      	<ul>
      		<li><a onclick="addTab('231', '/Service/information/informationList.jsp', '信息推广'); return false;" href="">信息推广</a></li>
      	</ul>
      	<h3 class="am-icon-bold"><em></em> <a href="#">统计</a></h3>
      	<ul>
      		<li><a onclick="addTab('241', '/Service/statistical/instructionsList.jsp', '说明书'); return false;" href="">说明书</a></li>
		    <li><a onclick="addTab('242', '/Service/statistical/user/userTotalList.jsp', '用户总量'); return false;" href="">用户总量</a></li>
		    <li><a onclick="addTab('243', '/Service/statistical/user/accessList.jsp', '访问统计'); return false;" href="">访问统计</a></li>
		    <li><a onclick="addTab('244', '/Service/statistical/user/activeFeedList.jsp', '活动反馈'); return false;" href="">活动反馈</a></li>
	      	<li><a onclick="addTab('245', '/Service/statistical/user/searchRankingList.jsp', '搜索统计'); return false;" href="">搜索统计</a></li>
	        
	        <li><a onclick="addTab('246', '/Service/statistical/internalManuFacturerList.jsp', '内部厂商'); return false;" href="">内部厂商</a></li>
	        <li><a onclick="addTab('247', '/Service/statistical/externalManuFacturerList.jsp', '外部厂商'); return false;" href="">外部厂商</a></li>
	        <li><a onclick="addTab('248', '/Service/statistical/labelList.jsp', '标签统计'); return false;" href="">标签统计</a></li>
	        <li><a onclick="addTab('249', '/Service/statistical/videoList.jsp', '视频统计'); return false;" href="">视频统计</a></li>
	        <li><a onclick="addTab('250', '/Service/statistical/pictureList.jsp', '图片统计'); return false;" href="">图片统计</a></li>
	        <li><a onclick="addTab('251', '/Service/statistical/contractList.jsp', '合同统计'); return false;" href="">合同统计</a></li>
	        <li><a onclick="addTab('252', '/Service/statistical/informationExtendList.jsp', '信息推广'); return false;" href="">信息推广</a></li>
	        <li><a onclick="addTab('253', '/Service/statistical/customerServiceList.jsp', '客服工单'); return false;" href="">客服工单</a></li>
	        <li><a onclick="addTab('254', '/Service/statistical/externalServiceList.jsp', '外部服务工单'); return false;" href="">外部服务工单</a></li>
      	</ul>
    </div>
</div>