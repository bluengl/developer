<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-13
  Time: 13:15
  To change this template use File | Settings | File Templates.
  人员管理：对人员信息的管理以及工作量汇总及绩效查看，包括人员信息录入、查找、考勤、负责项目、工作量汇总、绩效结算等功能。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人员管理</title>
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
                    <label class="layui-form-label">人员编号</label>
                    <div class="layui-input-block">
                        <input id="personId" type="text" name="title" placeholder="请输入人员编号"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <label class="layui-form-label">人员名</label>
                    <div class="layui-input-block">
                        <input id="personName" type="text" name="title" placeholder="请输入人员名"
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
    <div class="layui-card-header">人员信息</div>
    <div class="layui-card-body">
        <table id="personTable"
               lay-data="{
               id: 'personTable',
               url: 'getPersonData.do',
               page: true,
               limits: [6,12,24,50,70],
               limit: 6,
               height: 320,
               toolbar: '#toolbarPerson',
               defaultToolbar: ['filter', 'exports', 'print'],
               initSort: {field:'id', type:'asc'}}"
               class="layui-table" lay-size="sm" lay-filter="personTable_test">
            <thead>
            <tr>
                <th lay-data="{type: 'checkbox', width:'5%', fixed: 'left'}"></th>
                <th lay-data="{field:'id', width:'15%', sort: true}">人员编号</th>
                <th lay-data="{field:'name', width:'20%', sort: true}">人员名</th>
                <th lay-data="{field:'sex', width:'10%', sort: true}">性别</th>
                <th lay-data="{field:'position', width:'30%', sort: true}">职位</th>
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
<%--    <button class='layui-btn layui-btn-xs layui-btn-danger' lay-event="del">删除</button>--%>
</script>
<script type="text/html" id="toolbarPerson">
    <div id="toolbarItem" class="layui-btn-container">
        <button id="addItem" class="layui-btn layui-btn-sm" data-type="addItem">
            <i class="layui-icon layui-icon-addition"></i> 录入人员
        </button>
<%--        <button id="deleteAllItem" class="layui-btn layui-btn-sm layui-btn-danger" data-type="getCheckData">--%>
<%--            <i class="layui-icon layui-icon-subtraction"></i> 删除选项--%>
<%--        </button>--%>
<%--        <input id="personName1" type="text" name="title" placeholder="请输入人员名"/>--%>
    </div>
</script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element'], function () {
        var $ = layui.jquery,
            table = layui.table;
        var active = {
            addItem: function () {
                var html = "openNewWin.do";
                var index = layer.open({
                    type: 2,
                    title: '录入人员信息',
                    area: ['800px', '520px'],
                    offset: '1px',
                    btn: ['保存', '关闭'],
                    btn1: function (index, layero) {
                        var iframeWin = window[layero.find('iframe')[0]['name']];
                        iframeWin.savePersonInfo(this);
                    },
                    content: html,
                    end: function () {
                        reloadTableFunction();
                        bindTableToolbarFunction();
                    }
                });
            },
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('personTable')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            },
            reload: function () {
                var personId = $('#personId');
                var personName = $('#personName');

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
        table.on('tool(personTable_test)', function (obj) {
            var data = obj.data;
            switch (obj.event) {
                case 'del':
                    layer.confirm('是否确认删除?', {icon: 2, title: '提示'}, function (index) {
                        var index_loading = layer.load(2);
                        $.ajax({
                            url: "deletePersonItem.do",
                            data: "{\"personId\":\"" + data.id + "\"}",
                            dataType: "json",
                            type: "post",
                            success: function (data) {
                                layer.close(index_loading);
                                obj.del();
                            },
                            error: function (data) {
                                layer.close(index_loading);
                                layer.alert('删除失败', {icon: 2});
                            }
                        })
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
                        btn: ['关闭'],
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
            var personId = $('#personId');
            var personName = $('#personName');
            table.reload('personTable', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    'con_personId': personId.val(),
                    'con_personName': personName.val()
                }
            }, 'data');
        }

    });
</script>
</html>
