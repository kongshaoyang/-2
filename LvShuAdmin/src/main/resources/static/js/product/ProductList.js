function ProductList(){
	alert("进入js方法");
	this.getProductListDetails = function(sendData){
		alert("进入getProductListDetails方法");
		alert("sendData="+sendData);
		 var requestUrl = "/productList/getProductListDetails";
		 alert(requestUrl);
	     var asyncType = false;
	     alert(asyncType);
	     top.httpReq.get(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
	}
	this.deleteProduct = function(sendDate){
		var requestUrl = "/product/deleteProduct"
		var asyncType = false;
		httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
	}
	this.addProduct = function(sendDate){
		var reqeustUrl = "/product/addProduct"
		var asyncType = false;
		httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
	}
	this.updateProduct = function(sendDate){
		var reqeustUrl = "/product/updateProduct"
		var asyncType = false;
		httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
	}
	this.getSuccessCallback = function (data,status) {
		alert("返回成功进入");
	    alert("res="+JSON.stringify(data));
		var tbodyHtml = "";
		data = data.Body;
		for(var i = 0; i < data.length; i++){
			tbodyHtml +="<tr>"
			tbodyHtml +="<td><input type='checkbox'/></td>"
			tbodyHtml += "<td>"+data[i].manufacturerNum+"</td>";
			tbodyHtml += "<td>"+data[i].psNum+"</td>";
			tbodyHtml += "<td>"+data[i].psSN+"</td>";
			tbodyHtml += "<td>"+data[i].barcodeNum+"</td>";
			tbodyHtml += "<td>"+data[i].productionDate+"</td>";
			tbodyHtml += "<td>"+data[i].shelflife+"</td>";
			tbodyHtml += "<td>"+data[i].shelflifeEndDate+"</td>";
			tbodyHtml += "</tr>";
		}
		alert(tbodyHtml);
		$("#tbodyHtml").html(tbodyHtml);
	}

	this.errorCallback = function (xhr, status, err) {
	    alert("status="+status);
	    alert("err="+err);
	}
}
var productList = new ProductList();