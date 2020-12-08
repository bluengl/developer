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
    <div class="layui-card-header">查询条件</div>
    <div class="layui-card-body">
        <form id="con_form" class="layui-form" action="">
            <div class="layui-row layui-form-item">
                <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input id="username" type="text" name="con_username" placeholder="请输入用户名"
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

<div class="layui-card">
    <div class="layui-card-header">用户信息</div>
    <div class="layui-card-body">
        <table id="userTable"
               lay-data="{
               id: 'userTable',
               url: 'getUserData.do',
               page: true,
               limits: [6,12,24,50,70],
               limit: 6,
               height: 320,
               toolbar: '#toolbarPerson',
               defaultToolbar: ['filter', 'exports', 'print'],
               initSort: {field:'id', type:'asc'}}"
               class="layui-table" lay-size="sm" lay-filter="userTable_test">
            <thead>
            <tr>
                <th lay-data="{type: 'checkbox', width:'5%', fixed: 'left'}"></th>
                <th lay-data="{field:'id', width:'15%', sort: true}">用户编号</th>
                <th lay-data="{field:'name'}">用户名</th>
                <th lay-data="{field:'username'}">人员名</th>
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
<script type="text/html" id="toolbarPerson">
    <div id="toolbarItem" class="layui-btn-container">
        <button id="addItem" class="layui-btn layui-btn-sm" data-type="addItem">
            <i class="layui-icon layui-icon-addition"></i> 录入用户
        </button>
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
                    title: '录入用户信息',
                    area: ['800px', '520px'],
                    offset: '1px',
                    btn: ['保存', '关闭'],
                    btn1: function (index, layero) {
                        var iframeWin = window[layero.find('iframe')[0]['name']];
                        iframeWin.saveUserInfo(this);
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
        table.on('tool(userTable_test)', function (obj) {
            var data = obj.data;
            console.debug(data);
            switch (obj.event) {
                case 'del':
                    layer.confirm('是否确认删除?', {icon: 2, title: '提示'}, function (index) {
                        layer.close(index);
                        var index_loading = layer.load(2);
                        ajax.submit("post","deleteUserItem.do","{\"userId\":\"" + data.id + "\"}",function (data) {
                            layer.close(index_loading);
                            obj.del();
                        })
                        // $.ajax({
                        //     url: "deleteUserItem.do",
                        //     data: "{\"userId\":\"" + data.id + "\"}",
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
                    });
                    break;
                case 'detail':
                    var html = "openNewWin.do?userId=" + data.id;
                    var index = layer.open({
                        type: 2,
                        title: '查看' + data.name + '的信息',
                        area: ['800px', '520px'],
                        offset: '1px',
                        btn: ['保存', '关闭'],
                        btn1: function (index, layero) {
                            var iframeWin = window[layero.find('iframe')[0]['name']];
                            iframeWin.saveUserInfo(this);
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
            var username = $('#username');
            table.reload('userTable', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    'con_username': username.val()
                }
            }, 'data');
        }

    });
</script>
</html>
