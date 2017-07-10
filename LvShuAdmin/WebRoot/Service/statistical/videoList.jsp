<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --视频">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 视频总量： -->
				<div class="tpl-chart-mb tpl-chart-box" id="tpl-echarts-videototal"></div>
				
				<!-- 按行业视频总量： -->
				<div class="tpl-chart-mb tpl-chart-box" id="tpl-echarts-industryvideo"></div>
				
				<!-- 表格数据：按月视频增量： -->
				<div class="admin-biaoge tpl-chart-mb tpl-chart-box tpl-table-wz">
					<div class="tpl-chart-tips">按月视频增量：</div>
					<table class="am-table tpl-chart-table">
				        <thead>
				          <tr>
				            <th>年月</th>
				            <th>视频类别</th>
				            <th>视频数量</th>
				            <th>视频数量增量</th>
				            <th>视频时长</th>
				            <th>视频时长增量</th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <td>
					            <a href="javascript:showMonthVideo();" class="am-icon-search"> 2016年5月</a>
				            </td>
				            <td>介绍视频数</td>
				            <td>50</td>
				            <td>30</td>
				            <td>20</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
				            	<a href="javascript:showMonthVideo();" class="am-icon-search"> 2016年6月</a>
				            </td>
				            <td>安装视频数</td>
				            <td>60</td>
				            <td>25</td>
				            <td>20</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					          	<a href="javascript:showMonthVideo();" class="am-icon-search"> 2016年7月</a>
				            </td>
				            <td>使用视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					           <a href="javascript:showMonthVideo();" class="am-icon-search"> 2016年8月</a>
				            </td>
				            <td>技巧视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showMonthVideo();" class="am-icon-search"> 2016年9月</a>
				            </td>
				            <td>常见问题视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					        	<a href="javascript:showMonthVideo();" class="am-icon-search"> 合计合并</a>
				            </td>
				            <td>合计合并</td>
				            <td>180</td>
				            <td>90</td>
				            <td>60</td>
				            <td>90</td>
				          </tr>
				        </tbody>
			      	</table>
		    	</div>
		    			
				<!-- 表格数据：视频有效性： -->
				<div class="admin-biaoge tpl-chart-mb tpl-chart-box tpl-table-wz">
					<div class="tpl-chart-tips">视频有效性：</div>
					<table class="am-table tpl-chart-table">
				        <thead>
				          <tr>
				            <th>年月</th>
				            <th>视频类别</th>
				            <th>视频总量</th>
				            <th>有用数</th>
				            <th>无用数</th>
				            <th>收藏数</th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <td>
								<a href="javascript:showVideoValid();" class="am-icon-search"> 2016年5月</a>
				            </td>
				            <td>介绍视频数</td>
				            <td>50</td>
				            <td>30</td>
				            <td>20</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoValid();" class="am-icon-search"> 2016年6月</a>
				            </td>
				            <td>安装视频数</td>
				            <td>60</td>
				            <td>25</td>
				            <td>20</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					         	<a href="javascript:showVideoValid();" class="am-icon-search"> 2016年7月</a>
				            </td>
				            <td>使用视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					           	<a href="javascript:showVideoValid();" class="am-icon-search"> 2016年8月</a>
				            </td>
				            <td>技巧视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoValid();" class="am-icon-search"> 2016年9月</a>
				            </td>
				            <td>常见问题视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoValid();" class="am-icon-search"> 合计合并</a>
				            </td>
				            <td>合计合并</td>
				            <td>180</td>
				            <td>90</td>
				            <td>60</td>
				            <td>90</td>
				          </tr>
				        </tbody>
			      	</table>
		    	</div>
		    			 
				<!-- 表格数据：视频效率： -->
				<div class="admin-biaoge tpl-chart-mb tpl-chart-box tpl-table-wz">
					<div class="tpl-chart-tips">视频效率：</div>
					<table class="am-table tpl-chart-table">
				        <thead>
				          <tr>
				            <th>年月</th>
				            <th>视频类别</th>
				            <th>视频总量</th>
				            <th>视频播放次数</th>
				            <th>平均每视频被播放次数</th>
				          </tr>
				        </thead>
				        <tbody>
				          <tr>
				            <td>
								<a href="javascript:showVideoEfficiency();" class="am-icon-search"> 2016年5月</a>
				            </td>
				            <td>介绍视频数</td>
				            <td>50</td>
				            <td>20</td>
				            <td>15</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoEfficiency();" class="am-icon-search"> 2016年6月</a>
				            </td>
				            <td>安装视频数</td>
				            <td>60</td>
				            <td>25</td>
				            <td>20</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoEfficiency();" class="am-icon-search"> 2016年7月</a>
				            </td>
				            <td>使用视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoEfficiency();" class="am-icon-search"> 2016年8月</a>
				            </td>
				            <td>技巧视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoEfficiency();" class="am-icon-search"> 2016年9月</a>
				            </td>
				            <td>常见问题视频数</td>
				            <td>65</td>
				            <td>30</td>
				            <td>25</td>
				          </tr>
				          <tr>
				            <td>
					            <a href="javascript:showVideoEfficiency();" class="am-icon-search"> 合计合并</a>
				            </td>
				            <td>合计合并</td>
				            <td>180</td>
				            <td>90</td>
				            <td>60</td>
				          </tr>
				        </tbody>
			      	</table>
		    	</div>
				<%@include file="/System/foot.jsp" %>
			</div>
		</div>
		<!-- 弹出框显示的报表不需要加虚阴影背景CSS：tpl-chart-box -->

		<!-- 按月视频增量： -->
		<div class="am-modal am-modal-no-btn" id="monthvideo_popup">
			<div class="am-modal-dialog" style="width:65%; height:500px;overflow: auto;">
				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-monthvideo"></div> 
			</div>	
		</div>
		
		<!-- 视频有效性： -->
		<div class="am-modal am-modal-no-btn" id="videovalid_popup">
			<div class="am-modal-dialog" style="width:65%; height:500px;overflow: auto;">
				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-videovalid"></div> 
			</div>	
		</div>
		
		<!-- 视频效率： -->
		<div class="am-modal am-modal-no-btn" id="videoefficiency_popup">
			<div class="am-modal-dialog" style="width:65%; height:500px;overflow: auto;">
				<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-videoefficiency"></div> 
			</div>	
		</div>
	</div>
