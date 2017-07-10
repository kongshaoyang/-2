<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
	<%@include file="/System/header.jspf" %>
</head>

<body style="overflow: hidden;">

	<%@include file="/System/header.jsp" %>

	<div class="am-cf admin-main"> 
		
		<%@include file="/System/menu.jsp" %>

		<div class="admin-content" id="adminTab">
			<div class="daohang">
				<ul>
					<li id="nav_index"><button id="0" onclick="javascript: onclickTab('index')" type="button" class="am-btn am-radius am-btn-xs daohang_active">首页 </button></li>
				</ul>
			</div>
			<div id="ifrm_index" class="ifrm_content_active">
				<iframe id="index" width="100%" src="about:blank"></iframe>
			</div>
			
			<div class="am-modal am-modal-alert" id="tipsDiv">
				<div class="am-modal-dialog">
			    	<div class="am-modal-hd" id="tipsTitle">
			      		<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			    	</div>
			    	<div class="am-modal-bd" id="tipsContent">
			    	</div>
			    	<div class="am-modal-footer">
				      	<span class="am-modal-btn">确定</span>
				    </div>
			  	</div>
			</div>
		</div>
		
	</div>
</body>

<script type="text/javascript">
	var $tab = $("#adminTab");
    var $tabnav = $tab.find(".daohang ul");
    var iframeHeight = $(document).height() - 50; // 内容高度 = 文档可见高度-顶层高度
    // 新增页签事件
   	function addTab(tabid, url, title) {
   		var tabFrame = $("div").find("iframe");
   		
   		var isTabExist = false;
   		for (var i = 0; i < tabFrame.length; i++)
   		{
   			if (tabFrame[i].id == tabid)
   			{
   				isTabExist = true;
   				break;
   			}
   		}
   		
   		// 页签已存在，直接默认选中
   		if (isTabExist) 
   		{
   			onclickTab(tabid);
   			return;
   		}
   		
   		if (tabFrame != null && tabFrame.length > 8) 
   		{
   			$("#tipsTitle").text("温馨提示");
   			$("#tipsContent").text("您打开的页签太多，请先关闭多余的页签！");
   			$("#tipsDiv").modal("open");
   			return;
   		}
   		
   		var tabnav = '<li id="nav_' + tabid + '"><button id="' + tabid + '" onclick="javascript: onclickTab(' + tabid + ')" type="button" class="am-btn am-radius am-btn-xs daohang_active">' + title + '<a href="javascript: closeTab(' + tabid + ')" class="am-close am-close-spin" data-am-modal-close="">×</a></li>';
   		var tabcontent = '<div id="ifrm_' + tabid + '" class="ifrm_content_active"><iframe id="' + tabid + '" width="100%" height="'+ iframeHeight +'px" src="' + url + '"></iframe></div>';
   		
   		hideTab();
   		
   		$tabnav.append(tabnav);
   		$tab.append(tabcontent);
   	}
   	
   	var activetabid = 0; // 被选中的tabid
   	
    // 关闭页签事件
   	function closeTab(tabid) {
   		$("#nav_" + tabid).remove();
   		$("#ifrm_" + tabid).remove();
   		
   		// 如果activetabid和当前被关闭的tabid不相等，即被关闭的页签不是被选中的页签，显示被选中的页签
   		if (activetabid != tabid) {
  			$("#" + activetabid).addClass("daohang_active").removeClass("am-btn-default");
  			
  			// 如果activeid等于0，显示首页页签
  			if (activetabid == 0) {
  				$("#ifrm_index").addClass("ifrm_content_active").removeClass("ifrm_content_default");
  				return;
  			}
  			
  			$("#ifrm_" + activetabid).addClass("ifrm_content_active").removeClass("ifrm_content_default");
   			return;
   		}
   		
   		// 显示最后一个页签
   		$(".am-btn-default:last").addClass("daohang_active").removeClass("am-btn-default");
   		$(".ifrm_content_default:last").addClass("ifrm_content_active").removeClass("ifrm_content_default");
   	}
   	
    // 点击页签事件
   	function onclickTab(tabid) {
   		hideTab();
      		
   		$("#nav_" + tabid).find("button").addClass("daohang_active").removeClass("am-btn-default");
   		$("#ifrm_" + tabid).addClass("ifrm_content_active").removeClass("ifrm_content_default");
   	}
    //点击产品按钮
    function onclickProduct(){
    	$("#product").click(function(){
    		alert("即将进入控制层");
    		location.href = "/productList/getProductListDetails";
    	});
    }
    
    // 隐藏页签事件
    function hideTab() {
    	// 隐藏当前选中页签
   		$tab.find(".daohang_active").each(function(){
   		    $(this).addClass("am-btn-default").removeClass("daohang_active");
   		   	// 取当前被选中页签的tabid
   		    activetabid = $(this).attr("id");
   		});
    	
      	// 隐藏当前选中页签内容
   		$tab.find(".ifrm_content_active").each(function(){
   		    $(this).addClass("ifrm_content_default").removeClass("ifrm_content_active");
   		});
    }
    
	$(function() {
		// 左侧菜单事件处理
		$(".sideMenu").slide({
			titCell : "h3", 		//鼠标触发对象
			targetCell : "ul", 		//与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
			effect : "slideDown", 	//targetCell下拉效果
			delayTime : 300, 		//效果时间
			triggerTime : 150, 		//鼠标延迟触发时间（默认150）
			defaultPlay : true, 	//默认是否执行效果（默认true）
			returnDefault : false 	//鼠标从.sideMen移走后返回默认状态（默认false）
		});
		
		// 设置首页页签
		$("#index").attr({src: "/System/index.jsp", height: iframeHeight});
	});
   	
</script> 
</html>