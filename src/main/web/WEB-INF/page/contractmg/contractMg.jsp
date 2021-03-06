<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-13
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>合同管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/overLayui.css">
</head>
<body>
<%--查询区域--%>
<div class="layui-card">
    <div class="layui-card-header">查询条件</div>
    <div class="layui-card-body">
        <form id="con_form" class="layui-form" action="">
            <div class="layui-row layui-form-item">
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <label class="layui-form-label">合同编号</label>
                    <div class="layui-input-block">
                        <input id="contractId" type="text" name="contractId" placeholder="请输入合同编号"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <label class="layui-form-label">合同名称</label>
                    <div class="layui-input-block">
                        <input id="contractName" type="text" name="contractName" placeholder="请输入合同名称"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <div class="layui-input-block" style="margin-left: 60px">
                        <button type="button" class="layui-btn layui-btn-sm" data-type="reload">
                            <i class="layui-icon layui-icon-search"></i> 查询
                        </button>
                        <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">
                            <i class="layui-icon layui-icon-refresh"></i> 重置
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%--数据区域--%>
<div class="layui-card">
    <div class="layui-card-header">合同信息</div>
    <div class="layui-card-body">
        <table id="contractTable"
               lay-data="{
               id: 'contractTable',
               url: 'getContractData.do',
               page: true,
               limits: [6,12,24,50,70],
               limit: 6,
               height: 320,
               toolbar: '#toolbarContract',
               defaultToolbar: ['filter', 'exports', 'print'],
               initSort: {field:'id', type:'asc'}}"
               class="layui-table" lay-size="sm" lay-filter="contractTable_test">
            <thead>
            <tr>
                <th lay-data="{type: 'checkbox', width:'5%', fixed: 'left'}"></th>
                <th lay-data="{field:'id', width:'15%', sort: true}">合同编号</th>
                <th lay-data="{field:'name', width:'20%', sort: true}">合同名称</th>
                <th lay-data="{field:'status', width:'10%', sort: true}">合同状态</th>
                <th lay-data="{field:'project', width:'30%', sort: true}">所属工程</th>
                <th lay-data="{field:'op', width:'20%', toolbar: '#barDemo'}">执行操作</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

</body>
<script type="text/html" id="barDemo">
    <button style='margin-left: 20px' class='layui-btn layui-btn-xs' lay-event="detail">查看</button>
    <button class='layui-btn layui-btn-xs layui-btn-danger' lay-event="del">删除</button>
</script>
<script type="text/html" id="toolbarContract">
    <div id="toolbarItem" class="layui-btn-container">
        <button id="addItem" class="layui-btn layui-btn-sm" data-type="addItem">
            <i class="layui-icon layui-icon-addition"></i> 录入合同
        </button>
        <button id="activeItem" class="layui-btn layui-btn-sm" data-type="executeItem">
            <i class="layui-icon layui-icon-log"></i> 执行合同
        </button>
        <button id="finItem" class="layui-btn layui-btn-sm" data-type="finishItem">
            <i class="layui-icon layui-icon-ok"></i> 完成合同
        </button>
        <%--        <button id="deleteAllItem" class="layui-btn layui-btn-sm layui-btn-danger" data-type="getCheckData">--%>
        <%--            <i class="layui-icon layui-icon-subtraction"></i> 删除选项--%>
        <%--        </button>--%>
    </div>
