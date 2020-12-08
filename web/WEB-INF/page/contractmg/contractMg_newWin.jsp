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

<form lay-filter="contractForm" class="layui-form layui-tab" action="">
    <ul class="layui-tab-title">
        <li class="layui-this">合同信息</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-container">
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label" style="color: #ff6b55">合同编号</label>
                        <div class="layui-input-block">
                            <input id="personId" type="text" name="id" readonly
                                   style="background-color: #e3e3e3;color: #b7b7b7;cursor: not-allowed !important;"
                                   autocomplete="off" class="layui-input" value="${contractId}">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label" style="color: #ff6b55">合同名称</label>
                        <div class="layui-input-block">
                            <input id="contractName" type="text" name="name" lay-verify="required" placeholder="请输入合同名称"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">当事人姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="userName" lay-verify="required" placeholder="请输入当事人名称"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">当事人联系方式</label>
                        <div class="layui-input-block">
                            <input type="text" name="userTel" lay-verify="required" placeholder="请输入当事人联系方式"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-row">
                    <div class="layui-form-item layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">工程名称</label>
                        <div class="layui-input-block" style="font-size: 12px">
                            <select id="selectProject" name="project">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">工程价款</label>
                        <div class="layui-input-block">
                            <input type="text" id="cost" name="cost"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">支付方式</label>
                        <div class="layui-input-block">
                            <input type="text" name="costType" lay-verify="required" placeholder="请输入支付方式"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">监理人员</label>
                        <div class="layui-input-block">
                            <select id="selectSupervisor" name="supervisor">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">工程保修期</label>
                        <div class="layui-input-block">
                            <input type="text" name="projectExp" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">合同内容</label>
                        <div class="layui-input-block">
                            <input type="text" name="context" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                            <input type="text" hidden="hidden" name="type" id="type" value="2">
                        </div>
                    </div>
                </div>
                <%--                <div class="layui-row layui-form-item" id="fileItem">--%>
                <%--                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">--%>
                <%--                        <label class="layui-form-label">合同文件</label>--%>
                <%--                        <div class="layui-input-block">--%>
                <%--                            <button id="upload" type="button" class="layui-btn layui-btn-sm" onclick="fnTest1()">--%>
                <%--                                上传--%>
                <%--                            </button>--%>
                <%--                            <input style="display: none" type="file" name="file" id="file" onchange="fnTest2(this)"/>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>
</form>

</body>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element', 'dataUtil', 'ajax', 'laydate', 'upload'], function () {
        var $ = layui.jquery,
            dataUtil = layui.dataUtil,
            ajax = layui.ajax,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload;
        console.debug($("#type")[0])
        if ("'${contractId}'" == "''") {
            $("#type")[0].value = "1";
        }
        dataUtil.setSelectInputData(${selectProject}, "selectProject");
        dataUtil.setSelectInputData(${selectSupervisor}, "selectSupervisor");
        if ("${contractInfo}" != "") {
            form.val('contractForm', {
                "id": "${contractInfo.id}",
                "name": "${contractInfo.name}",
                "userName": "${contractInfo.userName}",
                "userTel": "${contractInfo.userTel}",
                "project": "${contractInfo.project}",
                "cost": "${contractInfo.cost}",
                "costType": "${contractInfo.costType}",
                "supervisor": "${contractInfo.supervisor}",
                "projectExp": "${contractInfo.projectExp}",
                "context": "${contractInfo.context}"
            })
        }
    });

    function saveContractInfo(that) {
        var form = layui.form,
            $ = layui.jquery;
        var data = form.val('contractForm');
        var param = JSON.stringify(data);
        if ($("#contractName")[0].value == "") {
            layer.tips('合同名称不能为空', '#contractName');
            return;
        }
        layer.confirm('是否保存?', {icon: 3, title: '提示'}, function (index) {
            layer.close(index);
            var index_loading = layer.load(2);
            $.ajax({
                data: data,
                url: "saveContractInfo.do",
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
                    try {
                        if ("timeout" == data.msg)
                            location.href = "/designer/index.jsp";
                    } catch (e) {
                    }
                    layer.close(index_loading);
                    layer.alert('保存成功', {icon: 1});
                }
            });
        });
    }

    function fnTest1() {
        var $ = layui.jquery;
        $("#file").trigger("click");
    }

    function fnTest2(that) {
        var $ = layui.jquery;
        var file = that.files[0];
    }
</script>
</html>
