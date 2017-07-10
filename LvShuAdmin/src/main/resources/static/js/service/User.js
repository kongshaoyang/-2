/**
 * Created by 田原 on 2017/1/11.
 */

function User() {

    this.login = function (sendData) {
        var requestUrl = "/user/login";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.addCallback, this.errorCallback);
    }

    this.register = function (sendData) {
        var requestUrl = "/user/register";
        var asyncType = false;
        httpReq.post(requestUrl, asyncType, sendData, this.registerCallback, this.errorCallback);
    }
    this.addCallback = function (data, status) {
        alert(JSON.stringify(data));
    }
    this.registerCallback = function (data, status) {
        alert(JSON.stringify(data));
    }
    this.errorCallback = function (xhr, status, err) {
        alert("error");
    }
}
var user = new User();