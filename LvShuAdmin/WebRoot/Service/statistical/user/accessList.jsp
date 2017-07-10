<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --访问">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 访问总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-acctotal"></div>
				
				<!-- 用户活跃度： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-degree"></div>
				
				<!-- 沉默用户量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-silent"></div>
				
				<!-- 按月用户增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-month"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 访问总量：
	var echartsAcctotal = echarts.init(document.getElementById("tpl-echarts-acctotal"));
	optionAcctotal = {
			title:{
				text:"访问总量："
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
                data: ["访问总量"]
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
                data: ["访问总量", "移动页面访问", "PC页面访问", "移动应用访问", "公众号访问"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "访问总量",
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
	echartsAcctotal.setOption(optionAcctotal);	

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
                name: "次数",
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
            }
            ,
            {
                name: "5天以上",
                type: "bar",
                data: [5, 5, 6, 6, 3, 3, 4, 6, 6, 6, 5, 4]
            }
            ,
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
     
    // 沉默用户量：
	var echartsSilent = echarts.init(document.getElementById("tpl-echarts-silent"));
	optionSilent = {
	    title : {
	        text: "沉默用户量：",
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
                magicType: { show: true, type: ["line", "bar"] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
	    legend: {
	        orient: "vertical",
	        left: "25%",
	        data: ["1个月沉默","2个月沉默","3个月沉默","6个月沉默"]
	    },
	    series : [
	        {
	            name: "沉默用户量",
	            type: "pie",
	            radius : "55%",
	            center: ["60%", "60%"], // 环形图在整个DIV中间位置
	            data:[
	                {value:335, name:"1个月沉默"},
	                {value:310, name:"2个月沉默"},
	                {value:234, name:"3个月沉默"},
	                {value:1548, name:"6个月沉默"}
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
	echartsSilent.setOption(optionSilent);
	
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