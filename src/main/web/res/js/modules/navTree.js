layui.define(['jquery', 'element'], function (exports) {
    var element = layui.element,
        $ = layui.jquery;
    console.debug("加载navTree模块")
    var obj = {
        hiddenNav: function (that) {
            $(that).hide();
        },
        showNav: function (that) {
            $(that).show();
        }
    }
    var isShow = true;  //定义一个标志位
    $('.kit-side-fold a i').click(function () {
        //选择出所有的span，并判断是不是hidden
        $('.layui-nav-tree .layui-nav-item span').each(function () {
            if ($(this).is(':hidden')) {
                obj.showNav($(this));
            } else {
                obj.hiddenNav($(this));
            }
        });
        //判断isShow的状态
        if (isShow) {
            $('.layui-side.layui-bg-black').width(60); //设置宽度
            $('.kit-side-fold a').css('padding-left', '5%');  //修改图标的位置
            $('.kit-side-fold a i').addClass("layui-icon-next").removeClass("layui-icon-prev")  //替换图标
            //将footer和body的宽度修改
            $('.layui-body').css('left', 60 + 'px');
            $('.layui-footer').css('left', 60 + 'px');
            //将二级导航栏隐藏
            $('.layui-nav-tree .layui-nav-item dd span').each(function () {
                obj.hiddenNav($(this));
            });
            //修改标志位
            isShow = false;
        } else {
            $('.layui-side.layui-bg-black').width(200);
            $('.kit-side-fold a').css('padding-left', '85%');
            $('.kit-side-fold a i').addClass("layui-icon-prev").removeClass("layui-icon-next")
            $('.layui-body').css('left', 200 + 'px');
            $('.layui-footer').css('left', 200 + 'px');
            $('dd span').each(function () {
                obj.showNav($(this));
            });
            isShow = true;
        }
    });

    exports('navTree', obj);

})