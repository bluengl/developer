<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-04-20
  Time: 10:37
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

<div class="layui-card">
    <div class="layui-card-header">角色信息</div>
    <div class="layui-card-body">
        <button id="addItem2" class="layui-btn layui-btn-sm" data-type="addItem" onclick="fnTest1()">
            添加
        </button>
        <button id="addItem11" class="layui-btn layui-btn-sm" data-type="addItem" onclick="fnTest2()">
            保存
        </button>
        <table id="roleTable"
               lay-data="{
               id: 'roleTable',
               url:'getRoleData.do',
               height: 200,
               initSort: {field:'id', type:'asc'}}"
               class="layui-table" lay-size="sm" lay-filter="roleTable_test">
            <thead>
            <tr>
                <th lay-data="{field:'id', width:100, edit: 'text'}" rowspan="2">编号</th>
                <th lay-data="{field:'name', width:160, sort:true , edit: 'text'}" rowspan="2">名称</th>
                <th lay-data="{field:'desc',width:200,edit: 'text'}" rowspan="2">描述</th>
                <th lay-data="{align:'center'}" colspan="4">菜单列表(0关闭，1开启)</th>
                <th lay-data="{field:'op',toolbar: '#barDemo'}" rowspan="2">操作</th>
            </tr>
            <tr>
                <th lay-data="{field:'project',edit: 'text'}">项目管理</th>
                <th lay-data="{field:'person',edit: 'text'}">人员管理</th>
                <th lay-data="{field:'contract', edit: 'text'}">合同管理</th>
                <th lay-data="{field:'system', edit: 'text'}">系统管理</th>
            </tr>
            </thead>
            <tbody>
            </tbody>

        </table>
    </div>
</div>

<div class="layui-card">
    <div class="layui-card-header">用户授权信息</div>
    <div class="layui-card-body">
        <form id="con_form" class="layui-form" action="" lay-filter="con_form">
            <div class="layui-row">
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户</label>
                        <div class="layui-input-block">
                            <select id="selectLoginUser" name="loginUser">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-form-item">
                        <label class="layui-form-label">角色</label>
                        <div class="layui-input-block">
                            <select id="selectRole" name="selectRole">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-input-block" style="margin-left: 60px">
                        <button type="button" class="layui-btn layui-btn-sm" onclick="fnTest3()">
                            刷新角色
                        </button>
                        <button type="button" class="layui-btn layui-btn-sm" onclick="fnTest4()">
                            查询
                        </button>
                        <button type="button" class="layui-btn layui-btn-sm" onclick="fnTest5()">
                            保存
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
<script type="text/html" id="barDemo">
    <button class='layui-btn layui-btn-xs layui-btn-danger' lay-event="del">删除</button>
</script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element', 'transfer', 'layer', 'util', 'dataUtil'], function () {
        var $ = layui.jquery,
            table = layui.table,
            transfer = layui.transfer,
            layer = layui.layer,
            util = layui.util,
            dataUtil = layui.dataUtil;

        dataUtil.setSelectInputData(${selectLoginUser}, "selectLoginUser");
        dataUtil.setSelectInputData(${selectRole}, "selectRole");

        table.on('tool(roleTable_test)', function (obj) {
            var data = obj.data;
            switch (obj.event) {
                case 'del':
                    layer.confirm('是否确认删除?', {icon: 2, title: '提示'}, function (index) {
                        $.post("deleteRoleItem.do", "{\"id\":\"" + data.id + "\"}", function (data) {
                                if ("timeout" == data.msg) {
                                    location.href = "/designer/index.jsp";
                                } else if ("false" == data.msg) {
                                    layer.alert('删除失败', {icon: 2});
                                } else {
                                    layer.alert('删除成功', {icon: 1});
                                    obj.del();
                                }
                            }
                        )
                        layer.close(index);
                    });
                    break;
                default:
                    break;
            }
        });


        var data1 = [
            {"value": "1", "title": "ADMIN"}
            , {"value": "2", "title": "USER"}
        ];

    })

    function fnTest1() {
        var table = layui.table,
            $ = layui.jquery;
        table.reload("roleTable", {
            where: {
                extra: 'true'
            }
        })
    }

    function fnTest2() {
        var table = layui.table,
            $ = layui.jquery;
        var tableData = table.cache.roleTable;
        for (var i = 0; i < tableData.length; i++) {
            if (tableData[i].id == undefined || tableData[i].id == "") {
                layer.alert("第" + (i + 1) + "行编号不能为空");
                return;
            }
            if (tableData[i].name == undefined || tableData[i].name == "") {
                layer.alert("第" + (i + 1) + "行名称不能为空");
                return;
            }
            if (tableData[i].project == undefined || tableData[i].project == "") {
                layer.alert("第" + (i + 1) + "行项目管理不能为空");
                return;
            }
            if (tableData[i].person == undefined || tableData[i].person == "") {
                layer.alert("第" + (i + 1) + "行人员管理不能为空");
                return;
            }
            if (tableData[i].contract == undefined || tableData[i].contract == "") {
                layer.alert("第" + (i + 1) + "行合同管理不能为空");
                return;
            }
            if (tableData[i].system == undefined || tableData[i].system == "") {
                layer.alert("第" + (i + 1) + "行系统管理不能为空");
                return;
            }
        }
        var index_loading = layer.load(2);

        var paramArr = JSON.parse("{\"table\":\"\"}")

        paramArr.table = JSON.stringify(tableData);

        $.post("saveRoleData.do", paramArr, function (data) {
            console.debug(data)
            if ("timeout" == data.msg) {
                location.href = "/designer/index.jsp";
            } else if ("false" == data.msg) {
                layer.msg('保存失败');
            } else {
                layer.msg('保存成功');
            }
            layer.close(index_loading);
        });

    }

    function fnTest3() {
        var $ = layui.jquery,
            dataUtil = layui.dataUtil;
        $.post("refreshSelectRole.do", "", function (data) {
            if ("timeout" == data.msg) {
                location.href = "/designer/index.jsp";
            } else {
                dataUtil.setSelectInputData(JSON.parse(data), "selectRole");
                layer.msg("已刷新");
            }
        })
    }

    function fnTest4() {
        var $ = layui.jquery,
            dataUtil = layui.dataUtil,
            form = layui.form;
        var data = form.val('con_form');
        if ("" == data.loginUser) {
            layer.alert("请先选择用户")
            return;
        }
        var paramArr = JSON.parse("{\"userId\":\"" + data.loginUser + "\"}");
        $.post("querySelectRole.do", paramArr, function (data) {
            if ("timeout" == data.msg) {
                location.href = "/designer/index.jsp";
            } else {
                form.val("con_form", {
                    "selectRole": data
                });
                layer.msg("查询完成");
            }
        })
    }

    function fnTest5() {
        var $ = layui.jquery,
            dataUtil = layui.dataUtil,
            form = layui.form;
        var data = form.val('con_form');
        if ("" == data.loginUser) {
            layer.alert("请先选择用户")
            return;
        }
        if ("" == data.selectRole) {
            data.selectRole = 0;
        }
        var paramArr = JSON.parse("{\"loginUserId\":\"" + data.loginUser + "\",\"roleId\":\"" + data.selectRole + "\"}");
        $.post("saveUserRole.do", paramArr, function (data) {
            console.debug(data);
            if ("timeout" == data.msg) {
                location.href = "/designer/index.jsp";
            } else {
                layer.msg("保存成功");
            }
        })
    }

</script>
</html>
