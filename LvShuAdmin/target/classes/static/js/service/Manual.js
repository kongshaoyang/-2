/**
 * Created by 田原 on 2017/1/12.
 */

function Manual() {

    this.getUserManual = function (sendData) {
        var requestUrl = "/manual/getUserManual";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getManual = function (sendData) {
        var requestUrl = "/manual/getManual";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getMyManualCatalog = function (sendData) {
        var requestUrl = "/catalog/getManualCatalog";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getMyManualSegment = function (sendData) {
        var requestUrl = "/segment/getManualSegment";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getManualVideo = function (sendData) {
        var requestUrl = "/video/getManualVideo";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getManualPicture = function (sendData) {
        var requestUrl = "/picture/getManualPicture";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getVideoMark = function (sendData) {
        var requestUrl = "/video/getVideoMark";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getManualPicture = function (sendData) {
        var requestUrl = "/picture/getManualPicture";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.createTable = function (sendData) {
        var requestUrl = "/comment/createComment";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.publishComment = function (sendData) {
        var requestUrl = "/comment/publishComment";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }


    this.getManualComment = function (sendData) {
        var requestUrl = "/comment/getManualComment";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }

    this.getUserManualComment = function (sendData) {
        var requestUrl = "/comment/getUserManualComment";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.getSuccessCallback, this.errorCallback);
    }



    this.getSuccessCallback = function (data, status) {
        alert("res="+JSON.stringify(data));
    }

    this.errorCallback = function (xhr, status, err) {
        alert("status="+status);
        alert("err="+err);
    }
}
var manual = new Manual();