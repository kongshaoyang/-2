/**
 * Created by 田原 on 2017/1/11.
 */
function HttpRequest()
{
    this.post = function (requestUrl, asyncType, sendData, callback, errorcallback) {
        var headData = top.head.getHeadJSON();
        var reqData = null;
        if(jQuery.isEmptyObject(sendData))
        {
            reqData = {"Head" : headData};
        }
        else
        {
            reqData = {"Head" : headData, "Body" : sendData};
        }

        $.ajax({
            url : requestUrl,
            type : 'POST',
            async : true,
            data: JSON.stringify(reqData),
            timeout: 5000,//超时时间
            dataType: 'json',//返回的数据格式:json/xml/html/script/jsonp/text
            contentType:'application/json; charset=utf-8',
            headers:{Accept: 'application/json'},
            success:function(data, status){
                callback(data, status);
            },
            error:function(xhr, status, err){
                errorcallback(xhr, status, err);
            },
            complete:function(){
            }

        })
    }
    
    this.del = function (requestUrl, asyncType, sendData, callback, errorcallback) {
        var headData = top.head.getHeadJSON();
        var reqData = null;
        if(jQuery.isEmptyObject(sendData))
        {
            reqData = {"Head" : headData};
        }
        else
        {
            reqData = {"Head" : headData, "Body" : sendData};
        }
        $.ajax({
            url : requestUrl,
            type : 'POST',
            async : asyncType,
            data: JSON.stringify(reqData),
            timeout: 5000,//超时时间
            dataType: 'json',//返回的数据格式:json/xml/html/script/jsonp/text
            contentType:'application/json; charset=utf-8',
            headers:{Accept: 'application/json'},
            success:function(data, status, xhr){
                callback(data, status, xhr);
            },
            error:function(xhr, status){
                errorcallback(xhr, status);
            },
            complete:function(){
            }

        })
    }
    
    this.put = function (requestUrl, asyncType, sendData, callback, errorcallback) {
        var headData = top.head.getHeadJSON();
        var reqData = null;
        if(jQuery.isEmptyObject(sendData))
        {
            reqData = {"Head" : headData};
        }
        else
        {
            reqData = {"Head" : headData, "Body" : sendData};
        }
        $.ajax({
            url : requestUrl,
            type : 'POST',
            async : asyncType,
            data: JSON.stringify(reqData),
            timeout: 5000,//超时时间
            dataType: 'json',//返回的数据格式:json/xml/html/script/jsonp/text
            contentType:'application/json; charset=utf-8',
            headers:{Accept: 'application/json'},
            success:function(data, status, xhr){
                callback(data, status, xhr);
            },
            error:function(xhr, status){
                errorcallback(xhr, status);
            },
            complete:function(){
            }

        })
    }
    
    this.get = function (requestUrl, asyncType, sendData, callback, errorcallback) {
        var headData = top.head.getHeadJSON();
        var reqData = null;
        if(jQuery.isEmptyObject(sendData))
        {
            reqData = {"Head" : headData};
        }
        else
        {
            reqData = {"Head" : headData, "Body" : sendData};
        }
        $.ajax({
            url : requestUrl,
            type : 'GET',
            async : asyncType,
            data: JSON.stringify(reqData),
            timeout: 5000,//超时时间
            dataType: 'json',//返回的数据格式:json/xml/html/script/jsonp/text
            contentType:'application/json; charset=utf-8',
            success:function(data, status, xhr){
                callback(data, status, xhr);
            },
            error:function(xhr, status){
                errorcallback(xhr, status);
            },
            complete:function(){
            }

        })
    }
}
var httpReq = new HttpRequest();