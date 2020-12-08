<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工程项目管理信息系统</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" href="res/css/index.css">
    <style>
        body{
            max-width: 100%;
            overflow: auto;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div class="layui-logo"><i class="layui-icon layui-icon-template"></i> 工程项目管理信息系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-diamond"></i> ${sessionScope.userInfo.realUsername}
                </a>
                <%--                <span class="layui-badge-dot"></span>--%>
                <%--                <dl class="layui-nav-child">--%>
                <%--                    <dd>--%>
                <%--                        <a href="">个人中心</a>--%>
                <%--                    </dd>--%>
                <%--                    <dd>--%>
                <%--                        <a href="">安全设置</a>--%>
                <%--                    </dd>--%>
                <%--                    <dd>--%>
                <%--                        <a href="">消息通知<span class="layui-badge">9</span></a>--%>
                <%--                    </dd>--%>
                <%--                </dl>--%>
            </li>
            <li class="layui-nav-item"><a href="logout.do">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <div class="kit-side-fold"><a href="javascript:;"><i class="layui-icon layui-icon-prev"
                                                                     style="color: #86ffc7"></i></a></div>
                <%--                <li class="layui-nav-item"><a href="javascript:;" class="site-url"--%>
                <%--                                              data-options='{"url":"myWork.do","title":"我的工作","id":"2"}'>--%>
                <%--                    <i class="layui-icon layui-icon-form"></i> <span>我的工作</span></a>--%>
                <%--                </li>--%>
                <li class="layui-nav-item" id="project">
                    <a href="javascript:;" class="site-url"
                       data-options='{"url":"projectMg/execute.do","title":"项目管理","id":"3"}'>
                        <i class="layui-icon layui-icon-app"></i> <span>项目管理</span></a>
                </li>
                <li id="person" class="layui-nav-item"><a href="javascript:;" class="site-url"
                                                          data-options='{"url":"personMg/execute.do","title":"人员管理","id":"4"}'>
                    <i class="layui-icon layui-icon-user"></i> <span>人员管理</span></a>
                </li>
                <li id="contract" class="layui-nav-item"><a href="javascript:;" class="site-url"
                                                            data-options='{"url":"contractMg/execute.do","title":"合同管理","id":"5"}'>
                    <i class="layui-icon layui-icon-tabs"></i> <span>合同管理</span></a>
                </li>
                <li id="system" class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-set"></i> <span>系统管理</span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" class="site-url"
                               data-options='{"url":"systemMg/dictionaryMg/execute.do","title":"字典管理","id":"6"}'>
                                <i class="layui-icon layui-icon-file"></i> <span>字典管理</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="site-url"
                               data-options='{"url":"systemMg/userMg/execute.do","title":"用户管理","id":"7"}'>
                                <i class="layui-icon layui-icon-friends"></i> <span>用户管理</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="site-url"
                               data-options='{"url":"systemMg/limitsMg/execute.do","title":"权限管理","id":"8"}'>
                                <i class="layui-icon layui-icon-auz"></i> <span>权限管理</span></a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!--   主体区域    -->
        <div class="layui-tab layui-tab-brief" lay-filter="contentnav" lay-allowClose="true"
             style="margin-left:0px;margin-top:0;">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1" id="indexTab"><i class="layui-icon layui-icon-home"></i> 首页</li>
            </ul>
            <ul class="layui-bg-green rightmenu" style="display: none;position: absolute;">
                <button type="button" class="layui-btn" data-type="refreshThis">刷新当前</button>
                <br/>
                <button type="button" class="layui-btn" data-type="closeThis">关闭当前</button>
                <br/>
                <button type="button" class="layui-btn" data-type="closeOther">关闭其它</button>
                <br/>
                <button type="button" class="layui-btn" data-type="closeAll">关闭所有</button>
            </ul>
            <div class="layui-tab-content" style="padding:0;">
                <%--                <div style="padding: 15px;"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-icon-loading"></i> 请稍等...</div>--%>
                <div class="layui-tab-item layui-show">
                    <iframe src="homePage.do" frameborder="0" scrolling="auto" height="100%"
                            width="100%"></iframe>
                </div>
            </div>
        </div>
    </div>

    <%--    <div class="layui-footer">--%>
    <%--        <!-- 底部固定区域 -->--%>
    <%--        © test - 底部固定区域--%>
    <%--    </div>--%>

</div>
<script src="plugins/layui/layui.js" charset="UTF-8"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    // 模块化
    var message;
    layui.use(['tab', 'navTree', 'msg', 'win'], function () {
        var tab = layui.tab,
            navTree = layui.navTree,
            msg = layui.msg,
            $ = layui.jquery;
        if ("'${limitList}'" != "''") {
            if ("${limitList.project}" == "0") {
                $("#project").hide()
            }
            if ("${limitList.person}" == "0") {
                $("#person").hide()
            }
            if ("${limitList.contract}" == "0") {
                $("#contract").hide()
            }
            if ("${limitList.system}" == "0") {
                $("#system").hide()
            }
        }
    });
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
    window.onload = function () {
    }
</script>
</body>
</html>
