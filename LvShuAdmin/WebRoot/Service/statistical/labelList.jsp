<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --标签">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 标签总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-labeltotal"></div>
				
				<!-- 按行业标签总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-industry"></div>
				
				<!-- 按月标签增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-labelmonth"></div>
				
				<!-- 标签有效性： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-labelvalidity"></div>
				
				<!-- 标签效率： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-labeleff"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 标签总量：
	var echartsLabelTotal = echarts.init(document.getElementById("tpl-echarts-labeltotal"));
	optionLabelTotal = {
			title : {
	        text: "标签总量："
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
	        data: ["总标签量"]
	    },
	    series : [
	        {
	            name: "总标签量",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:335, name:"总标签量"}
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
	echartsLabelTotal.setOption(optionLabelTotal);	
	
	// 按行业标签总量：
	var echartsIndustry = echarts.init(document.getElementById("tpl-echarts-industry"));
	optionIndustry = {
	    title : {
	        text: "按行业标签总量："
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
	        data: ["[行业：金融业  子行业：银行  二级子行业：科技部门] 标签数量",
	        	   "[行业：制造业  子行业：华为  二级子行业：报表部门] 说明书数量",
	        	   "[行业：农业  子行业：水稻  二级子行业：杂交] 标签数量"
	        	  ]
	    },
	    series : [
	        {
	            name: "行业标签数量",
	            type: "pie",
	            radius : "45%",
	            center: ["60%", "60%"],
	            data:[
	                {value:335, name:"[行业：金融业  子行业：银行  二级子行业：科技部门] 标签数量"},
	                {value:225, name:"[行业：制造业  子行业：华为  二级子行业：报表部门] 说明书数量"},
	                {value:125, name:"[行业：农业  子行业：水稻  二级子行业：杂交] 标签数量"}
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
	echartsIndustry.setOption(optionIndustry);
 
	// 按月标签增量：
	var echartsLabelmonth = echarts.init(document.getElementById("tpl-echarts-labelmonth"));
    optionLabelmonth = {
    	title:{
			text:"按月标签增量："
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
            data: ["标签发放量", "增量"],
            left: "center"
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
                name: "标签发放量",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 25, 30, 18, 15, 12]
            },
            {
                name: "增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.4, 1.6, 1.7, 1.9, 1.7, 1.6, 2.7, 2.8, 2.4, 1.9, 1.4, 1.6]
            }
        ]
    };
    echartsLabelmonth.setOption(optionLabelmonth);
    
    // 标签有效性：
	var echartsLabelvalidity = echarts.init(document.getElementById("tpl-echarts-labelvalidity"));
    optionLabelvalidity = {
    	title:{
			text:"标签有效性："
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
            data: ["标签总量", "标签被扫码个数", "有效性百分比量"],
            left: "center"
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
                name: "有效性百分比",
                min: 0,
                max: 100,
                interval: 20,
                axisLabel: {
                    formatter: "{value}%"
                }
            }
        ],
        series: [{
                name: "标签总量",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 25, 30, 18, 15, 12]
            },
            {
                name: "标签被扫码个数",
                type: "bar",
                data: [16, 21, 23, 11, 13, 16, 21, 26, 31, 19, 16, 13]
            },
            {
                name: "有效性百分比量",
                type: "line",
                yAxisIndex: 1,
                data: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65]
            }
        ]
    };
    echartsLabelvalidity.setOption(optionLabelvalidity);
    
    // 标签效率：
	var echartsLabeleff = echarts.init(document.getElementById("tpl-echarts-labeleff"));
    optionLabeleff = {
    	title:{
			text:"标签效率："
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
            data: ["标签被扫码个数", "总扫码次数", "平均每标签被扫码次数"],
            left: "center"
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
                name: "平均次数",
                min: 0,
                max: 100,
                interval: 20,
                axisLabel: {
                    formatter: "{value}"
                }
            }
        ],
        series: [{
                name: "标签总量",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 25, 30, 18, 15, 12]
            },
            {
                name: "标签被扫码个数",
                type: "bar",
                data: [16, 21, 23, 11, 13, 16, 21, 26, 31, 19, 16, 13]
            },
            {
                name: "平均每标签被扫码次数",
                type: "line",
                yAxisIndex: 1,
                data: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65]
            }
        ]
    };
    echartsLabeleff.setOption(optionLabeleff);
</script>
</html>