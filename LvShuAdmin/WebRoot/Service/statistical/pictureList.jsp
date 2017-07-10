<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --图片">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 图片总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-picturetotal"></div>
				
				<!-- 按行业视频总量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-industryvideo"></div>
				
				<!-- 按月视频增量： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-monthvideo"></div>
				
				<!-- 视频有效性： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-videovalid"></div>
				
				<!-- 视频效率： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-videoeff"></div>
			</div>
			
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 图片总量：
	var echartsPicturetotal = echarts.init(document.getElementById("tpl-echarts-picturetotal"));
	optionPicturetotal = {
			title : {
	        text: "图片总量："
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
	        data: ["静态图片数", "动态图片数"]
	    },
	    series : [
	        {
	            name: "图片总量：335",
	            type: "pie",
	            radius : "55%",
	            center: ["50%", "60%"],
	            data:[
	                {value:135, name:"静态图片数"},
	                {value:200, name:"动态图片数"}
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
	echartsPicturetotal.setOption(optionPicturetotal);	

	// 按行业视频总量：
	var echartsIndustryVideo = echarts.init(document.getElementById("tpl-echarts-industryvideo"));
	optionIndustryVideo = {
    	title:{
			text:"按行业视频总量："
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
            data: ["视频数量", "平均视频数量", "视频时长", "平均视频时长"]
        },
        xAxis: [{
            type: "category",
            data: ["行业:金融业    子行业:广电    二级子行业：现金机", "行业:制造业    子行业:长城    二级子行业：快柜", "行业:工业    子行业:日立    二级子行业：2845V", "行业:农业    子行业:怡化    二级子行业：杂交"]
        }],
        yAxis: [{
                type: "value",
                name: "维修数",
                min: 0,
                max: 500,
                interval: 100,
                axisLabel: {
                    formatter: "{value}"
                }
            },
            {
                type: "value",
                name: "时长",
                min: 0,
                max: 5,
                interval: 1,
                axisLabel: {
                    formatter: "{value}h"
                }
            }
        ],
        series: [{
                name: "视频数量",
                type: "bar",
                data: [180, 340, 330, 220]
            },
            {
                name: "平均视频数量",
                type: "bar",
                data: [140, 160, 200, 100]
            },
            {
                name: "视频时长",
                type: "line",
                yAxisIndex: 1,
                data: [2.0, 2.2, 2.3, 2.5]
            },
            {
                name: "平均视频时长",
                type: "line",
                yAxisIndex: 1,
                data: [1.0, 1.2, 1.3, 1.5]
            }
        ]
    };
    echartsIndustryVideo.setOption(optionIndustryVideo);
	
	// 按月视频增量：
	var echartsMonthVideo = echarts.init(document.getElementById("tpl-echarts-monthvideo"));
    optionMonthVideo = {
    	title:{
			text:"按月视频增量："
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
            data: ["视频数量", "视频数量增量", "视频时长", "视频时长增量"]
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
                    formatter: "{value}h"
                }
            }
        ],
        series: [{
                name: "视频数量",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "视频数量增量",
                type: "bar",
                data: [2, 4, 6, 6, 1, 2, 2, 4, 4, 6, 1, 2]
            },
            {
                name: "视频时长",
                type: "line",
                yAxisIndex: 1,
                data: [2.1, 2.5, 2.5, 2.8, 2.5, 2.8, 2.8, 3.0, 3.0, 2.6, 2.2, 2.0]
            },
            {
                name: "视频时长增量",
                type: "line",
                yAxisIndex: 1,
                data: [1.8, 1.6, 1.4, 2.0, 1.5, 2.0, 1.6, 1.5, 1.8, 1.8, 1.1, 1.3]
            }
        ]
    };
    echartsMonthVideo.setOption(optionMonthVideo);
    
    // 视频有效性：
	var echartsVideoValid = echarts.init(document.getElementById("tpl-echarts-videovalid"));
    optionVideoValid = {
    	title:{
			text:"视频有效性："
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
            data: ["视频总量", "有用数", "无用数", "收藏数"]
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
            }
        ],
        series: [{
                name: "视频总量",
                type: "bar",
                data: [6, 10, 14, 14, 4, 6, 6, 10, 10, 14, 4, 6]
            },
            {
                name: "有用数",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "无用数",
                type: "bar",
                data: [2, 4, 6, 6, 1, 2, 2, 4, 4, 6, 1, 2]
            },
            {
                name: "收藏数",
                type: "bar",
                data: [3, 5, 7, 7, 2, 3, 3, 5, 5, 7, 2, 3]
            }
        ]
    };
    echartsVideoValid.setOption(optionVideoValid);
    
    // 视频效率：
	var echartsVideoeff = echarts.init(document.getElementById("tpl-echarts-videoeff"));
    optionVideoeff = {
    	title:{
			text:"视频效率："
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
            data: ["视频总量", "视频播放次数", "平均每视频被播放次数"]
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
                name: "平均数量",
                min: 0,
                max: 10,
                interval: 2,
                axisLabel: {
                    formatter: "{value}次"
                }
            }
        ],
        series: [{
                name: "视频总量",
                type: "bar",
                data: [6, 10, 14, 14, 4, 6, 6, 10, 10, 14, 4, 6]
            },
            {
                name: "视频播放次数",
                type: "bar",
                data: [4, 6, 8, 8, 3, 4, 4, 6, 6, 8, 3, 4]
            },
            {
                name: "平均每视频被播放次数",
                type: "line",
                yAxisIndex: 1,
                data: [1.8, 1.6, 1.4, 2.0, 1.5, 2.0, 1.6, 1.5, 1.8, 1.8, 1.1, 1.3]
            }
        ]
    };
    echartsVideoeff.setOption(optionVideoeff);
	
</script>
</html>