<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --信息推广">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 推广信息总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-infototal"></div>
				
				<!-- 按月推广信息增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-infomonth"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 推广信息总量：
	var echartsInfototal = echarts.init(document.getElementById("tpl-echarts-infototal"));
	optionInfototal = {
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
	        left: "30%",
	        data: ["微信公众号","移动应用","被动页面"]
	    },
	    series : [
	        {
	            name: "推广信息总量：879",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:335, name:"微信公众号"},
	                {value:310, name:"移动应用"},
	                {value:234, name:"被动页面"}
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
	echartsInfototal.setOption(optionInfototal);
	
	// 按月推广信息增量：
	var echartsInfoMonth = echarts.init(document.getElementById("tpl-echarts-infomonth"));
    optionInfoMonth = {
    	title:{
			text:"按月推广信息增量："
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
            data: ["推广信息总量", "推广信息总量增量", "微信公众号", "微信公众号增量", 
            	   "移动应用", "移动应用增量", "被动页面", "被动页面增量"],
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
                name: "推广信息总量",
                type: "bar",
                data: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
                
            },
            {
                name: "微信公众号",
                type: "bar",
                data: [6, 12, 18, 25, 30, 35, 37, 40, 40, 45, 45, 50]
            },
            {
                name: "移动应用",
                type: "bar",
                data: [3, 6, 10, 12, 20, 20, 20, 25, 25, 30, 35, 40]
            },
            {
                name: "被动页面",
                type: "bar",
                data: [2, 4, 5, 8, 15, 10, 15, 15, 20, 20, 20, 20]
            },
            {
                name: "推广信息总量增量",
                type: "line",
                yAxisIndex: 1,
                data: [15, 20, 22, 10, 12, 15, 20, 15, 20, 18, 15, 12]
            },
            {
                name: "微信公众号增量",
                type: "line",
                yAxisIndex: 1,
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
                
            },
            {
                name: "移动应用增量",
                type: "line",
                yAxisIndex: 1,
                data: [10, 15, 10, 6, 6, 10, 10, 10, 12, 16, 8, 6]
                
            },
            {
                name: "被动页面增量",
                type: "line",
                yAxisIndex: 1,
                data: [3, 4, 4, 6, 2, 3, 4, 2, 5, 6, 5, 2]
                
            }
        ]
    };
    echartsInfoMonth.setOption(optionInfoMonth);
	
</script>
</html>