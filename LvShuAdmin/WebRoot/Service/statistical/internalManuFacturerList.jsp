<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --内部厂商">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 厂商总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-manuFacturer"></div>
				
				<!-- 产品、服务按月增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-month"></div>
				
				<!-- 标签订单排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-label"></div>
				
				<!-- 视频订单排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-video"></div>
				
				<!-- 按月增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-mfmonth"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 厂商总量：
	var echartsManuFacturer = echarts.init(document.getElementById("tpl-echarts-manuFacturer"));
	optionManuFacturer = {
			title:{
				text:"厂商总量："
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
                data: ["厂商总量"]
            },
			grid: {
                left: "30%",
                right: "30%",
                bottom: "5%",
                containLabel: true
            },
			xAxis: [{
                type: "category",
                boundaryGap: true,
                data: ["厂商总量", "生产制造商", "服务提供商", "标签厂商", "视频厂商"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "厂商总量",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [220, 60, 70, 50, 40],
                    itemStyle: {
                        normal: {
                            color: "#e7505a"
                        },
                        emphasis: {

                        }
                    }
                }
            ]
	};
	echartsManuFacturer.setOption(optionManuFacturer);
    
    // 产品、服务按月增量：
	var echartsMonth = echarts.init(document.getElementById("tpl-echarts-month"));
    optionMonth = {
    	title:{
			text:"产品、服务按月增量："
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
            data: ["产品数", "服务数", "产品增量", "服务增量"]
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
                name: "产品数",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "服务数",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            },
            {
                name: "产品增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.2, 1.0, 1.1, 1.5, 1.1, 2.1, 2.1, 2.3, 2.5, 1.2, 0.8, 1.5]
            },
            {
                name: "服务增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.0, 1.2, 1.3, 2.5, 1.3, 2.2, 3.3, 3.4, 3.0, 1.5, 1.0, 1.2]
            }
        ]
    };
    echartsMonth.setOption(optionMonth);
    
    // 标签订单排名：
	var echartsLabel = echarts.init(document.getElementById("tpl-echarts-label"));
    optionLabel = {
    	title:{
			text:"标签订单排名："
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
            data: ["标签数", "交易金额", "月平均"]
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
            data: ["广电", "长城", "日立", "怡化"]
        }],
        yAxis: [{
                type: "value",
                name: "数量",
                min: 0,
                max: 20,
                interval: 5,
                axisLabel: {
                    formatter: "{value}"
                }
            },
            {
                type: "value",
                name: "金额",
                min: 0,
                max: 2,
                interval: 0.5,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "标签数",
                type: "bar",
                data: [4, 6, 8, 8]
            },
            {
                name: "交易金额",
                type: "bar",
                data: [5, 5, 6, 6]
            },
            {
                name: "月平均",
                type: "line",
                yAxisIndex: 1,
                data: [1.2, 1.0, 1.1, 1.5]
            }
        ]
    };
    echartsLabel.setOption(optionLabel);
    
    // 视频订单排名：
	var echartsVideo = echarts.init(document.getElementById("tpl-echarts-video"));
    optionVideo = {
    	title:{
			text:"视频订单排名："
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
            data: ["视频数", "交易金额", "月平均"]
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
            data: ["广电", "长城", "日立", "怡化"]
        }],
        yAxis: [{
                type: "value",
                name: "数量",
                min: 0,
                max: 20,
                interval: 5,
                axisLabel: {
                    formatter: "{value}"
                }
            },
            {
                type: "value",
                name: "金额",
                min: 0,
                max: 2,
                interval: 0.5,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "视频数",
                type: "bar",
                data: [4, 6, 8, 8]
            },
            {
                name: "交易金额",
                type: "bar",
                data: [5, 5, 6, 6]
            },
            {
                name: "月平均",
                type: "line",
                yAxisIndex: 1,
                data: [1.2, 1.0, 1.1, 1.5]
            }
        ]
    };
    echartsVideo.setOption(optionVideo);
    
    // 按月增量：
	var echartsMfMonth = echarts.init(document.getElementById("tpl-echarts-mfmonth"));
    optionMfMonth = {
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
            data: ["标签厂商", "视频厂商", "标签厂商增量", "视频厂商增量"]
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
                name: "标签厂商",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "视频厂商",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            },
            {
                name: "标签厂商增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.2, 1.0, 1.1, 1.5, 1.1, 2.1, 2.1, 2.3, 2.5, 1.2, 0.8, 1.5]
            },
            {
                name: "视频厂商增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.0, 1.2, 1.3, 2.5, 1.3, 2.2, 3.3, 3.4, 3.0, 1.5, 1.0, 1.2]
            }
        ]
    };
    echartsMfMonth.setOption(optionMfMonth);
	
</script>
</html>