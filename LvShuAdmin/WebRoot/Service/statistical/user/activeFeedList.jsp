<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --活动反馈">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 互动反馈总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-active"></div>
				
				<!-- 用户活跃度： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-degree"></div>
				
				<!-- 按月互动反馈增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-month"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 互动反馈总量：
	var echartsActive = echarts.init(document.getElementById("tpl-echarts-active"));
	optionActive = {
	    title : {
	        text: "互动反馈总量："
	        //x: "center" // 文字居中
	    },
	    tooltip : {
	        trigger: "item",
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
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
	        orient: "vertical", // data竖着排列
	        left: "20%", // 靠左百分比
	        data: ["评论","建议与反馈","纠错","投诉","新的体验"]
	    },
	    series : [
	        {
	            name: "互动反馈总量：1204",
	            type: "pie", // pie圆形图 ；bar 柱状图 ；line 折线图
	            radius : "55%", // 圆形图大小
	            center: ["50%", "60%"],
	            data:[
	                {value:335, name:"评论"},
	                {value:310, name:"建议与反馈"},
	                {value:234, name:"纠错"},
	                {value:145, name:"投诉"},
	                {value:180, name:"新的体验"}
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
	echartsActive.setOption(optionActive);	
	
	// 用户活跃度：
	var echartsDegree = echarts.init(document.getElementById("tpl-echarts-degree"));
	optionDegree = {
    	title:{
			text:"用户活跃度："
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
            data: ["20天以上", "10天以上", "5天以上", "3天以上", "1天以上"]
        },
        grid: {
            left: "5%",// 整个表格在左右两边距离
            right: "5%",
            bottom: "5%",
            top: "20%", // 整个报表表格在距离legend距离
            containLabel: true
        },
        xAxis: [{
            type: "category",
            data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
        }],
        yAxis: [{
                type: "value",
                name: "互动反馈次数",
                min: 0,
                max: 30,
                interval: 5,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "20天以上",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 25, 30, 18, 15, 12]
            },
            {
                name: "10天以上",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "5天以上",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            },
            {
                name: "3天以上",
                type: "bar",
                data: [3, 4, 4, 6, 2, 3, 4, 2, 5, 6, 5, 2]
            },
            {
                name: "1天以上",
                type: "bar",
                data: [3, 5, 2, 2, 2, 2, 3, 1, 3, 5, 2, 2]
            }
        ]
    };
    echartsDegree.setOption(optionDegree);
	
	// 按月互动反馈增量：
	var echartsMonth = echarts.init(document.getElementById("tpl-echarts-month"));
    optionMonth = {
    	title:{
			text:"按月互动反馈增量："
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
            data: ["评论", "建议与反馈", "纠错", "投诉", "心得体验",
            	   "评论增量", "建议与反馈增量", "纠错增量", "投诉增量", "心得体验增量"],
            left: "20%",
            right: "20%"	   
        },
        grid: {
            left: "5%",// 整个表格在左右两边距离
            right: "5%",
            bottom: "5%",
            top: "20%", // 整个报表表格在距离legend距离
            containLabel: true
        },
        xAxis: [{
            type: "category",
            data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
        }],
        yAxis: [{
                type: "value",
                name: "反馈数量",
                min: 0,
                max: 50,
                interval: 10,
                axisLabel: {
                    formatter: "{value}"
                }
            },
            {
                type: "value",
                name: "增量",
                min: 0,
                max: 5,
                interval: 1,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "评论",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 25, 30, 18, 15, 12]
            },
            {
                name: "建议与反馈",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "纠错",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            },
            {
                name: "投诉",
                type: "bar",
                data: [3, 4, 4, 6, 2, 3, 4, 2, 5, 6, 5, 2]
            },
            {
                name: "心得体验",
                type: "bar",
                data: [3, 5, 2, 2, 2, 2, 3, 1, 3, 5, 2, 2]
            },
            {
                name: "评论增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.0, 1.2, 1.3, 2.5, 1.3, 2.2, 3.3, 3.4, 3.0, 1.5, 1.0, 1.2]
            },
            {
                name: "建议与反馈增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.2, 1.4, 1.5, 2.7, 1.5, 2.4, 3.5, 3.6, 3.2, 1.7, 1.2, 1.4]
            },
            {
                name: "纠错增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.4, 1.6, 1.7, 2.9, 1.7, 2.6, 3.7, 3.8, 3.4, 1.9, 1.4, 1.6]
            },
            {
                name: "投诉增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.6, 1.8, 1.9, 3.1, 1.9, 2.8, 3.9, 4.0, 3.6, 2.1, 1.6, 1.8]
            },
            {
                name: "心得体验增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.8, 2.0, 2.1, 3.3, 2.1, 3.0, 4.1, 4.2, 3.8, 2.3, 1.8, 2.0]
            }
        ]
    };
    echartsMonth.setOption(optionMonth);
	
</script>
</html>