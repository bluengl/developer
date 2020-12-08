layui.define(['jquery', 'element', 'table', 'form'], function (exports) {
    var $ = layui.jquery,
        element = layui.element,
        table = layui.table,
        form = layui.form;
    console.debug("加载dataUtil模块");
    var obj = {
        init: function () {

        },
        // 绑定下拉框内容
        setSelectInputDataEmpty: function (targetId) {
            $("#" + targetId).empty();
            var html = "<option value=\"\"></option>";
            $(html).appendTo($("#" + targetId));
            form.render();
        },
        setSelectInputData: function (data, targetId) {
            $("#" + targetId).empty();
            var html = "<option value=\"\"></option>";
            var arr = new Array();
            for (var i = 0; i < data.length; i++) {
                arr[i] = new Array();
                for (var item in data[i]) {
                    if (item == "key") {
                        arr[i][0] = data[i][item];
                    } else if (item == "value") {
                        arr[i][1] = data[i][item];
                    }
                }
            }
            for (var j = 0; j < arr.length; j++) {
                html += "<option value=\"" + arr[j][0] + "\">" + arr[j][1] + "</option>";
            }
            $(html).appendTo($("#" + targetId));
            form.render();
        },
        // 设置input值
        setInputValue: function (value, targetId) {
            value = value == "null" ? "" : value;
            $("#" + targetId + "").attr("value", value);
        },
        // 设置下拉框值
        setSelectInputValue: function (value, targetId) {
            var targetObj = $("#" + targetId)[0];
            for (var i = 0; i < targetObj.length; i++) {
                if ($(targetObj[i]).attr("selected") == 'selected') {
                    $(targetObj[i]).removeAttr("selected");
                    break;
                }
            }
            for (var j = 0; j < targetObj.length; j++) {
                if (value == targetObj[j].value) {
                    targetObj[j].setAttribute("selected", "");
                    break;
                }
            }
            form.render();
        },
        setDataGridItem: function (tableId, data) {
            var theadChildren = $("#" + tableId).find("thead tr")[0].children;
            $($("#" + tableId).find("tbody tr")).remove();
            var html = "";
            var tbodyArr = new Array();
            for (var i = 0; i < theadChildren.length; i++) {
                tbodyArr[i] = new Array();
                tbodyArr[i][0] = theadChildren[i].id;
            }
            for (var j = 0; j < data.length; j++) {
                for (var item in data[j]) {
                    for (var k = 0; k < tbodyArr.length; k++) {
                        if (tbodyArr[k][0] == item) {
                            tbodyArr[k][1] = data[j][item];
                            break;
                        }
                    }
                }
                html += "<tr>"
                for (var i = 0; i < tbodyArr.length; i++) {
                    if (tbodyArr[i][1] != undefined)
                        html += "<td>" + tbodyArr[i][1] + "</td>";
                    else
                        html += "<td></td>";
                }
                html += "</tr>";
                for (var l = 0; l < tbodyArr.length - 1; l++) {
                    tbodyArr[l][1] = null;
                }
            }
            $(html).appendTo($("#" + tableId + "")[0].lastElementChild);
        },
        setDataGridFunc: function (tableId, funcName1, funcName2) {
            var tbody_tr = $("#" + tableId).find("tbody tr");
            for (var i = 0; i < tbody_tr.length; i++) {
                tbody_tr[i].lastElementChild.innerHTML = "<td>" +
                    "<button style='margin-left: 20px' class='layui-btn layui-btn-xs layui-btn-normal'onclick='" + funcName1 + "'>查看 </button>" +
                    "<button class='layui-btn layui-btn-xs layui-btn-danger' onclick='" + funcName2 + "'>删除</button>" +
                    "</td>";
            }
        },
        setDataGridFuncOnly: function (tableId, funcName1) {
            var tbody_tr = $("#" + tableId).find("tbody tr");
            for (var i = 0; i < tbody_tr.length; i++) {
                tbody_tr[i].lastElementChild.innerHTML = "<td>" +
                    "<button class='layui-btn layui-btn-xs layui-btn-danger' lay-event=\"del\" onclick='" + funcName1 + "'>删除</button>" +
                    "</td>";
            }
        },
        getDataGridItem: function (that, targetId) {
            var $ = layui.jquery;
            var thead_tr = $($(that).closest("table")[0]).find("thead tr")[0].children;
            var tbody_tr = $($(that).closest("table")[0]).find("tbody tr")[0].children;
            for (var i = 0; i < thead_tr.length - 1; i++) {
                if (targetId == thead_tr[i].id) {
                    return tbody_tr[i].textContent;
                }
            }
            console.error("id不匹配");
        },
        convertTableDataToJSON: function (tableId) {
            var $ = layui.jquery;
            var res;
            $('#' + tableId).each(function (index) {
                var head = new Array();
                var trow = "[";
                $(this).find("thead tr th").each(function (index) {
                    if (this.id != "")
                        head[index] = this.id;
                });
                $(this).find("tbody tr").each(function (index) {
                    var row = "[{";
                    $(this).find('td').each(function (index) {
                        if ($(this).text().trim() != "")
                            row += ('"' + head[index] + '":"' + $(this).text().trim() + '",');
                    });
                    row = row.substring(0, row.length - 1);
                    row += "}],";
                    trow += row;
                });
                if (trow.length > 1)
                    trow = trow.substring(0, trow.length - 1);
                trow += "]";
                res = trow;
            });
            return res;
        }
    }

    exports("dataUtil", obj);
})