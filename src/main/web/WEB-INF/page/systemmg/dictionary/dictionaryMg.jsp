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
    <div class="layui-card-header">数据项</div>
    <div class="layui-card-body">
        <form id="con_form" class="layui-form" action="" lay-filter="con_form">
            <div class="layui-row">
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-form-item">
                        <label class="layui-form-label">数据项</label>
                        <div class="layui-input-block">
                            <select id="selectType" name="type">
                                <option value="">请选择</option>
                                <option value="1">公司</option>
                                <option value="2">部门</option>
                                <option value="3">参建单位</option>
                                <option value="4">项目形象</option>
                                <option value="5">项目状态</option>
                                <option value="6">人员性别</option>
                                <option value="7">人员职务</option>
                                <option value="8">建设单位</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-input-block" style="margin-left: 60px">
                        <button type="button" class="layui-btn layui-btn-sm" data-type="reload">
                            <i class="layui-icon layui-icon-search"></i> 查询
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-card">
    <div class="layui-card-header">数据表格信息</div>
    <div class="layui-card-body">

        <table id="dicTable"
               lay-data="{
               id: 'dicTable',
               url: 'getDicData.do',
               height: 320,
               toolbar: '#toolbarDic',
               initSort: {field:'id', type:'asc'}}"
               class="layui-table" lay-size="sm" lay-filter="dicTable_test">
            <thead>
            <tr>
                <th lay-data="{field:'id', width:'15%', sort: true, edit: 'text'}">ID</th>
                <th lay-data="{field:'name',edit: 'text'}">名称</th>
                <th lay-data="{field:'desc',edit: 'text'}">描述</th>
                <th lay-data="{field:'op', width:'20%', toolbar: '#barDemo'}">执行操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

</body>
<script type="text/html" id="barDemo">
    <button class='layui-btn layui-btn-xs layui-btn-danger' lay-event="del">删除</button>
</script>
<script type="text/html" id="toolbarDic">
    <div id="toolbarItem" class="layui-btn-container">
        <button id="saveItem" class="layui-btn layui-btn-sm" data-type="saveItem" onclick="fnTest1()">
            保存
        </button>
    </div>
</script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element', 'form'], function () {
        var $ = layui.jquery,
            table = layui.table,
            form = layui.form;

        var active = {
            saveItem: function () {
                // var data = form.val('con_form');
                // if (data.type == "") {
                //     layer.alert("请选择查询数据项");
                //     return;
                // }
                // var tableData = table.cache.dicTable;
                // console.debug(tableData);
            },
            reload: function () {
                reloadTableFunction();
            }
        }

        //监听单元格编辑
        table.on('edit(dicTable_test)', function (obj) {
            var data = form.val('con_form');
            if (data.type == "") {
                layer.msg("请选择查询数据项");
                return;
            }
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
        });
        table.on('tool(dicTable_test)', function (obj) {
            var data = obj.data;
            var data1 = form.val('con_form');
            console.debug(data);
            var paramArr = JSON.parse("{\"id\":\"" + data.id + "\",\"type\":\"" + data1.type + "\"}");
            switch (obj.event) {
                case 'del':
                    if (data.id == "" && data.name == "" && data.desc == "") {
                        layer.alert("该行不能删除！");
                        break;
                    }
                    layer.confirm('是否确认删除?', {icon: 2, title: '提示'}, function (index) {

                        $.post("deleteDicItem.do", paramArr, function (data) {
                            if ("timeout" == data.msg) {
                                location.href = "/designer/index.jsp";
                            } else if ("false" == data.msg) {
                                layer.alert('删除失败', {icon: 2});
                            } else {
                                layer.alert('删除成功', {icon: 1});
                            }
                        })
                        layer.close(index);
                        obj.del();
                    });
                    break;
                default:
                    break;
            }
        });

        $('#con_form [type="button"]').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听toolbar事件
        $('#toolbarItem button').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        function reloadTableFunction() {
            //reload表格
            var data = form.val('con_form');
            table.reload('dicTable', {
                where: {
                    'type': data.type
                }
            }, 'data');
        }
    })

    function fnTest1() {
        var form = layui.form,
            table = layui.table,
            $ = layui.jquery;
        var data = form.val('con_form');
        if (data.type == "") {
            layer.alert("请选择查询数据项");
            return;
        }
        var tableData = table.cache.dicTable;
        // console.debug(tableData);
        var paramArr = JSON.parse("{\"table\":\"\",\"type\":\"" + data.type + "\"}")
        paramArr.table = JSON.stringify(tableData);
        // console.debug(paramArr);
        $.post("saveDicInfo.do", paramArr, function (data) {
            if ("timeout" == data.msg) {
                location.href = "/designer/index.jsp";
            } else if ("false" == data.msg) {
                layer.alert('保存失败', {icon: 2});
            } else {
                layer.alert('保存成功', {icon: 1});
            }
        })
    }

</script>
</html>
