<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>

<head>
	<meta name="" content="统计 --搜索关键字排名">
	<%@include file="/System/header.jspf" %>
</head>

<body data-type="chart">
	<div class="admin-content">
		<div class="admin">
			<div>
				<!-- 搜索关键字排名： -->
				<div class="tpl-echarts tpl-chart-mb tpl-chart-box" id="tpl-echarts-ranking"></div>
			</div>
			<%@include file="/System/foot.jsp" %>
		</div>
	</div>
</body>

<script type="text/javascript">

	// 搜索关键字排名：
	var echartsRanking = echarts.init(document.getElementById("tpl-echarts-ranking"));
	optionRanking = {
		title : {
			text: "搜索关键字排名："
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
	        orient: "vertical",// 竖着组合，不填即横着组合
	        left: "25%",
	        data:["邮件营销","联盟广告","视频广告","知识库","图片","必应","其他"]
	    },
	    series: [
	        {
	            name:"搜索关键字",
	            type:"pie",
	            center: ["60%", "50%"], // 环形图在整个DIV中间位置
	            radius: ["40%", "55%"], // 环形图的粗细大小
	            data:[
	                {value:335, name:"直达"},
	                {value:310, name:"邮件营销"},
	                {value:234, name:"联盟广告"},
	                {value:135, name:"视频广告"},
	                {value:1048, name:"知识库"},
	                {value:251, name:"图片"},
	                {value:147, name:"必应"},
	                {value:102, name:"其他"}
	            ]
	        }
	    ]
	};
	echartsRanking.setOption(optionRanking);
	
</script>
</html>