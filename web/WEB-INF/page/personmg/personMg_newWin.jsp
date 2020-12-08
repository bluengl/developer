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

<form lay-filter="personForm" class="layui-form layui-tab" action="">
    <ul class="layui-tab-title">
        <li class="layui-this">人员信息</li>
        <li lay-id="1">考勤信息</li>
        <li lay-id="2">工作量汇总</li>
        <li lay-id="3">绩效结算</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-container">
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label" style="color: #b2b2b2">人员编号</label>
                        <div class="layui-input-block">
                            <input id="personId" type="text" name="id" readonly
                                   autocomplete="off" class="layui-input" value="${personId}">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label" style="color: #ff6b55">人员姓名</label>
                        <div class="layui-input-block">
                            <input id="personName" type="text" name="name" lay-verify="required" placeholder="请输入人员姓名"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-row layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block" style="font-size: 12px">
                        <input type="radio" name="sex" value="0" title="默认" checked>
                        <input type="radio" name="sex" value="1" title="男">
                        <input type="radio" name="sex" value="2" title="女">
                    </div>
                </div>

                <div class="layui-row">
                    <div class="layui-form-item layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-block" style="font-size: 12px">
                            <input type="text" id="tel" name="tel"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">出生日期</label>
                        <div class="layui-input-block">
                            <input type="text" id="birthday" name="birthday"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                        <label class="layui-form-label">现居地</label>
                        <div class="layui-input-block">
                            <input type="text" id="address" name="address"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>

                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">职位</label>
                        <div class="layui-input-block">
                            <select id="selectPos" name="position">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">负责项目</label>
                        <div class="layui-input-block">
                            <select id="selectProject" name="project">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">所属公司</label>
                        <div class="layui-input-block">
                            <select id="selectComp" name="comp" lay-filter="comp">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-block">
                            <select id="selectDept" name="dept">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-container">
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">出勤次数</label>
                        <div class="layui-input-block">
                            <input type="text" name="attendance" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">缺勤次数</label>
                        <div class="layui-input-block">
                            <input type="text" name="lost" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">考勤月份</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" id="selectMonth1" placeholder="yyyy-MM">
                            <div class="layui-inline" id="selectMonth"></div>
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">今日考勤状态</label>
                        <div class="layui-input-block">
                            <select id="selectStatus" name="status">
                                <option value="">未更新</option>
                                <option value="1">未打卡</option>
                                <option value="2">已打卡</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-container">
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                        <label class="layui-form-label">工作内容</label>
                        <div class="layui-input-block">
                            <input type="text" name="work_context" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">额定工作量</label>
                        <div class="layui-input-block">
                            <input type="text" name="rated_work" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">实际工作量</label>
                        <div class="layui-input-block">
                            <input type="text" name="actual_work" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">减免工作量</label>
                        <div class="layui-input-block">
                            <input type="text" name="reduce_work" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block">
                            <input type="text" name="remark" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-container">
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">工作态度</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_1" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">遵守纪律</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_2" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">业务素养</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_3" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">工作配合</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_4" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">安全生产</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_5" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">绩效考核</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_6" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-form-item">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">得分</label>
                        <div class="layui-input-block">
                            <input type="text" name="performance_sum" lay-verify="required"
                                   autocomplete="off" class="layui-input" value="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script>
    layui.use(['table', 'element', 'dataUtil', 'ajax', 'laydate'], function () {
        var $ = layui.jquery,
            dataUtil = layui.dataUtil,
            ajax = layui.ajax,
            form = layui.form,
            laydate = layui.laydate,
            element = layui.element;

        ajax.submit("post", "getPersonStatus.do", '{"personId":"' + $('#personId').val() + '"}', function (data) {
            form.val('personForm', {
                "status":data.status
            });
        });

        laydate.render({
            elem: '#selectMonth',
            type: 'month',
            position: 'static',
            done: function (value, date) { //监听日期被切换
                $("#selectMonth1")[0].value = value;
                //执行函数
                var personId = $('#personId').val();
                ajax.submit("post", "getPersonInterface.do", '{"month":"' + value + '","personId":"' + personId + '"}', function (data) {
                    console.debug(data);
                    form.val('personForm', {
                        "attendance": data.attendance,
                        "lost": data.lost,
                        "work_context": data.work_context,
                        "rated_work": data.rated_work,
                        "actual_work": data.actual_work,
                        "reduce_work": data.reduce_work,
                        "remark": data.remark,
                        "performance_1": data.performance_1,
                        "performance_2": data.performance_2,
                        "performance_3": data.performance_3,
                        "performance_4": data.performance_4,
                        "performance_5": data.performance_5,
                        "performance_6": data.performance_6,
                        "performance_sum": data.performance_sum
                    });
                })
            }
        });

        form.on('select(comp)', function (data) {
            var compId = $('select[name=comp]').val();
            ajax.submit("post", "getSelectDept.do", '{"compId":"' + compId + '"}', function (data) {
                dataUtil.setSelectInputData(data, "selectDept");
            })
        })

        if ("'${personId}'" == "''") {
            element.tabDelete("personForm", '1');
            element.tabDelete("personForm", '2');
            element.tabDelete("personForm", '3');
        }
        $("#personId").attr("style", "background-color: #e3e3e3;color: #b7b7b7;cursor: not-allowed !important;");
        laydate.render({
            elem: '#birthday',
            trigger: 'click', //采用click弹出
            theme: '#409d9e',
            max: 0,
            done: function (value, date, endDate) {
                $('#startTime').change();
            }
        });
        dataUtil.setSelectInputData(${selectPosition}, "selectPos");
        dataUtil.setSelectInputData(${selectProject}, "selectProject");
        dataUtil.setSelectInputData(${selectComp}, "selectComp");
        dataUtil.setSelectInputData(${selectDept}, "selectDept");
        if ("${personInfo}" != "") {
            form.val('personForm', {
                "id": "${personInfo.id}",
                "name": "${personInfo.name}",
                "sex": "${personInfo.sex}",
                "tel": "${personInfo.tel}",
                "birthday": "${personInfo.dateFormat}",
                "address": "${personInfo.address}",
                "position": "${personInfo.position}",
                "project": "${personInfo.project}",
                "comp": "${personInfo.comp}",
                "dept": "${personInfo.dept}"
            });
        }
    });

    function savePersonInfo(that) {
        var form = layui.form,
            $ = layui.jquery;
        var data = form.val('personForm');
        var param = JSON.stringify(data);
        if ($("#personName")[0].value == "") {
            layer.tips('人员姓名不能为空', '#personName');
            return;
        }
        layer.confirm('是否保存?', {icon: 3, title: '提示'}, function (index) {
            layer.close(index);
            var index_loading = layer.load(2);
            $.ajax({
                data: data,
                url: "savePersonInfo.do",
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
                    layer.close(index_loading);
                    layer.alert('保存失败', {icon: 2});
                }
            });
        });
    }
</script>
</html>
