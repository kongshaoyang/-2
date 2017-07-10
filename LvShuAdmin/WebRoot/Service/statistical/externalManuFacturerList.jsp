<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --外部厂商">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 厂商总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-mftotal"></div>
				
				<!-- 维修工单排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-repair"></div>
				
				<!-- 二手工单排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-second"></div>
				
				<!-- 置换工单排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-subs"></div>
				
				<!-- 回收工单排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-recovery"></div>
				
				<!-- 按月增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-month"></div>
			</div>
		
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 厂商总量：
	var echartsMftotal = echarts.init(document.getElementById("tpl-echarts-mftotal"));
	optionMftotal = {
	    title : {
	        text: "厂商总量：",
	        x:"left" // 文字位置
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
	        left: "25%",
	        data: ["维修厂商","二手厂商","置换厂商","回收厂商"]
	    },
	    series : [
	        {
	            name: "厂商总量：2427",
	            type: "pie",
	            radius : "60%",			// 圆形图大小
	            center: ["60%", "55%"],	// 圆形图在整个DIV中间位置
	            data:[
	                {value:1548, name:"维修厂商"},
	                {value:310, name:"二手厂商"},
	                {value:234, name:"置换厂商"},
	                {value:335, name:"回收厂商"}
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
	echartsMftotal.setOption(optionMftotal);	

	// 维修工单排名：
	var echartsRepair = echarts.init(document.getElementById("tpl-echarts-repair"));
	optionRepair = {
    	title:{
			text:"维修工单排名："
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
            data: ["维修工单数", "月平均"]
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
            data: ["行业:金融业    厂商:广电", "行业:制造业    厂商:长城", "行业:工业    厂商:日立", "行业:农业    厂商:怡化"]
        }],
        yAxis: [{
                type: "value",
                name: "维修数",
                min: 0,
                max: 400,
                interval: 100,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "维修工单数",
                type: "bar",
                data: [180, 340, 330, 220]
            },
            {
                name: "月平均",
                type: "bar",
                data: [14, 16, 20, 10]
            }
        ]
    };
    echartsRepair.setOption(optionRepair);
    
    // 二手工单排名：
	var echartsSecond = echarts.init(document.getElementById("tpl-echarts-second"));
	optionSecond = {
    	title:{
			text:"二手工单排名："
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
            data: ["二手工单数", "月平均"]
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
            data: ["行业:金融业    厂商:广电", "行业:制造业    厂商:长城", "行业:工业    厂商:日立", "行业:农业    厂商:怡化"]
        }],
        yAxis: [{
                type: "value",
                name: "维修数",
                min: 0,
                max: 400,
                interval: 100,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "二手工单数",
                type: "bar",
                data: [280, 300, 280, 180]
            },
            {
                name: "月平均",
                type: "bar",
                data: [14, 16, 20, 10]
            }
        ]
    };
    echartsSecond.setOption(optionSecond);
    
    // 置换工单排名：
	var echartsSubs = echarts.init(document.getElementById("tpl-echarts-subs"));
	optionSubs = {
    	title:{
			text:"置换工单排名："
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
            data: ["置换工单数", "月平均"]
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
            data: ["行业:金融业    厂商:广电", "行业:制造业    厂商:长城", "行业:工业    厂商:日立", "行业:农业    厂商:怡化"]
        }],
        yAxis: [{
                type: "value",
                name: "维修数",
                min: 0,
                max: 400,
                interval: 100,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "置换工单数",
                type: "bar",
                data: [220, 320, 160, 220]
            },
            {
                name: "月平均",
                type: "bar",
                data: [14, 16, 20, 10]
            }
        ]
    };
    echartsSubs.setOption(optionSubs);
    
    // 回收工单排名：
	var echartsRecovery = echarts.init(document.getElementById("tpl-echarts-recovery"));
	optionRecovery = {
    	title:{
			text:"回收工单排名："
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
            data: ["回收工单数", "月平均"]
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
            data: ["行业:金融业    厂商:广电", "行业:制造业    厂商:长城", "行业:工业    厂商:日立", "行业:农业    厂商:怡化"]
        }],
        yAxis: [{
                type: "value",
                name: "维修数",
                min: 0,
                max: 400,
                interval: 100,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "回收工单数",
                type: "bar",
                data: [250, 180, 260, 120]
            },
            {
                name: "月平均",
                type: "bar",
                data: [14, 16, 20, 10]
            }
        ]
    };
    echartsRecovery.setOption(optionRecovery);
    
    // 按月增量：
	var echartsMonth = echarts.init(document.getElementById("tpl-echarts-month"));
    optionMonth = {
    	title:{
			text:"按月增量："
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
            data: ["维修厂商", "二手厂商", "置换厂商", "回收厂商", "维修厂商增量", 
            		"二手厂商增量", "置换厂商增量", "回收厂商增量"],
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
                name: "数量",
                min: 0,
                max: 20,
                interval: 4,
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
                name: "维修厂商",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "二手厂商",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            },
            {
                name: "置换厂商",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "回收厂商",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            },
            {
                name: "维修厂商增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.2, 1.0, 1.1, 1.5, 1.1, 2.1, 2.1, 2.3, 2.5, 1.2, 0.8, 1.5]
            },
            {
                name: "二手厂商增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.0, 1.2, 1.3, 2.5, 1.3, 2.2, 3.3, 3.4, 3.0, 1.5, 1.0, 1.2]
            },
            {
                name: "置换厂商增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.1, 1.5, 1.5, 1.8, 1.5, 1.8, 1.8, 2.0, 2.0, 1.6, 1.2, 1.0]
            },
            {
                name: "回收厂商增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.8, 1.6, 1.4, 2.0, 1.5, 2.0, 1.6, 1.5, 1.8, 1.8, 1.1, 1.3]
            }
        ]
    };
    echartsMonth.setOption(optionMonth);
	
</script>
</html>