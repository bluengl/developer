var win;
layui.use(['win', 'table', 'dataUtil', 'form', 'ajax', 'table'], function () {
    var $ = layui.jquery,
        table = layui.table,
        dataUtil = layui.dataUtil,
        form = layui.form,
        ajax = layui.ajax,
        table = layui.table;
    win = layui.win;
    ajax.submit("post", "getSelectComp.do", null, function (data) {
        dataUtil.setSelectInputData(data, "con_selectComp");
    });
    ajax.submit("post", "selectProjectItem.do", null, function (data) {
        dataUtil.setDataGridItem("project_detail", data);
        // dataUtil.setDataGridFunc("project_detail", "test(this)", "test3(this)");
        table.init('project_detail_test', {
            height: 300,
            limit: 4,
            page: true,
            toolbar: '#toolbarDemo',//开启头部工具栏，并为其绑定左侧模板
            defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '项目基本信息'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
        });
    });
    table.on('tool(project_detail_test)', function (obj) {
        var data = obj.data;
        if (obj.event == "del") {
            layer.confirm('是否删除该行？', function (index) {
                ajax.submit("post", "deleteProjectItem.do", '{"projectId":"' + data.id + '"}', function (data) {

                });
                obj.del();
                layer.close(index);
            });
        } else if (obj.event == "edit") {
            win.openNewWin("项目信息", "openNewWin.do", '{"id":"' + data.id + '"}', "520px", "800px");
        }
    });
    // dataUtil.setSelectInputFunc("selectInput1", "test3(this)");

})

function test(that) {
    var $ = layui.jquery;
    var id = $(that).closest("tr")[0].children[0].textContent;
    win.openNewWin("项目信息", "openNewWin.do", '{"id":"' + id + '"}', "520px", "800px");
}

function test2() {
    var $ = layui.jquery;
    win.openNewWin("新增项目信息", "openNewWin.do", "null", "520px", "800px");
}

function test3(that) {
    $ = layui.jquery;
    console.debug(that);
    // $(that).attr("style", "display:none");
}

function fnFind() {
    var $ = layui.jquery,
        ajax = layui.ajax,
        dataUtil = layui.dataUtil,
        table = layui.table;
    var projectName = $("#con_projectName")[0].value;
    var selectComp = $("#con_selectComp")[0].nextElementSibling.children[1].children;
    var username = $("#con_username")[0].value;
    var unitName = "";
    for (var i = 1; i < selectComp.length; i++) {
        if ("layui-this" == selectComp[i].getAttribute("class")) {
            unitName = selectComp[i].getAttribute("lay-value");
            break;
        }
    }
    ajax.submit("post", "queryByCon.do", '{"projectName":"' + projectName + '", "selectComp":"' + unitName + '", "username":"' + username + '"}', function (data) {
        if ("timeout" == data.msg) {
            location.href = "/designer/index.jsp";
        }
        dataUtil.setDataGridItem("project_detail", data);
        table.init('project_detail_test', {
            height: 300,
            limit: 4,
            page: true,
            toolbar: '#toolbarDemo',//开启头部工具栏，并为其绑定左侧模板
            defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '项目基本信息'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
        });
    })
}
