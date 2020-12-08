<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-18
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String projectView = request.getParameter("projectView");
    System.out.println(projectView);

%>
<html>
<head>
    <title>新窗口</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/overLayui.css">
    <jsp:include page="/res/jsp/projectmgUtil.jsp"></jsp:include>
</head>
<script>
</script>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this" id="baseInfo">基本信息</li>
        <li>项目概况</li>
        <li>参建单位</li>
        <li>项目人员</li>
    </ul>
    <div class="layui-tab-content">

        <div class="layui-tab-item layui-show">
            <form class="layui-form" action="">
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="color: #ff6b55">编号</label>
                            <div class="layui-input-block">
                                <input id="testId" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectId}" onchange="fnTest9(this)">
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="color: #ff6b55">项目名称</label>
                            <div class="layui-input-block">
                                <input id="testName" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectDetail.name}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">形象</label>
                            <div class="layui-input-block">
                                <select id="testSelect2">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">项目状态</label>
                            <div class="layui-input-block">
                                <select id="testSelect1">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">工程地点</label>
                            <div class="layui-input-block">
                                <select id="selectProvince" lay-filter="selectProvince" lay-search>
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">城市</label>
                            <div class="layui-input-block">
                                <select id="selectCity" lay-filter="selectCity" lay-search>
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">区县</label>
                            <div class="layui-input-block">
                                <select id="selectCounty">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">详细地址</label>
                            <div class="layui-input-block">
                                <input id="detailedAd" type="text" name="title" autocomplete="off" placeholder="请输入详细地址"
                                       class="layui-input" value="${projectDetail.detailedAd}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label" style="color: #ff6b55">开工时间</label>
                            <div class="layui-input-block">
                                <input id="startTime" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectDetail_startTime}">
                            </div>
                            <span id="testView"></span>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">完工时间</label>
                            <div class="layui-input-block">
                                <input id="endTime" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectDetail_endTime}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">项目负责人</label>
                            <div class="layui-input-block">
                                <select id="selectPrincipal" lay-search>
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">建设单位</label>
                            <div class="layui-input-block">
                                <select id="selectBuildToUnit" lay-search>
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>

        <div class="layui-tab-item">
            <form class="layui-form" action="">

                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">层数</label>
                            <div class="layui-input-block">
                                <input id="level" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectDetail.level}">
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">总面积(m^2)</label>
                            <div class="layui-input-block">
                                <input id="totalArea" type="text" name="title" placeholder="m^2" autocomplete="off"
                                       class="layui-input" value="${projectDetail.totalArea}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">地上面积(m^2)</label>
                            <div class="layui-input-block">
                                <input id="overArea" type="text" name="title" placeholder="m^2" autocomplete="off"
                                       class="layui-input" value="${projectDetail.overArea}">
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">地下面积(m^2)</label>
                            <div class="layui-input-block">
                                <input id="underArea" type="text" name="title" placeholder="m^2" autocomplete="off"
                                       class="layui-input" value="${projectDetail.underArea}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">建筑总高(m^2)</label>
                            <div class="layui-input-block">
                                <input id="totalHeight" type="text" name="title" placeholder="m^2" autocomplete="off"
                                       class="layui-input" value="${projectDetail.totalHeight}">
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">建筑群组成</label>
                            <div class="layui-input-block">
                                <input id="makeBy" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectDetail.makeBy}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">总投资(万)</label>
                            <div class="layui-input-block">
                                <input id="totalIM" type="text" name="title" placeholder="万元" autocomplete="off"
                                       class="layui-input"
                                       value="${projectDetail.totalIM}">
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <div class="layui-form-item">
                            <label class="layui-form-label">监理费用(万)</label>
                            <div class="layui-input-block">
                                <input id="supervisionCost" type="text" name="title" placeholder="万元" autocomplete="off"
                                       class="layui-input"
                                       value="${projectDetail.supervisionCost}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs12 layui-col-sm12 layui-col-md12">
                        <div class="layui-form-item">
                            <label class="layui-form-label">规模</label>
                            <div class="layui-input-block">
                                <input id="scale" type="text" name="title" autocomplete="off" class="layui-input"
                                       value="${projectDetail.scale}">
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>

        <div class="layui-tab-item">
            <div class="layui-container">
                <form class="layui-form" action="">
                    <div class="layui-row">
                        <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <select id="selectAddUnit" lay-search>
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="layui-btn layui-btn-sm" onclick="fnTest7()">
                            <i class="layui-icon layui-icon-addition"></i> 添加单位
                        </button>
                    </div>
                    <div class="layui-row">
                        <div class="myInputText layui-col-xs12 layui-col-sm12 layui-col-md12">
                            <div class="layui-form-item">
                                <label class="layui-form-label">工程描述</label>
                                <div class="layui-input-block">
                                    <input id="Add_Unitdes" type="text" name="title" autocomplete="off"
                                           class="layui-input" value="">
                                </div>
                            </div>
                        </div>
                        <div class="myInputText layui-col-xs12 layui-col-sm12 layui-col-md12">
                            <div class="layui-form-item">
                                <label class="layui-form-label">备注</label>
                                <div class="layui-input-block">
                                    <input id="Add_Remark" type="text" name="title" autocomplete="off"
                                           class="layui-input" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <table id="dataGridUnit" class="layui-table" lay-size="sm" lay-filter="dataGridUnit_test">
                <colgroup>
                    <col width="100">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th id="unitId" lay-data="{field:'unitId', fixed: 'left'}">单位编号</th>
                    <th id="unitName" lay-data="{field:'unitName'}">单位名称</th>
                    <th id="unitDescription" lay-data="{field:'unitDescription', event:'setUnitDescription'}">工程描述(编辑)
                    </th>
                    <th id="unitRemark" lay-data="{field:'unitRemark', event:'setUnitRemark'}">备注(编辑)</th>
                    <th lay-data="{field:'op', toolbar:'#barDel', event:'unitDel', fixed: 'right'}">执行操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

        <div class="layui-tab-item">
            <div class="layui-container">
                <form class="layui-form" action="">
                    <div class="layui-row">
                        <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <select id="selectAddUser" lay-search>
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button class="layui-btn layui-btn-sm" type="button" onclick="fnTest8(this)">
                            <i class="layui-icon layui-icon-addition"></i> 添加人员
                        </button>
                    </div>
                    <div class="layui-row">
                        <div class="myInputText layui-col-xs12 layui-col-sm12 layui-col-md12">
                            <div class="layui-form-item">
                                <label class="layui-form-label">职务</label>
                                <div class="layui-input-block">
                                    <input id="Add_UserDes" type="text" name="title" autocomplete="off"
                                           class="layui-input" value="">
                                </div>
                            </div>
                        </div>
                        <div class="myInputText layui-col-xs12 layui-col-sm12 layui-col-md12">
                            <div class="layui-form-item">
                                <label class="layui-form-label">备注</label>
                                <div class="layui-input-block">
                                    <input id="Add_UserRemark" type="text" name="title" autocomplete="off"
                                           class="layui-input" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <table id="dataGridUser" class="layui-table" lay-size="sm" lay-filter="dataGridUser_test">
                <colgroup>
                    <col width="100">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th id="userId" lay-data="{field:'userId', fixed: 'left'}">人员编号</th>
                    <th id="userName" lay-data="{field:'userName'}">姓名</th>
                    <th id="userDescription" lay-data="{field:'userDescription', event:'setUserDescription'}">职务(编辑)
                    </th>
                    <th id="userRemark" lay-data="{field:'userRemark', event:'setUserRemark'}">备注(编辑)</th>
                    <th lay-data="{field:'op', toolbar:'#barDel', event:'userDel', fixed: 'right'}">执行操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </div>
