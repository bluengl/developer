<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-30
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">
</head>
<body style="background: url('${pageContext.request.contextPath}/res/img/background/index.png');
        position:fixed;
        top: 0;
        left: 0;
        width:100%;
        height:100%;
        min-width: 1000px;
        z-index:-10;
        zoom: 1;
        background-color: #fff;
        background-repeat: no-repeat;
        background-size: cover;
        -webkit-background-size: cover;
        -o-background-size: cover;
        background-position: center 0;">
<div style="background-color: rgba(253,253,255,0.7);height:260px;width: 410px;position: fixed;right: 10%;bottom: 35%;">
    <form id="login_form" class="layui-form" action="loginCheck.do" method="post">
        <div class="layui-form-item" style="margin-top: 50px;">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input id="username" name="username" type="text" lay-verify="required" placeholder="请输入用户名"
                       class="layui-input" required style="width:265px;"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input id="password" type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input" style="width:265px;">
            </div>
        </div>
        <span id="errorMsg" style="margin-left: 135px;color: red;">${sessionScope.errorMsg}</span><br/>
        <button type="submit"
                style="background-color: #ffdd5b;height: 50px;width: 280px;font-size: 22px;margin-top: 15px;margin-left: 60px">
            登录
        </button>
    </form>
</div>
</body>
<script>
    window.onload = function ()//用window的onload事件，窗体加载完毕的时候
    {
        if (window.top != window) {
            window.top.location.href = window.location.href;
        }
        setTimeout(function () {
            window.document.getElementById("errorMsg").innerHTML = "";
        }, 3000);
    }
</script>
</html>
