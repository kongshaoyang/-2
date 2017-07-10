<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --客服工单">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 客服工单总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-customertotal"></div>
				
				<!-- 按月工单增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-cusmonth"></div>
				
				<!-- 个人思路：首页有个月份列表数据，点击月份然后查看该月报表 -->
				<!-- 表格数据：用户工单处理量： -->
				<div class="admin-biaoge tpl-chart-mb tpl-chart-box tpl-table-wz">
				<div class="tpl-chart-tips">用户工单处理量：</div>
					<table class="am-table tpl-chart-table">
				        <thead>
				          <tr>
				            <th>年月</th>
				            <th>客服姓名</th>
				            <th>工单总量</th>
				            <th>合同</th>
				            <th>说明书更新</th>
				            <th>外部数据审核</th>
				            <th>纠错</th>
				            <th>投诉</th>
				            <th>建议</th>
				            <th>心得体验</th>
				            <th>纸质说明书申请</th>
				            <th>在线客服</th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <td>
					            <a href="javascript:showUserService();" class="am-icon-search"> 2016年5月</a>
				            </td>
				            <td>张珊</td>
				            <td>50</td>
				            <td>30</td>
				            <td>34</td>
				            <td>45</td>
				            <td>26</td>
				            <td>20</td>
				            <td>20</td>
				            <td>15</td>
				            <td>55</td>
				            <td>16</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showUserService();" class="am-icon-search"> 2016年6月</a>
				            </td>
				            <td>李斯</td>
				            <td>60</td>
				            <td>25</td>
				            <td>20</td>
				            <td>34</td>
				            <td>45</td>
				            <td>26</td>
				            <td>20</td>
				            <td>15</td>
				            <td>55</td>
				            <td>16</td>
				          </tr>
				          <tr>
				            <td>
					           <a href="javascript:showUserService();" class="am-icon-search"> 2016年7月</a>
				            </td>
				            <td>王武</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				            <td>34</td>
				            <td>45</td>
				            <td>26</td>
				            <td>15</td>
				            <td>55</td>
				            <td>16</td>
				          </tr>
				          <tr>
				            <td>
					           <a href="javascript:showUserService();" class="am-icon-search"> 2016年8月</a>
				            </td>
				            <td>赵柳</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				            <td>15</td>
				            <td>34</td>
				            <td>45</td>
				            <td>26</td>
				            <td>55</td>
				            <td>16</td>
				          </tr>
				          <tr>
				            <td>
					        	<a href="javascript:showUserService();" class="am-icon-search"> 合计合并</a>
				            </td>
				            <td>合计合并</td>
				            <td>180</td>
				            <td>90</td>
				            <td>60</td>
				            <td>90</td>
				            <td>90</td>
				            <td>50</td>
				            <td>90</td>
				            <td>90</td>
				            <td>50</td>
				            <td>60</td>
				          </tr>
				        </tbody>
			      	</table>
	     		</div>
			</div>
			<%@include file="/System/foot.jsp" %>
		</div>
	
		<!-- 弹出框显示的报表不需要加虚阴影背景CSS：tpl-chart-box -->
		<!-- 用户工单处理量： -->
		<div class="am-modal am-modal-no-btn" id="userservice_popup">
			<div class="am-modal-dialog" style="width:65%; height:500px;overflow: auto;">
				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-userservice"></div> 
			</div>	
		</div>
	</div>	
</body>

