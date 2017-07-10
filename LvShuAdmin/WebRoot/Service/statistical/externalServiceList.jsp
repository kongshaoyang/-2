<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --外部服务工单">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 客服工单总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-cstotal"></div>
				
				<!-- 按月工单增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-csmonth"></div>
				
				<!-- 个人思路：首页有个月份列表数据，点击月份然后查看该月报表 -->
				<!-- 表格数据：服务商工单处理量： -->
				<div class="admin-biaoge tpl-chart-mb tpl-chart-box tpl-table-wz">
				<div class="tpl-chart-tips">服务商工单处理量：</div>
					<table class="am-table tpl-chart-table">
				        <thead>
				          <tr>
				            <th>年月</th>
				            <th>服务商名称</th>
				            <th>工单总量</th>
				            <th>维修</th>
				            <th>二手</th>
				            <th>置换</th>
				            <th>回收</th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <td>
					            <a href="javascript:showFaciliTator();" class="am-icon-search"> 2016年5月</a>
				            </td>
				            <td>服务商一</td>
				            <td>50</td>
				            <td>30</td>
				            <td>20</td>
				            <td>20</td>
				            <td>15</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showFaciliTator();" class="am-icon-search"> 2016年6月</a>
				            </td>
				            <td>服务商二</td>
				            <td>60</td>
				            <td>25</td>
				            <td>20</td>
				            <td>20</td>
				            <td>15</td>
				          </tr>
				          <tr>
				            <td>
				            	<a href="javascript:showFaciliTator();" class="am-icon-search"> 2016年7月</a>
				            </td>
				            <td>服务商三</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				            <td>15</td>
				          </tr>
				          <tr>
				            <td>
				            	<a href="javascript:showFaciliTator();" class="am-icon-search"> 2016年8月</a>
				            </td>
				            <td>服务商四</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				            <td>15</td>
				          </tr>
				          <tr>
				            <td>
				            	<a href="javascript:showFaciliTator();" class="am-icon-search"> 合计合并</a>
				            </td>
				            <td>合计合并</td>
				            <td>180</td>
				            <td>90</td>
				            <td>60</td>
				            <td>90</td>
				            <td>90</td>
				          </tr>
				        </tbody>
			      	</table>
	     		</div>
			</div>
			<%@include file="/System/foot.jsp" %>
		</div>
		
		<!-- 弹出框显示的报表不需要加虚阴影背景CSS：tpl-chart-box -->
		
		<!-- 服务商工单处理量： -->
		<div class="am-modal am-modal-no-btn" id="facilitator_popup">
			<div class="am-modal-dialog" style="width:65%; height:500px;overflow: auto;">
				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-facilitator"></div> 
			</div>	
		</div>
	</div>
</body>

<script type="text/javascript">

	// 客服工单总量：
	var echartsCstotal = echarts.init(document.getElementById("tpl-echarts-cstotal"));
	optionCstotal = {
	    title : {
	        text: "客服工单总量：",
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
	        data: ["维修工单","二手工单","置换工单","回收工单"]
	    },
	    series : [
	        {
	            name: "工单总量：700",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:100, name:"维修工单"},
	                {value:150, name:"二手工单"},
	                {value:200, name:"置换工单"},
	                {value:250, name:"回收工单"}
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
	echartsCstotal.setOption(optionCstotal);

	// 按月工单增量：
	var echartsCsmonth = echarts.init(document.getElementById("tpl-echarts-csmonth"));
    optionCsmonth = {
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
            data: ["工单总量", "工单总量增量", "维修", "维修增量", 
            	   "二手", "二手增量", "置换", "置换增量",
            	   "回收", "回收增量"],
            left: "26%",
            right: "26%"
        },
        grid: {
            left: "5%",// 整个表格在左右两边距离
            right: "5%",
            bottom: "5%",
            top: "25%", // 整个报表表格在距离legend距离
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
                max: 40,
                interval: 8,
                
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
                name: "维修",
                type: "bar",
                data: [6, 11, 16, 21, 26, 31, 36, 41, 46, 51, 56, 61]
            },
            {
                name: "二手",
                type: "bar",
                data: [7, 12, 17, 22, 27, 32, 37, 42, 47, 52, 57, 62]
            },
            {
                name: "置换",
                type: "bar",
                data: [8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63]
            },
            {
                name: "回收",
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
                name: "维修增量",
                type: "line",
                yAxisIndex: 1,
                data: [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26]
                
            },
            {
                name: "二手增量",
                type: "line",
                yAxisIndex: 1,
                data: [6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28]
                
            },
            {
                name: "置换增量",
                type: "line",
                yAxisIndex: 1,
                data: [8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
                
            },
            {
                name: "回收增量",
                type: "line",
                yAxisIndex: 1,
                data: [9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]
                
            }
        ]
    };
    echartsCsmonth.setOption(optionCsmonth);
	
	// 查看服务商工单处理量数据
	function showFaciliTator()
	{
		// 打开视频效率窗口
    	$("#facilitator_popup").modal("open");
    	
		// 服务商工单处理量：
		var echartsFacilitator = echarts.init(document.getElementById("tpl-echarts-facilitator"));
		optionFacilitator = {
				title:{
					text:"【2016年6月】服务商工单处理量："
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
	                data: ["工单总量", "维修", "二手", "置换", "回收"],
	                left: "40%",
	                right: "20%"
	            },
				grid: {
	                left: "10%",
	                right: "10%",
	                bottom: "5%",
	                containLabel: true
	            },
				xAxis: [{
	                type: "category",
	                boundaryGap: true,
	                data: ["服务商一", "服务商二", "服务商三", "服务商四", "服务商五"]
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
	                    name: "维修",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [100, 20, 30, 20, 30]
	                },
	                {
	                    name: "二手",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [95, 25, 30, 25, 35]
	                },
	                {
	                    name: "置换",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [90, 30, 35, 30, 40]
	                },
	                {
	                    name: "回收",
	                    type: "bar",
	                    stack: "",
	                    areaStyle: { normal: {} },
	                    data: [85, 35, 40, 35, 45]
	                }
	            ]
		};
		echartsFacilitator.setOption(optionFacilitator);
	}
	
</script>
</html>