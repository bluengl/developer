<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-19
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = null;
    String projectView = null;
    Integer type = (Integer) request.getAttribute("type");
    if (type == 2) {
        id = (String) request.getAttribute("projectId");
        projectView = request.getAttribute("projectView").toString();
    }
    String dataCity = (String) request.getAttribute("projectDetail_City");
    String dataCounty = (String) request.getAttribute("projectDetail_County");

%>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    var delArr = new Array();
    window.onload = function () {
        layui.use(['element', 'jquery', 'form', 'dataUtil'], function () {
            var $ = layui.jquery,
                form = layui.form,
                dataUtil = layui.dataUtil,
                table = layui.table;
            dataUtil.setSelectInputData(${projectView}, "testSelect2");
            dataUtil.setSelectInputData(${projectStatus}, "testSelect1");
            dataUtil.setSelectInputData(${projectProvince}, "selectProvince");
            dataUtil.setSelectInputData(${projectPrincipal}, "selectPrincipal");
            dataUtil.setSelectInputData(${projectBuildToUnit}, "selectBuildToUnit");
            dataUtil.setSelectInputData(${selectCanAddUnit}, "selectAddUnit");
            dataUtil.setSelectInputData(${selectCanAddUser}, "selectAddUser");
            form.render();
            table.init('dataGridUnit_test', {
                height: 172,
                limit: 3,
                page: true
            });
            table.init('dataGridUser_test', {
                height: 172,
                limit: 3,
                page: true
            });
            if ("<%=id%>" != "null") {
                $("#testId").attr("readonly", "");
                $("#testId").attr("style", "background-color: #e3e3e3;color: #b7b7b7;");
                dataUtil.setDataGridItem("dataGridUnit", ${projectParticipantUnit});
                table.init('dataGridUnit_test', {
                    height: 172,
                    limit: 3,
                    page: true
                });
                dataUtil.setDataGridItem("dataGridUser", ${projectParticipantUser});
                table.init('dataGridUser_test', {
                    height: 172,
                    limit: 3,
                    page: true
                });
                dataUtil.setSelectInputValue("${projectDetail.view}", "testSelect2");
                dataUtil.setSelectInputValue("${projectDetail.status}", "testSelect1");
                dataUtil.setSelectInputValue("${projectDetail.principalId}", "selectPrincipal");
                dataUtil.setSelectInputValue("${projectDetail.buildToUnitId}", "selectBuildToUnit");
                dataUtil.setSelectInputData(<%=dataCity%>, "selectCity");
                dataUtil.setSelectInputData(<%=dataCounty%>, "selectCounty");
                dataUtil.setSelectInputValue("${projectDetail_ProvinceId}", "selectProvince");
                dataUtil.setSelectInputValue("${projectDetail_CityId}", "selectCity");
                dataUtil.setSelectInputValue("${projectDetail_CountyId}", "selectCounty");
            }
            form.render();
            form.on('select(selectProvince)', function (data) {
                var $ = layui.jquery,
                    ajax = layui.ajax,
                    dataUtil = layui.dataUtil;
                if (data.value == "") {
                    dataUtil.setSelectInputDataEmpty("selectCity");
                    dataUtil.setSelectInputDataEmpty("selectCounty");
                    return;
                }
                ajax.submit("post", "getSelectCity.do", '{"provinceId":"' + data.value + '"}', function (data) {
                    dataUtil.setSelectInputData(data, "selectCity");
                    dataUtil.setSelectInputDataEmpty("selectCounty");
                })
            });
            form.on('select(selectCity)', function (data) {
                var $ = layui.jquery,
                    ajax = layui.ajax,
                    dataUtil = layui.dataUtil;
                if (data.value == "") {
                    dataUtil.setSelectInputDataEmpty("selectCounty");
                    return;
                }
                ajax.submit("post", "getSelectCounty.do", '{"cityId":"' + data.value + '"}', function (data) {
                    dataUtil.setSelectInputData(data, "selectCounty");
                })
            });
            table.on('tool(dataGridUnit_test)', function (obj) {
                var data = obj.data;
                if (obj.event == 'setUnitDescription') {
                    layer.prompt({
                        formType: 2,
                        value: data.unitDescription,
                        title: "修改 " + data.unitName + " 描述"
                    }, function (value, index, elem) {
                        layer.close(index);
                        // 保存内容
                        var remarkIndex;
                        var idIndex;
                        $("#dataGridUnit").each(function (index) {
                            $(this).find("thead tr th").each(function (index) {
                                if (this.id == "unitDescription")
                                    remarkIndex = index;
                                if (this.id == "unitId")
                                    idIndex = index;
                            });
                            $(this).find("tbody tr").each(function (index) {
                                if (this.children[idIndex].textContent == data.unitId)
                                    this.children[remarkIndex].innerText = value;
                            });
                        });
                        obj.update({
                            unitDescription: value
                        });
                    });
                }
                if (obj.event == 'setUnitRemark') {
                    layer.prompt({
                        formType: 2,
                        value: data.unitRemark,
                        title: "修改 " + data.unitName + " 备注"
                    }, function (value, index, elem) {
                        layer.close(index);
                        // 保存内容
                        var remarkIndex;
                        var idIndex;
                        $("#dataGridUnit").each(function (index) {
                            $(this).find("thead tr th").each(function (index) {
                                if (this.id == "unitRemark")
                                    remarkIndex = index;
                                if (this.id == "unitId")
                                    idIndex = index;
                            });
                            $(this).find("tbody tr").each(function (index) {
                                if (this.children[idIndex].textContent == data.unitId)
                                    this.children[remarkIndex].innerText = value;
                            });
                        });
                        obj.update({
                            unitRemark: value
                        });
                    });
                }
                if (obj.event == "unitDel") {
                    layer.confirm('是否删除该行？', {icon: 3, title: '提示'}, function (index) {
                        var tbodyArr = $("#dataGridUnit tbody")[0].children;
                        for (var i = 0; i < tbodyArr.length; i++) {
                            if (tbodyArr[i].firstChild.textContent == data.unitId) {
                                var param = '[{"actorId":"' + data.unitId + '"}]';
                                delArr.push(param);
                                $(tbodyArr[i]).remove();
                                table.init('dataGridUnit_test', {
                                    height: 165,
                                    limit: 3,
                                    page: true
                                });
                            }
                        }
                        var html = "<option value='" + data.unitId + "'>" + data.unitName + "</option>";
                        $(html).appendTo($("#selectAddUnit")[0]);
                        form.render();
                        obj.del();
                        layer.close(index);
                    });
                }
            });
            table.on('tool(dataGridUser_test)', function (obj) {
                var data = obj.data;
                if (obj.event == 'setUserDescription') {
                    layer.prompt({
                        formType: 2,
                        value: data.userDescription,
                        title: "修改 " + data.userName + " 职务"
                    }, function (value, index, elem) {
                        layer.close(index);
                        // 保存内容
                        var remarkIndex;
                        var idIndex;
                        $("#dataGridUser").each(function (index) {
                            $(this).find("thead tr th").each(function (index) {
                                if (this.id == "userDescription")
                                    remarkIndex = index;
                                if (this.id == "userId")
                                    idIndex = index;
                            });
                            $(this).find("tbody tr").each(function (index) {
                                if (this.children[idIndex].textContent == data.userId)
                                    this.children[remarkIndex].innerText = value;
                            });
                        });
                        obj.update({
                            userDescription: value
                        });
                    });
                }
                if (obj.event == 'setUserRemark') {
                    layer.prompt({
                        formType: 2,
                        value: data.userRemark,
                        title: "修改 " + data.userName + " 备注"
                    }, function (value, index, elem) {
                        layer.close(index);
                        // 保存内容
                        var remarkIndex;
                        var idIndex;
                        $("#dataGridUser").each(function (index) {
                            $(this).find("thead tr th").each(function (index) {
                                if (this.id == "userRemark")
                                    remarkIndex = index;
                                if (this.id == "userId")
                                    idIndex = index;
                            });
                            $(this).find("tbody tr").each(function (index) {
                                if (this.children[idIndex].textContent == data.userId)
                                    this.children[remarkIndex].innerText = value;
                            });
                        });
                        obj.update({
                            userRemark: value
                        });
                    });
                }
                if (obj.event == "userDel") {
                    layer.confirm('是否删除该行？', {icon: 3, title: '提示'}, function (index) {
                        var tbodyArr = $("#dataGridUser tbody")[0].children;
                        for (var i = 0; i < tbodyArr.length; i++) {
                            if (tbodyArr[i].firstChild.textContent == data.userId) {
                                var param = '[{"actorId":"' + data.userId + '"}]';
                                delArr.push(param);
                                $(tbodyArr[i]).remove();
                                table.init('dataGridUser_test', {
                                    height: 165,
                                    limit: 3,
                                    page: true
                                });
                            }
                        }
                        var html = "<option value='" + data.userId + "'>" + data.userName + "</option>";
                        $(html).appendTo($("#selectAddUser")[0]);
                        form.render();
                        obj.del();
                        layer.close(index);
                    });
                }
            });
        })
    }
</script>

