layui.define(['jquery', 'element', 'table'], function (exports) {
    var $ = layui.jquery;
    console.debug("加载ajax模块");
    var obj = {
        init: function () {

        },
        submit: function (method, url, param, SuccessCallback) {
            if(param != null)
                param = JSON.parse(param);
            if ("get" == method) {
                $.get(url, param, SuccessCallback, "json")
            } else {
                $.post(url, param, SuccessCallback, "json")
            }
        }
    }


    exports("ajax", obj);
})