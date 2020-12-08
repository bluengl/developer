var dataUtil;
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use(['element', 'jquery', 'form', 'laydate', 'dataUtil', 'ajax', 'form', 'table'], function () {
    var element = layui.element,
        layer = layui.layer,
        form = layui.form,
        laydate = layui.laydate,
        $ = layui.jquery,
        ajax = layui.ajax,
        form = layui.form,
        table = layui.table;
    dataUtil = layui.dataUtil;
    form.render();
    laydate.render({
        elem: '#startTime',
        trigger: 'click', //采用click弹出
        theme: '#409d9e',
        done: function (value, date, endDate) {
            $('#startTime').change();
        }
    });
    laydate.render({
        elem: '#endTime',
        trigger: 'click', //采用click弹出
        theme: '#409d9e',
        done: function (value, date, endDate) {
            $('#endTime').change();
        }
    });
});

function fnTest5(that) {
    var $ = layui.jquery,
        ajax = layui.ajax,
        dataUtil = layui.dataUtil;
    var provinceId = $(that).attr("lay-value");
    console.debug(provinceId);
    ajax.submit("post", "getSelectCity.do", '{"provinceId":"' + provinceId + '"}', function (data) {
        dataUtil.setSelectInputData(data, "selectCity");
    })
}

function fnTest6(that) {
    var $ = layui.jquery,
        ajax = layui.ajax,
        dataUtil = layui.dataUtil;
    var cityId = $(that).attr("lay-value");
    ajax.submit("post", "getSelectCounty.do", '{"cityId":"' + cityId + '"}', function (data) {
        dataUtil.setSelectInputData(data, "selectCounty");
    })
}

function fnTest7(that) {
    var $ = layui.jquery,
        table = layui.table,
        form = layui.form;
    var unitId = $("#selectAddUnit")[0].value;
    var unitNameArr = $("#selectAddUnit")[0];
    var unitRemark = $("#Add_Remark")[0].value;
    var unitDescription = $("#Add_Unitdes")[0].value;
    var unitName = "";
    for (var i = 0; i < unitNameArr.length; i++) {
        if (unitNameArr[i].value == unitId) {
            unitName = unitNameArr[i].textContent;
            break;
        }
    }
    if (unitName == "请选择")
        return;
    var realSelectArr = $($("#selectAddUnit")[0]).find("option");
    for (var j = 0; j < realSelectArr.length; j++) {
        if (realSelectArr[j].value == unitId) {
            $(realSelectArr[j]).remove();
            form.render();
        }
    }
    var html = "<tr><td>" + unitId + "</td><td>" + unitName + "</td><td>" + unitDescription + "</td><td>" + unitRemark + "</td><td></td></tr>";
    $(html).appendTo($("#dataGridUnit tbody")[0]);
    table.init('dataGridUnit_test', {
        height: 165,
        limit: 3,
        page: true
    });
}

function fnTest8(that) {
    var $ = layui.jquery,
        table = layui.table,
        form = layui.form;
    var userId = $("#selectAddUser")[0].value;
    var userNameArr = $("#selectAddUser")[0];
    var userRemark = $("#Add_UserRemark")[0].value;
    var userDescription = $("#Add_UserDes")[0].value;
    var userName = "";
    for (var i = 0; i < userNameArr.length; i++) {
        if (userNameArr[i].value == userId) {
            userName = userNameArr[i].textContent;
            break;
        }
    }
    if (userName == "请选择")
        return;
    var realSelectArr = $($("#selectAddUser")[0]).find("option");
    for (var j = 0; j < realSelectArr.length; j++) {
        if (realSelectArr[j].value == userId) {
            $(realSelectArr[j]).remove();
            form.render();
            break;
        }
    }
    var html = "<tr><td>" + userId + "</td><td>" + userName + "</td><td>" + userDescription + "</td><td>" + userRemark + "</td><td></td></tr>";
    $(html).appendTo($("#dataGridUser tbody")[0]);
    table.init('dataGridUser_test', {
        height: 165,
        limit: 3,
        page: true
    });
}