<script type="text/javascript">

	// 推广信息总量：
	var echartsCustomerTotal = echarts.init(document.getElementById("tpl-echarts-customertotal"));
	optionCustomerTotal = {
	    title : {
	        text: "推广信息总量：",
	        x:"left"
	    },
	    tooltip : {
	        trigger: "item",
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    toolbox: {
            top: "0",
            feature: {
                dataView: { show: true, readOnly: false },
                magicType: { show: false, type: ["line", "bar"] },
                restore: { show: false },
                saveAsImage: { show: true }
            }
        },
	    legend: {
	        orient: "vertical",
	        left: "20%",
	        data: ["合同","说明书更新","外部数据审核","纠错","投诉","建议","心得体验","纸质说明书申请","在线客服"]
	    },
	    series : [
	        {
	            name: "工单总量：900",
	            type: "pie",
	            radius : "55%",
	            center: ["60%", "60%"],// 圆形图在整个DIV中间位置
	            data:[
	                {value:100, name:"合同"},
	                {value:100, name:"说明书更新"},
	                {value:100, name:"外部数据审核"},
	                {value:100, name:"纠错"},
	                {value:100, name:"投诉"},
	                {value:100, name:"建议"},
	                {value:100, name:"心得体验"},
	                {value:100, name:"纸质说明书申请"},
	                {value:100, name:"在线客服"}
	            ],
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: "rgba(0, 0, 0, 0.5)"
	                }
	            }
	        }
	    ]
	};
	echartsCustomerTotal.setOption(optionCustomerTotal);
	 
	// 按月工单增量：
	var echartsCusMonth = echarts.init(document.getElementById("tpl-echarts-cusmonth"));
    optionCusMonth = {
    	title:{
			text:"按月工单增量："
		},
        tooltip: {
            trigger: "axis"
        },
        toolbox: {
            top: "0",
            feature: {
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ["line", "bar"] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        legend: {
            data: ["工单总量", "工单总量增量", "合同", "合同增量", 
            	   "说明书更新", "说明书更新增量", "外部数据审核", "外部数据审核增量",
            	   "纠错", "纠错增量", "投诉", "投诉增量",
            	   "建议", "建议增量", "心得体验", "心得体验增量",
            	   "纸质说明书申请", "纸质说明书申请增量", "在线客服", "在线客服增量"],
            left: "15%",
            right: "15%"
        },
        grid: {
            left: "5%",// 整个表格在左右两边距离
            right: "5%",
            bottom: "5%",
            top: "30%", // 整个报表表格在距离legend距离
            containLabel: true
        },
        xAxis: [{
            type: "category",
            data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
        }],
        yAxis: [{
                type: "value",
                name: "数量",
                min: 0,
                max: 100,
                interval: 20,
                axisLabel: {
                    formatter: "{value}"
                }
            },
            {
                type: "value",
                name: "增量",
                min: 0,
                max: 30,
                interval: 6,
                
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "工单总量",
                type: "bar",
                data: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
                
            },
            {
                name: "合同",
                type: "bar",
                data: [6, 11, 16, 21, 26, 31, 36, 41, 46, 51, 56, 61]
            },
            {
                name: "说明书更新",
                type: "bar",
                data: [7, 12, 17, 22, 27, 32, 37, 42, 47, 52, 57, 62]
            },
            {
                name: "外部数据审核",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "纠错",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "投诉",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "建议",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "心得体验",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "纸质说明书申请",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "在线客服",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "工单总量增量",
                type: "line",
                yAxisIndex: 1,
                data: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]
            },
            {
                name: "合同增量",
                type: "line",
                yAxisIndex: 1,
                data: [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26]
                
            },
            {
                name: "说明书更新增量",
                type: "line",
                yAxisIndex: 1,
                data: [6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28]
                
            },
            {
                name: "外部数据审核增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "纠错增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "投诉增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "建议增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "心得体验增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "纸质说明书申请增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "在线客服增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            }
        ]
    };
    echartsCusMonth.setOption(optionCusMonth);
	
	// 查看用户工单处理量数据
	function showUserService()
	{
		// 打开用户工单处理量窗口
    	$("#userservice_popup").modal("open");
    	
    	// 用户工单处理量：
		var echartsUserService = echarts.init(document.getElementById("tpl-echarts-userservice"));
		optionUserService = {
				title:{
					text:"【2016年10月】工单处理量："
				},
				tooltip: {
	                trigger: ""
	            },
	            toolbox: {
		            top: "0",
		            feature: {
		                dataView: { show: true, readOnly: false },
		                magicType: { show: true, type: ["line", "bar"] },
		                restore: { show: true },
		                saveAsImage: { show: true }
		            }
		        },
				legend: {
	                data: ["工单总量", "合同", "说明书更新", "外部数据审核", 
	                	   "纠错", "投诉", "建议", "心得体验", "纸质说明书申请", "在线客服"],
	               	left: "33%",// 整个legend在左右两边距离
	                right: "15%"
	            },
				grid: {
	                left: "10%",// 整个表格在左右两边距离
	                right: "10%",
	                bottom: "5%",
	                top: "20%", // 整个报表表格在距离legend距离
	                containLabel: true
	            },
				xAxis: [{
	                type: "category",
	                boundaryGap: true,
	                data: ["张珊", "李斯", "王武", "赵柳", "天琪"]
	            }],
				yAxis: [{
	                type: ""
	            }],
				series: [{
	                    name: "工单总量",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [120, 40, 40, 30, 10]
	                },
	                {
	                    name: "合同",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [100, 20, 30, 20, 30]
	                },
	                {
	                    name: "说明书更新",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [95, 25, 30, 25, 35]
	                },
	                {
	                    name: "外部数据审核",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [90, 30, 35, 30, 40]
	                },
	                {
	                    name: "纠错",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [85, 35, 40, 35, 45]
	                },
	                {
	                    name: "投诉",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [80, 40, 45, 40, 50]
	                },
	                {
	                    name: "建议",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [75, 45, 50, 45, 55]
	                },
	                {
	                    name: "心得体验",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [70, 50, 55, 50, 60]
	                },
	                {
	                    name: "纸质说明书申请",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [65, 55, 60, 55, 65]
	                },
	                {
	                    name: "在线客服",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [60, 60, 65, 60, 70]
	                }
	            ]
		};
		echartsUserService.setOption(optionUserService);
	}
</script>
</html>