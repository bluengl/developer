layui.define(['jquery', 'element', 'layer'], function (exports) {
    var element = layui.element,
        $ = layui.jquery;
    console.debug("加载msg模块")
    var obj = {
        msgTipTop: function (msg) {
            layer.msg(msg)
        },
        msgTipTop: function (msg, that) {
            layer.open({
                type: 4,
                content: [msg, that] //数组第二项即吸附元素选择器或者DOM
            });
        }
    };

    exports('msg', obj);

})