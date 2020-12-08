<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-12
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>默认页面</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
</head>
<body style="padding: 20px;">

<div style="padding: 10% 0px 0px 40%;">
    <h1 style="color: #009f95"><span>欢迎使用信息系统</span></h1>
<%--    <p style="padding-top: 20px; padding-left: 11%;">查看 <a href="" style="color: #0eb2ac">使用手册</a></p>--%>
</div>

<script src="plugins/layui/layui.js"></script>
<script>
    var buttonArr = "<button style='margin-left: 20px' class='layui-btn layui-btn-xs layui-btn-normal'>修改</button> <button class='layui-btn layui-btn-xs layui-btn-danger'>删除</button>"
    layui.use(['element', 'jquery'], function () {
        var element = layui.element,
            $ = layui.jquery;
        $('.layui-timeline-title').each(function (i) {
            if (i < $('.layui-timeline-title').length - 1)
                $(this).append(buttonArr);
        })
    });
</script>
</body>
</html>
