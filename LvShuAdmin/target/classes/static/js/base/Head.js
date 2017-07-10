/**
 * Created by 田原 on 2017/1/11.
 */
function Head()
{

    this.getHeadJSON = function () {
        /**
         * RequestType 请求类型 APP：使用客户移动APP访问 PC：使用PC访问
         * DateTime 访问日期 YYYY-MM-DD
         * Version 版本号 空或APP版本号
         * UserNum 用户编号 当前登录的用户编号
         * UserType 用户类型
         * WeixinID 微信ID
         * AlipayID 支付宝ID
         * RetCode 服务返回结果
         * RetDesc 服务返回结果
         */
        var date = new Date();
        var month = date.getMonth() + 1;
        var today = date.getDate();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();
        var currentdt = date.getFullYear()+"-"+(month<10?("0"+month):month)+"-"+(today<10?("0"+today):today)+" "+(hours<10?("0"+hours):hours)+":"+(minutes<10?("0"+minutes):minutes)+":"+(seconds<10?("0"+seconds):seconds);
        var userNum = "USER0000000000000000000000000001";
        var userType = "101";
        var weixinID = "13871909873";
        var alipayID = "13976845096";
        var reqHead = {"requestType" : "PC", "dateTime" : currentdt, "version" : "release v1.0", "userNum" : userNum, "userType" : userType, "weixinID" : weixinID, "alipayID" : alipayID, "retCode":"err","retDesc":"err"};
        return reqHead;
    }
}
var head = new Head();