</body>

<script type="text/javascript">

	// 视频总量：
	var echartsVideoTotal = echarts.init(document.getElementById("tpl-echarts-videototal"));
	optionVideoTotal = {
    	title:{
			text:"视频总量："
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
            data: ["视频总数", "视频总时长(单位：h)", "视频总容量(单位：G)"]
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
            data: ["介绍视频数", "安装视频数", "使用视频数", "技巧视频数", 
            	"常见问题视频数", "用户心得体验视频", "总计"]
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
                name: "时长或容量",
                min: 0,
                max: 50,
                interval: 10,
                axisLabel: {
                    formatter: "{value}h或G"
                }
            }
        ],
        series: [{
                name: "视频总数",
                type: "bar",
                data: [10, 20, 30, 40, 50, 60, 70]
            },
            {
                name: "视频总时长(单位：h)",
                type: "line",
                yAxisIndex: 1,
                data: [10, 15, 20, 25, 30, 35, 40]
            },
            {
                name: "视频总容量(单位：G)",
                type: "line",
                yAxisIndex: 1,
                data: [5, 10, 15, 20, 25, 30, 35]
            }
        ]
    };
    echartsVideoTotal.setOption(optionVideoTotal);

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
            data: ["行业", "视频数量", "平均视频数量", "视频时长", "平均视频时长"]
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
            data: ["介绍视频数  行业：金融", "安装视频数  行业：制造", "使用视频数", "技巧视频数", 
            	"常见问题视频数", "用户心得体验视频", "总计"]
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
                name: "时长",
                min: 0,
                max: 50,
                interval: 10,
                axisLabel: {
                    formatter: "{value}h"
                }
            }
        ],
        series: [
        	{
                name: "行业",
                type: "bar",
                data: ["行", 20, 30, 40, 50, 60, 70]
            },
        	{
                name: "视频数量",
                type: "bar",
                data: [10, 20, 30, 40, 50, 60, 70]
            },
            {
                name: "平均视频数量",
                type: "bar",
                data: [5, 10, 15, 20, 25, 30, 35]
            },
            {
                name: "视频时长",
                type: "line",
                yAxisIndex: 1,
                data: [10, 15, 20, 25, 30, 35, 40]
            },
            {
                name: "平均视频时长",
                type: "line",
                yAxisIndex: 1,
                data: [5, 7.5, 10, 12.5, 15, 17.5, 20]
            }
        ]
    };
    echartsIndustryVideo.setOption(optionIndustryVideo);
	
	// 查看按月视频增量数据
    function showMonthVideo()
    {
    	// 打开视频效率窗口
    	$("#monthvideo_popup").modal("open");
    	
    	// 按月视频增量：
		var echartsMonthVideo = echarts.init(document.getElementById("tpl-echarts-monthvideo"));
		optionMonthVideo = {
	    	title:{
				text:"【2016年5月】月视频增量："
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
	        	orient: "vertical",
	            data: ["视频数量", "视频增量", "视频时长", "视频时长增量"]
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
	            data: ["介绍视频数", "安装视频数", "使用视频数", "技巧视频数", 
	            	"常见问题视频数", "用户心得体验视频", "总计"]
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
	                name: "时长",
	                min: 0,
	                max: 50,
	                interval: 10,
	                axisLabel: {
	                    formatter: "{value}h"
	                }
	            }
	        ],
	        series: [
	        	{
	                name: "视频数量",
	                type: "bar",
	                data: [10, 20, 30, 40, 50, 60, 70]
	            },
	            {
	                name: "视频数量增量",
	                type: "bar",
	                data: [5, 10, 15, 20, 25, 30, 35]
	            },
	            {
	                name: "视频时长",
	                type: "line",
	                yAxisIndex: 1,
	                data: [10, 15, 20, 25, 30, 35, 40]
	            },
	            {
	                name: "视频时长增量",
	                type: "line",
	                yAxisIndex: 1,
	                data: [5, 7.5, 10, 12.5, 15, 17.5, 20]
	            }
	        ]
	    };
	    echartsMonthVideo.setOption(optionMonthVideo);
    }
    
    // 查看视频有效性月份数据
    function showVideoValid()
    {
    	// 打开视频效率窗口
    	$("#videovalid_popup").modal("open");
    	
    	// 视频有效性：
		var echartsVideoValid = echarts.init(document.getElementById("tpl-echarts-videovalid"));
		optionVideoValid = {
	    	title:{
				text:"【2016年4月】视频有效性："
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
	        grid: {
	            left: "5%",// 整个表格在左右两边距离
	            right: "5%",
	            bottom: "5%",
	            top: "20%", // 整个报表表格在距离legend距离
	            containLabel: true
	        },
	        xAxis: [{
	            type: "category",
	            data: ["介绍视频数", "安装视频数", "使用视频数", "技巧视频数", 
	            	"常见问题视频数", "用户心得体验视频", "总计"]
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
	                name: "总数",
	                min: 0,
	                max: 100,
	                interval: 20,
	                axisLabel: {
	                    formatter: "{value}"
	                }
	            }
	        ],
	        series: [
	            {
	                name: "有用数",
	                type: "bar",
	                data: [3, 12, 20, 28, 35, 40, 45]
	            },
	            {
	                name: "无用数",
	                type: "bar",
	                data: [3, 8, 10, 12, 15, 20, 25]
	            },
	            {
	                name: "收藏数",
	                type: "bar",
	                data: [4, 8, 15, 16, 25, 30, 32]
	            },
	            {
	                name: "视频总量",
	                type: "line",
	                yAxisIndex: 1,
	                data: [10, 20, 30, 40, 50, 60, 70]
	            }
	        ]
	    };
	    echartsVideoValid.setOption(optionVideoValid);
    }
	
    // 查看视频效率月份数据
    function showVideoEfficiency()
    {
    	// 打开视频效率窗口
    	$("#videoefficiency_popup").modal("open");
    	
    	// 视频效率：
		var echartsVideoEfficiency = echarts.init(document.getElementById("tpl-echarts-videoefficiency"));
		optionVideoEfficiency = {
	    	title:{
				text:"【2016年8月】视频效率："
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
	        	orient: "vertical",
	            data: ["视频总量", "视频播放次数", "平均每视频被播放次数"]
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
	            data: ["介绍视频数", "安装视频数", "使用视频数", "技巧视频数", 
	            	"常见问题视频数", "用户心得体验视频", "总计"]
	        }],
	        yAxis: [{
	                type: "value",
	                name: "次数",
	                min: 0,
	                max: 100,
	                interval: 20,
	                axisLabel: {
	                    formatter: "{value}"
	                }
	            }
	        ],
	        series: [
	            {
	                name: "视频总量",
	                type: "bar",
	                data: [10, 20, 30, 40, 50, 60, 70]
	            },
	            {
	                name: "视频播放次数",
	                type: "bar",
	                data: [3, 12, 20, 28, 35, 40, 45]
	            },
	            {
	                name: "平均每视频被播放次数",
	                type: "bar",
	                data: [3, 8, 10, 12, 15, 20, 25]
	            }
	        ]
	    };
	    echartsVideoEfficiency.setOption(optionVideoEfficiency);
    }
    
</script>
</html>