</div>
<script type="text/html" id="barDel">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="Unitdel">删除</a>
</script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script src="${pageContext.request.contextPath}/res/js/page/projectmg/newWin.js"></script>
<script>
    var projectId = "${projectId}";

    // 保存
    function fnTest1(that) {
        var $ = layui.jquery,
            ajax = layui.ajax,
            table = layui.table,
            dataUtil = layui.dataUtil;
        if ($("#testId")[0].value == "") {
            $("#baseInfo").click();
            layer.tips('项目编号不能为空', '#testId');
            return;
        } else if ($("#testName")[0].value == "") {
            $("#baseInfo").click();
            layer.tips('项目名称不能为空', '#testName');
            return;
        } else if ($("#startTime")[0].value == "") {
            $("#baseInfo").click();
            layer.tips('开工时间不能为空', '#startTime');
            return;
        } else if ($("#endTime")[0].value != "" && ($("#startTime")[0].value > $("#endTime")[0].value)) {
            $("#baseInfo").click();
            layer.tips('开工时间不能大于完工时间', '#startTime');
            return;
        }
        if (projectId == "") {
            console.debug("1");
            if(fnTest9($("#testId")[0]) == 0){
                console.debug("2")
            }
        }
        layer.confirm('是否保存?', {icon: 3, title: '提示'}, function (index) {
            //do something
            var projectId = "${projectId}";
            var param = '{"id":"' + $("#testId")[0].value + '", "name":"' + $("#testName")[0].value + '",' +
                ' "unitName":"' + $("#selectBuildToUnit")[0].value + '", "status":"' + $("#testSelect1")[0].value + '", ' +
                ' "createByUserName":"' + "${sessionScope.userInfo.realUserId}" + '", "view":"' + $("#testSelect2")[0].value + '",' +
                ' "provinceId":"' + $("#selectProvince")[0].value + '", "cityId":"' + $("#selectCity")[0].value + '", "countyId":"' + $("#selectCounty")[0].value + '",' +
                ' "detailedAd":"' + $("#detailedAd")[0].value + '", "startTime":"' + $("#startTime")[0].value + '", "endTime":"' + $("#endTime")[0].value + '",' +
                ' "principalId":"' + $("#selectPrincipal")[0].value + '", "buildToUnitId":"' + $("#selectBuildToUnit")[0].value + '",' +
                ' "level":"' + $("#level")[0].value + '", "totalArea":"' + $("#totalArea")[0].value + '", "overArea":"' + $("#overArea")[0].value + '",' +
                ' "underArea":"' + $("#underArea")[0].value + '", "totalHeight":"' + $("#totalHeight")[0].value + '", "makeBy":"' + $("#makeBy")[0].value + '",' +
                ' "totalIM":"' + $("#totalIM")[0].value + '", "supervisionCost":"' + $("#supervisionCost")[0].value + '", "scale":"' + $("#scale")[0].value + '",' +
                ' "participantUnit":"", "participantUser":"", "delArr":"", "type":""}';
            var paramArr = JSON.parse(param);
            paramArr.delArr = "[" + delArr.toString() + "]";
            paramArr.participantUnit = dataUtil.convertTableDataToJSON("dataGridUnit");
            paramArr.participantUser = dataUtil.convertTableDataToJSON("dataGridUser");
            if (projectId == "") {
                paramArr.type = "1";
            } else {
                paramArr.type = "2";
            }
            $.post("saveProjectInfo.do", paramArr, function (data) {
                if ("timeout" == data.msg) {
                    location.href = "/designer/index.jsp";
                } else if ("false" == data.msg) {
                    layer.alert('保存失败', {icon: 2});
                } else {
                    that.btn1 = null;
                    $($($(window.parent.document).find("div[type='iframe']")[0]).find("a[class='layui-layer-btn0']")[0]).remove();
                    layer.alert('保存成功', {icon: 1});
                }
            }, "json");
            layer.close(index);
        });
    }

    function fnTest9(that) {
        var $ = layui.jquery,
            ajax = layui.ajax;
        ajax.submit("post", "checkProjectId.do", '{"projectId":"' + that.value + '"}', function (data) {
            if (data.res >= 1) {
                layer.alert('项目编号已存在！', {icon: 2});
                that.value = "";
                return 0;
            } else return 1;
        });
    }

</script>
</body>
</html>