</script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element', 'ajax'], function () {
        var $ = layui.jquery,
            table = layui.table,
            ajax = layui.ajax;
        var active = {
            addItem: function () {
                var html = "openNewWin.do";
                var index = layer.open({
                    type: 2,
                    title: '录入合同信息',
                    area: ['800px', '520px'],
                    offset: '1px',
                    btn: ['保存', '关闭'],
                    btn1: function (index, layero) {
                        var iframeWin = window[layero.find('iframe')[0]['name']];
                        iframeWin.saveContractInfo(this);
                    },
                    content: html,
                    end: function () {
                        reloadTableFunction();
                        bindTableToolbarFunction();
                    }
                });
            },
            executeItem: function () {

                var checkStatus = table.checkStatus('contractTable')
                    , data = checkStatus.data;
                console.debug(data)
                if (data.length == 0) {
                    layer.open({
                        title: '信息'
                        , content: '请选择执行合同'
                    });
                    return;
                }
                if (data.length == 2) {
                    layer.open({
                        title: '信息'
                        , content: '只能选择一项变更'
                    });
                    return;
                }
                if (data[0].status == "已完成") {
                    layer.open({
                        title: '信息'
                        , content: '该合同已完成'
                    });
                    return;
                }
                if (data[0].status == "执行中") {
                    layer.open({
                        title: '信息'
                        , content: '该合同正在执行'
                    });
                    return;
                }
                layer.confirm('是否确认执行?', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    var index_loading = layer.load(2);
                    ajax.submit("post", "executeContract.do", "{\"contractId\":\"" + data[0].id + "\"}", function (data1) {
                        console.debug(data1)
                        reloadTableFunction();
                        layer.close(index_loading);
                    })
                });
            },
            finishItem: function () {
                var checkStatus = table.checkStatus('contractTable')
                    , data = checkStatus.data;
                if (data.length == 0) {
                    layer.open({
                        title: '信息'
                        , content: '请选择执行合同'
                    });
                    return;
                }
                if (data.length == 2) {
                    layer.open({
                        title: '信息'
                        , content: '只能选择一项变更'
                    });
                    return;
                }
                if (data[0].status == "已完成") {
                    layer.open({
                        title: '信息'
                        , content: '该合同已完成'
                    });
                    return;
                }
                layer.confirm('是否确认完成?', {icon: 3, title: '提示'}, function (index) {
                    ajax.submit("post", "finishContract.do", "{\"contractId\":\"" + data[0].id + "\"}", function (data) {
                        reloadTableFunction();
                        layer.close(index);
                    })
                });
            },
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('contractTable')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            },
            reload: function () {
                var contractId = $('#contractId');
                var contractName = $('#contractName');

                //执行重载
                reloadTableFunction();
            }
        };

        //监听查询事件
        $('#con_form [type="button"]').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听toolbar事件
        bindTableToolbarFunction();

        //监听单元格事件
        table.on('tool(contractTable_test)', function (obj) {
            var data = obj.data;
            console.debug(data.id )
            switch (obj.event) {
                case 'del':
                    layer.confirm('是否确认删除?', {icon: 2, title: '提示'}, function (index) {
                        var index_loading = layer.load(2);
                        ajax.submit("post","deleteContract.do","{\"contractId\":\"" + data.id + "\"}",function (data) {
                            layer.close(index_loading);
                            obj.del();
                        })
                        // $.ajax({
                        //     url: "deleteContract.do",
                        //     data: "{\"contractId\":\"" + data.id + "\"}",
                        //     dataType: "json",
                        //     type: "post",
                        //     success: function (data) {
                        //         layer.close(index_loading);
                        //         obj.del();
                        //     },
                        //     error: function (data) {
                        //         layer.close(index_loading);
                        //         layer.alert('删除失败', {icon: 2});
                        //     }
                        // })
                        layer.close(index);
                    });
                    break;
                case 'detail':
                    var html = "openNewWin.do?id=" + data.id;
                    var index = layer.open({
                        type: 2,
                        title: '查看' + data.name + '的信息',
                        area: ['800px', '520px'],
                        offset: '1px',
                        btn: ['保存', '关闭'],
                        btn1: function (index, layero) {
                            var iframeWin = window[layero.find('iframe')[0]['name']];
                            iframeWin.saveContractInfo(this);
                        },
                        content: html,
                        end: function () {
                            reloadTableFunction();
                            bindTableToolbarFunction();
                        }
                    });
                    break;
                default:
                    break;
            }
        });

        function bindTableToolbarFunction() {
            //监听toolbar事件
            $('#toolbarItem button').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        }

        function reloadTableFunction() {
            //reload表格
            var contractId = $('#contractId');
            var contractName = $('#contractName');
            table.reload('contractTable', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    'con_contractId': contractId.val(),
                    'con_contractName': contractName.val()
                }
            }, 'data');
        }

    });
</script>
</html>
