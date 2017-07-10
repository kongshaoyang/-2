<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --合同">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div class="">
				<!-- 合同总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-contotal"></div>
	
				<!-- 按地区用户总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-address"></div>
			
				<!-- 按月合同增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-accmonth"></div>
				
				<!-- 收入类合同按服务内容分类： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-contype"></div>
			</div>	
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 合同总量：
	var echartsContotal = echarts.init(document.getElementById("tpl-echarts-contotal"));
	optionContotal = {
		title : {
			text: "合同总量："
		},
	    tooltip: {
	        trigger: "item",
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
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
	        data:["收入类合同","支出类合同","收入类合同总额","支出类合同总额"]
	    },
	    series: [
	        {
	            name:"总额：600万",
	            type:"pie",
	            selectedMode: "single",
	            radius: [0, "45%"],
	
	            label: {
	                normal: {
	                    position: "inner"
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	                {value:"200", name:"收入类合同总额", selected:true},
	                {value:"400", name:"支出类合同总额"}
	            ]
	        },
	        {
	            name:"总合同数：745本",
	            type:"pie",
	            radius: ["55%", "80%"],
	
	            data:[
	                {value:"335", name:"收入类合同"},
	                {value:"410", name:"支出类合同"}
	            ]
	        }
	    ]
	};
    echartsContotal.setOption(optionContotal);
    
    // 按地区用户总量：
	var echartsAddress = echarts.init(document.getElementById("tpl-echarts-address"));
	optionAddress = {
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
            data: ["收入类合同", "合同总额"]
            
        },
        grid: {
            left: "25%",
            right: "25%",
            top: "30%",
            bottom: "1%",
            containLabel: true
        },
        xAxis: [{
            type: "category",
            data: ["北京", "上海", "广州", "深圳", "南京"]
        }],
        yAxis: [{
               type: "value",
               name: "数量",
               min: 0,
               max: 150,
               interval: 30,
               axisLabel: {
                   formatter: "{value}万本"
               }
           },
           {
               type: "value",
               name: "金额",
               min: 0,
               max: 150,
               interval: 30,
               axisLabel: {
                   formatter: "{value}万元"
               }
           }
       ],
        series: [
        	{
                name: "收入类合同",
                type: "bar",
                data: [120, 40, 40, 30, 10]
            }, 
            {
                name: "合同总额",
                type: "line",
                yAxisIndex: 1,
                data: [100, 20, 30, 20, 30]
            }
        ]
    };
   	echartsAddress.setOption(optionAddress);
	
	// 按月合同增量：
	var echartsAccmonth = echarts.init(document.getElementById("tpl-echarts-accmonth"));
    optionAccmonth = {
    	title:{
			text:"按月合同增量："
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
            data: ["总合同数", "总合同数增量", "总合同金额", "总合同金额增量", "收入类合同", "收入类合同增量",
            	   "收入类合同金额", "收入类合同金额增量", "支出类合同", "支出类合同增量", "支出类合同金额", "支出类合同金额增量"],
            left: "16%",
            right: "9%"
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
                name: "合同数",
                min: 0,
                max: 30,
                interval: 6,
                axisLabel: {
                    formatter: "{value}本"
                }
            },
            {
                type: "value",
                name: "金额",
                min: 0,
                max: 100,
                interval: 20,
                axisLabel: {
                    formatter: "{value}万元"
                }
            }
        ],
        series: [{
                name: "总合同数",
                type: "bar",
                data: [15, 20, 22, 10, 12, 15, 20, 15, 20, 18, 15, 12]
            },
            {
                name: "总合同数增量",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "收入类合同",
                type: "bar",
                data: [10, 15, 10, 6, 6, 10, 10, 10, 12, 16, 8, 6]
            },
            {
                name: "收入类合同增量",
                type: "bar",
                data: [3, 4, 4, 6, 2, 3, 4, 2, 5, 6, 5, 2]
            },
            {
                name: "支出类合同",
                type: "bar",
                data: [5, 5, 2, 12, 4, 6, 5, 10, 8, 5, 2, 6]
            },
            {
                name: "支出类合同增量",
                type: "bar",
                data: [3, 5, 2, 2, 2, 2, 3, 1, 3, 5, 2, 2]
            },
            {
                name: "总合同金额",
                type: "line",
                yAxisIndex: 1,
                data: [10, 20, 30, 40, 50, 60, 65, 70, 75, 80, 85, 90]
            },
            {
                name: "总合同金额增量",
                type: "line",
                yAxisIndex: 1,
                data: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
            },
            {
                name: "收入类合同金额",
                type: "line",
                yAxisIndex: 1,
                data: [6, 12, 18, 25, 30, 35, 37, 40, 40, 45, 45, 50]
            },
            {
                name: "收入类合同金额增量",
                type: "line",
                yAxisIndex: 1,
                data: [3, 6, 10, 12, 20, 20, 20, 25, 25, 30, 35, 40]
            },
            {
                name: "支出类合同金额",
                type: "line",
                yAxisIndex: 1,
                data: [4, 8, 12, 15, 20, 25, 28, 30, 35, 35, 40, 40]
            },
            {
                name: "支出类合同金额增量",
                type: "line",
                yAxisIndex: 1,
                data: [2, 4, 5, 8, 15, 10, 15, 15, 20, 20, 20, 20]
            }
        ]
    };
    echartsAccmonth.setOption(optionAccmonth);
 
	// 收入类合同按服务内容分类：
	var echartsContype = echarts.init(document.getElementById("tpl-echarts-contype"));
    optionContype = {
    	title:{
			text:"收入类合同按服务内容分类："
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
        grid: {
            left: "25%",
            right: "25%",
            bottom: "5%",
            containLabel: true
        },
        legend: {
            data: ["收入类合同", "合同总额"]
        },
        xAxis: [{
            type: "category",
            data: ["电子说明书", "纸质说明书", "说明书规范化", "视频制作", "信息推广"]
        }],
        yAxis: [{
                type: "value",
                name: "合同数",
                min: 0,
                max: 30,
                interval: 6,
                axisLabel: {
                    formatter: "{value}本"
                }
            },
            {
                type: "value",
                name: "金额",
                min: 0,
                max: 100,
                interval: 20,
                axisLabel: {
                    formatter: "{value}万元"
                }
            }
        ],
        series: [{
                name: "收入类合同",
                type: "bar",
                data: [15, 20, 22, 10, 12]
            },
            {
                name: "合同总额",
                type: "line",
                yAxisIndex: 1,
                data: [5, 10, 15, 20, 25]
            }
        ]
    };
    echartsContype.setOption(optionContype);
</script>
</html>