<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-04-17
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/overLayui.css">
</head>
<body>

<form lay-filter="userForm" class="layui-form layui-tab" action="">

    <div class="layui-container">
        <div class="layui-row layui-form-item">
            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                <label class="layui-form-label" style="color: #ff6b55">用户编号</label>
                <div class="layui-input-block">
                    <input id="userId" type="text" name="id" readonly
                           autocomplete="off" class="layui-input" value="${userId}">
                </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                <label class="layui-form-label" style="color: #e37566;">用户名</label>
                <div class="layui-input-block">
                    <input type="text" id="username" name="username" lay-verify="required" placeholder="请输入用户名"
                           autocomplete="off" class="layui-input" value="">
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                <label class="layui-form-label">关联人员</label>
                <div class="layui-input-block">
                    <select id="selectPerson" name="person">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                <label class="layui-form-label">初始角色</label>
                <div class="layui-input-block">
                    <select id="selectRole" name="role">
                        <option value=""></option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-form-item layui-col-xs6 layui-col-sm6 layui-col-md6">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block" style="font-size: 12px">
                    <input id="password" type="text" name="password" lay-verify="required" placeholder="请输入密码"
                           autocomplete="off" class="layui-input" value="">
                    <input hidden="hidden" value="1" id="type" name="type">
                </div>
            </div>
        </div>

    </div>

</form>

</body>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element', 'dataUtil', 'ajax', 'laydate'], function () {
        var $ = layui.jquery,
            dataUtil = layui.dataUtil,
            ajax = layui.ajax,
            form = layui.form,
            laydate = layui.laydate;
        form.render();
        $("#userId").attr("style", "background-color: #e3e3e3;color: #b7b7b7;cursor: not-allowed !important;");

        dataUtil.setSelectInputData(${selectPerson}, "selectPerson");
        dataUtil.setSelectInputData(${selectRole}, "selectRole");
        if ("'${userId}'" != "''") {
            $("#type")[0].value = "2";
            form.val("userForm", {
                "username": "${userInfo.username}",
                "person": "${userInfo.person}",
                "role": "${userInfo.role}",
                "password": "${userInfo.password}"
            });
        }

    });

    function saveUserInfo(that) {
        var form = layui.form,
            $ = layui.jquery;
        var data = form.val('userForm');
        console.debug(data);
        var param = JSON.stringify(data);
        if ($("#username")[0].value == "") {
            layer.tips('用户名不能为空', '#username');
            return;
        }
        if (data.password == "")
            data.password = "1";
        if (data.person == "")
            data.person = "ry20191228";
        if (data.role == "")
            data.role = "0";
        console.debug(data);
        layer.confirm('是否保存?', {icon: 3, title: '提示'}, function (index) {
            layer.close(index);
            var index_loading = layer.load(2);
            $.ajax({
                data: data,
                url: "saveUserInfo.do",
                type: "get",
                success: function (data) {
                    try {
                        if ("timeout" == data.msg)
                            location.href = "/designer/index.jsp";
                    } catch (e) {
                    }
                    layer.close(index_loading);
                    layer.alert('保存成功', {icon: 1});
                },
                error: function (data) {
                    layer.close(index_loading);
                    layer.alert('保存失败', {icon: 2});
                }
            });
        });
    }
</script>
</html>
