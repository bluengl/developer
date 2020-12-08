layui.define(['jquery', 'element', 'form'], function (exports) {
    console.debug("加载win模块")
    var element = layui.element,
        $ = layui.jquery,
        form = layui.form;
    form.render();
    // var menuList = '<ul class="layui-bg-green winRightmenu" style="display: none;position: absolute;">\n' +
    //     '                <button type="button" class="layui-btn" data-type="menu-refresh">刷新</button><br/>\n' +
    //     '                <button type="button" class="layui-btn" data-type="menu-back">返回</button><br/>\n' +
    //     '                <button type="button" class="layui-btn" data-type="menu-console">打开控制台</button>\n' +
    //     '            </ul>';
    // $('body').append(menuList);
    var obj = {
        init: function () {
            // winRightMenu();
        },
        openNewWin: function (title, url, param, height, width) {
            var html = url;
            if (param != "null") {
                html += "?" + $.param(JSON.parse(param));
            }
            layer.open({
                type: 2,
                title: title,
                offset: '1px',
                btn: ['保存', '关闭'],
                btn1: function (index, layero) {
                    var body = layer.getChildFrame('body', index);
                    var iframeWin = window[layero.find('iframe')[0]['name']];
                    // body.find('input').val('Hi，我是从父页来的');
                    iframeWin.fnTest1(this);
                },
                end: function (index, layero) {
                    location.reload();
                },
                maxmin: false, //开启最大化最小化按钮
                area: [width, height], //宽高
                content: html
            });
        }
    };
    obj.init();

    // function winRightMenu() {
    //     $('body').on('contextmenu', function (e) {
    //         var menu = $('.winRightMenu');
    //         l = e.clientX;
    //         t = e.clientY;
    //         menu.css({left: l, top: t}).show();
    //         return false;
    //     });
    //
    //     $('body').on('click', function () {
    //         $('.winRightmenu').hide();
    //     });
    // };
    //
    // $(".winRightMenu button").on('click', function () {
    //     var choose = $(this).attr("data-type");
    //     if (choose == "menu-refresh") {
    //         window.location.reload();
    //     } else if(choose == "menu-back") {
    //         window.history.go(-1);
    //     } else if(choose == "menu-console") {
    //         console.debug("kongzhitai")
    //     }
    //     $('.winRightmenu').hide();
    // });


    exports('win', obj);

});