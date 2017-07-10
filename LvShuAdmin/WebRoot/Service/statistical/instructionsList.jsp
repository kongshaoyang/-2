<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --说明书">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 说明书总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-instruct" style=""></div>
				
				<!-- 按行业说明书总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-industry"></div>
				
				<!-- 按月用户增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-month"></div>
				
				<!-- 说明书有效性排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-validity"></div>
				
				<!-- 说明书改进空间： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-improvement"></div>
				
				<!-- 说明书内容访问排序： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-access"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 说明书总量：
	var echartsInstruct = echarts.init(document.getElementById("tpl-echarts-instruct"));
	optionInstruct = {
	    title : {
	        text: "说明书总量："
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
	        data: ["总说明书量"]
	    },
	    series : [
	        {
	            name: "总说明书量",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:335, name:"总说明书量"}
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
	echartsInstruct.setOption(optionInstruct);

	// 按行业说明书总量：
	var echartsIndustry = echarts.init(document.getElementById("tpl-echarts-industry"));
	optionIndustry = {
	    title : {
	        text: "按行业说明书总量："
	    },
	    tooltip : {
	        trigger: "item",
	        formatter: "{a} <br/>{b} : {c} ({d}%)" // 百分比的算法
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
	        orient: "vertical",//居中显示，并竖着排列
	        data: ["[行业：金融业  子行业：银行  二级子行业：科技部门] 说明书数量",
	        	   "[行业：制造业  子行业：华为  二级子行业：报表部门] 说明书数量",
	        	   "[行业：农业  子行业：水稻  二级子行业：杂交] 说明书数量"
	        	  ]
	    },
	    series : [
	        {
	            name: "说明书数量",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:335, name:"[行业：金融业  子行业：银行  二级子行业：科技部门] 说明书数量"},
	                {value:225, name:"[行业：制造业  子行业：华为  二级子行业：报表部门] 说明书数量"},
	                {value:125, name:"[行业：农业  子行业：水稻  二级子行业：杂交] 说明书数量"}
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
            containLabel: true // Y轴文字是否全部显示
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
    
    // 说明书有效性排名：
	var echartsValidity = echarts.init(document.getElementById("tpl-echarts-validity"));
	optionValidity = {
			title:{
				text:"说明书有效性排名："
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
                data: ["标签发放总量", "平均每标签访问次数"]
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
                data: ["华为企业产品介绍", "产品规格", "简介及组网建议", "帮助文档"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "标签发放总量",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [90, 30, 25, 55]
                    
                },
                {
                    name: "平均每标签访问次数",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50, 18, 12, 33]
                    
                }
            ]
	};
	echartsValidity.setOption(optionValidity);
	
	// 说明书改进空间：
	var echartsImprovement = echarts.init(document.getElementById("tpl-echarts-improvement"));
	optionImprovement = {
			title:{
				text:"说明书改进空间："
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
                data: ["纠错总数", "建议总数"]
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
                data: ["华为企业产品介绍", "产品规格", "简介及组网建议", "帮助文档"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "纠错总数",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [90, 30, 25, 55]
                    
                },
                {
                    name: "建议总数",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50, 18, 12, 33]
                    
                }
            ]
	};
	echartsImprovement.setOption(optionImprovement);
	
	// 说明书内容访问排序：
	var echartsAccess = echarts.init(document.getElementById("tpl-echarts-access"));
	optionAccess = {
			title:{
				text:"说明书内容访问排序："
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
				orient: "vertical",//居中显示，并竖着排列
                data: ["【书名：华为企业产品介绍，片段：什么是SBC】 总访问次数",
	        	   "【书名：产品规格，片段：框架使用】 总访问次数",
	        	   "【书名：帮助文档，片段：echarts怎么使用】 总访问次数"]
		        //left: "30%", // 有orient这个属性时候，不需要使用left，和right
		        //right: "18%",
            },
			grid: {
                left: "30%",
                right: "30%",
                bottom: "5%",
                top : "25%",
                containLabel: true
            },
			xAxis: [{
                type: "category",
                boundaryGap: true,
                data: ["说明书内容访问排序"]
            }],
			yAxis: [{
                type: ""
            }],
			series: [{
                    name: "【书名：华为企业产品介绍，片段：什么是SBC】 总访问次数",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [90]
                },
                {
                    name: "【书名：产品规格，片段：框架使用】 总访问次数",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [50]
                },
                {
                    name: "【书名：帮助文档，片段：echarts怎么使用】 总访问次数",
                    type: "bar",
                    stack: "",
                    areaStyle: { normal: {} },
                    data: [40]
                }
            ]
	};
	echartsAccess.setOption(optionAccess);
	
</script>
</html>