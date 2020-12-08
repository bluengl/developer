layui.define(['jquery', 'element'], function (exports) {
    var element = layui.element,
        $ = layui.jquery;
    console.debug("加载tab模块")
    var selectedTabId;
    // 隐藏主tab的关闭按钮
    $('#indexTab').children()[1].style.display = 'none';
    var obj = {
        tabAdd: function (url, id, name) {
            element.tabAdd('contentnav', {
                title: name,
                content: '<iframe data-frameid="' + id + '" scrolling="yes" frameborder="0" src="' + url + '" style="width:100%;height: 100%;"></iframe>',
                id: id
            });
            rightMenu();
            iframeWH();
        },
        tabChange: function (id) {
            element.tabChange('contentnav', id);
        },
        tabDelete: function (id) {
            if (id != 1)
                element.tabDelete('contentnav', id);
        },
        tabDeleteAll: function (ids) {
            $.each(ids, function (index, item) {
                if (item != 1)
                    element.tabDelete('contentnav', item);
            });
        }
    };
    $(".site-url").on('click', function () {
        var options = $.parseJSON($(this).attr("data-options"));
        var length = $("ul.layui-tab-title li").length;
        if (length <= 1) {
            obj.tabAdd(options.url, options.id, options.title);
        } else {
            var isData = false;
            $.each($("ul.layui-tab-title li"), function () {
                if ($(this).attr("lay-id") == options.id) {
                    isData = true;
                }
            });
            if (isData == false) {
                obj.tabAdd(options.url, options.id, options.title);
            }
        }
        obj.tabChange(options.id);
    });

    function rightMenu() {
        //右击弹出
        $(".layui-tab-title li").on('contextmenu', function (e) {
            selectedTabId = $(this).attr("lay-id");
            var menu = $(".rightmenu");
            menu.find("button").attr('data-id', $(this).attr("lay-id"));
            l = e.clientX - 180;
            t = e.clientY - 50;
            if (selectedTabId != 1)
                menu.css({left: l, top: t}).show();
            return false;
        });
        //左键点击隐藏
        $("body,.layui-tab-title li").click(function () {
            $(".rightmenu").hide();
        });
    }

    $(".rightmenu button").click(function () {
        if ($(this).attr("data-type") == "closeThis") {
            obj.tabDelete($(this).attr("data-id"));
        } else if ($(this).attr("data-type") == "closeOther") {
            var tabtitle = $(".layui-tab-title li");
            var ids = new Array();
            tabtitle.each(function (i) {
                if ($(this).attr("lay-id") != selectedTabId)
                    ids.push($(this).attr("lay-id"));
            });
            obj.tabDeleteAll(ids);
        } else if ($(this).attr("data-type") == "closeAll") {
            var tabtitle = $(".layui-tab-title li");
            var ids = new Array();
            tabtitle.each(function (i) {
                ids.push($(this).attr("lay-id"));
            });
            obj.tabDeleteAll(ids);
        } else if ($(this).attr("data-type") == "refreshThis") {
            var id = $(this).attr("data-id");
            $("body .layui-body iframe").each(function (index) {
                if ($(this).attr("data-frameid") == id) {
                    this.contentWindow.location.reload()
                }
            })
        }
        $('.rightmenu').hide();
    });

    function iframeWH() {
        $("iframe").css("height", "89%");
    }

    $(window).resize(function () {
        iframeWH();
    })

    exports('tab', obj);

});