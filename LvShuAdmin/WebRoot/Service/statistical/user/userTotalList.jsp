<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 -- 总用户量">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 用户总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-usertotal"></div>
				
				<!-- 按地区用户总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-region"></div>
				
				<!-- 按性别用户总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-gender"></div>
				
				<!-- 按年龄用户总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-age"></div>
				
				<!-- 按月用户增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-month"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">
	
	// 用户总量：
	var echartsUsertotal = echarts.init(document.getElementById("tpl-echarts-usertotal"));
	optionUsertotal = {
			title : {
	        text: "用户总量："
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
	        data: ["移动页面用户", "PC页面用户", "移动应用用户", "公众号用户"]
	    },
	    series : [
	        {
	            name: "用户总量：2490",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:480, name:"移动页面用户"},
	                {value:360, name:"PC页面用户"},
	                {value:1500, name:"移动应用用户"},
	                {value:150, name:"公众号用户"}
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
	echartsUsertotal.setOption(optionUsertotal);	

	// 按地区用户总量：
	var echartsRegion = echarts.init(document.getElementById("tpl-echarts-region"));
	optionRegion = {
			title:{
				text:"按地区用户总量："
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
                data: ["总注册用户", "移动页面用户", "PC页面用户", "移动应用用户", "公众号用户"]
            },
            grid: {
                left: "3%",
                right: "4%",
                bottom: "3%",
                containLabel: true
            },
            xAxis: [{
                type: "category",
                boundaryGap: true,
                data: ["上海", "南京", "长沙", "深圳", "广州"]
            }],
            yAxis: [{
                type: "value"
            }],
            series: [{
                    name: "移动页面用户",
                    type: "bar",
                    areaStyle: { normal: {} },
                    data: [110, 50, 150, 140, 160],
                    itemStyle: {
                        normal: {
                            color: "#59aea2"
                        },
                        emphasis: {

                        }
                    }
                },
                {
                    name: "PC页面用户",
                    type: "bar",
                    areaStyle: { normal: {} },
                    data: [100, 130, 150, 30, 20],
                    itemStyle: {
                        normal: {
                            color: "#e7505a"
                        }
                    }
                },
                {
                    name: "移动应用用户",
                    type: "bar",
                    areaStyle: { normal: {} },
                    data: [20, 50, 30, 130, 130],
                    itemStyle: {
                        normal: {
                            color: "#32c5d2"
                        }
                    }
                },
                {
                    name: "总注册用户",
                    type: "bar",
                    areaStyle: { normal: {} },
                    data: [230, 230, 330, 300, 310],
                    itemStyle: {
                        normal: {
                            color: ""
                        }
                    }
                }
            ]
      };
    echartsRegion.setOption(optionRegion);
     
    // 按性别用户总量：
	var echartsGender = echarts.init(document.getElementById("tpl-echarts-gender"));
	optionGender = {
			title:{
				text:"按性别用户总量："
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
                data: ["总注册用户", "移动页面用户", "PC页面用户", "移动应用用户", "公众号用户"]
            },
			grid: {
                left: "25%",
                right: "25%",
                bottom: "5%",
                containLabel: true
            },
			xAxis: [{
                type: "category",
                boundaryGap: true,
                data: ["男", "女"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "总注册用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [120, 150]
                },
                {
                    name: "移动页面用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50, 60]
                },
                {
                    name: "PC页面用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [30, 40]
                },
                {
                    name: "移动应用用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [20, 30]
                },
                {
                    name: "公众号用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [20, 20]
                }
            ]
	};
	echartsGender.setOption(optionGender);
	
	// 按年龄用户总量：
	var echartsAge = echarts.init(document.getElementById("tpl-echarts-age"));
	optionAge = {
			title:{
				text:"按年龄用户总量："
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
                data: ["总注册用户", "移动页面用户", "PC页面用户", "移动应用用户", "公众号用户"]
            },
			grid: {
                left: "25%",
                right: "25%",
                bottom: "5%",
                containLabel: true
            },
			xAxis: [{
                type: "category",
                boundaryGap: true,
                data: ["少年", "青年", "老年"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "总注册用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [230, 125, 95]
                },
                {
                    name: "移动页面用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [80, 30, 25]
                },
                {
                    name: "PC页面用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50, 20, 30]
                },
                {
                    name: "移动应用用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50, 40, 20]
                },
                {
                    name: "公众号用户",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50, 35, 20]
                }
            ]
	};
	echartsAge.setOption(optionAge);
	
	// 按月用户增量：
	var echartsMonth = echarts.init(document.getElementById("tpl-echarts-month"));
    optionMonth = {
    	title:{
			text:"按月用户增量："
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
            data: ["总注册用户", "移动页面用户", "PC页面用户", "移动应用用户", "公众号用户", 
            	   "总注册用户增量", "移动页面用户增量", "PC页面用户增量", "移动应用用户增量", "公众号用户增量"],
            left: "15%",
            right: "15%"
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
                name: "用户数量",
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
                name: "总注册用户",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 25, 30, 18, 15, 12]
            },
            {
                name: "移动页面用户",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            }
            ,
            {
                name: "PC页面用户",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            }
            ,
            {
                name: "移动应用用户",
                type: "bar",
                data: [3, 4, 4, 6, 2, 3, 4, 2, 5, 6, 5, 2]
            },
            {
                name: "公众号用户",
                type: "bar",
                data: [3, 5, 2, 2, 2, 2, 3, 1, 3, 5, 2, 2]
            },
            {
                name: "总注册用户增量",
                type: "line",
                yAxisIndex: 1,
                data: [2.0, 2.2, 2.3, 2.5, 2.3, 2.2, 3.3, 3.4, 3.0, 2.5, 2.0, 2.2]
            },
            {
                name: "移动页面用户增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.8, 2.0, 2.1, 2.3, 2.1, 2.0, 3.1, 3.2, 2.8, 2.3, 1.8, 2.0]
            },
            {
                name: "PC页面用户增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.6, 1.8, 1.9, 2.1, 1.9, 1.8, 2.9, 3.0, 2.6, 2.1, 1.6, 1.8]
            },
            {
                name: "移动应用用户增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.4, 1.6, 1.7, 1.9, 1.7, 1.6, 2.7, 2.8, 2.4, 1.9, 1.4, 1.6]
            },
            {
                name: "公众号用户增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.2, 1.4, 1.5, 1.7, 1.5, 1.4, 2.5, 2.6, 2.2, 1.7, 1.2, 1.4]
            }
        ]
    };
    echartsMonth.setOption(optionMonth);
	
</script>
</html>