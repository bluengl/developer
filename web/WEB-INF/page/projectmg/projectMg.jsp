<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-13
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/overLayui.css">
    <style>
        body{
            min-width: 1000px;
            overflow: scroll;
        }
    </style>
</head>
<body>

    <%--查询区域--%>
    <div class="layui-card">
        <div class="layui-card-header">查询条件</div>
        <div class="layui-card-body">
            <form id="con_form" class="layui-form" action="execute.do" filter>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="layui-form-item">
                            <label class="layui-form-label">工程名</label>
                            <div class="layui-input-block">
                                <input id="con_projectName" type="text" name="title" placeholder="请输入工程名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="layui-form-item">
                            <label class="layui-form-label">建设单位</label>
                            <div class="layui-input-block">
                                <select id="con_selectComp" name="comp">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="myInputText layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <div class="layui-form-item">
                            <label class="layui-form-label">项目人员</label>
                            <div class="layui-input-block">
                                <input id="con_username" type="text" name="title2" placeholder="请输入人员名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-row">
                    <div class="myInputText layui-col-xs12 layui-col-sm12 layui-col-md12">
                        <div class="layui-form-item"
                             style="padding-top: -10px; margin-bottom: -15px; margin-left: 35%;">
                            <div class="layui-input-block" style="margin-left: 60px">
                                <button type="button" class="layui-btn layui-btn-sm" onclick="fnFind()">
                                    <i class="layui-icon layui-icon-search"></i> 查询
                                </button>
                                <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">
                                    <i class="layui-icon layui-icon-refresh"></i> 重置
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--数据区域--%>
    <div class="layui-card">
        <div class="layui-card-header">工程信息</div>
        <div class="layui-card-body">
            <table id="project_detail" class="layui-table" lay-size="sm" lay-filter="project_detail_test">
                <colgroup>
                    <col width="80">
                    <col width="150">
                    <col width="150">
                    <col width="50">
                    <col width="50">
                    <col width="80">
                </colgroup>
                <thead>
                <tr>
                    <th id="id" lay-data="{field:'id', width:'10%', fixed: 'left'}">项目编号</th>
                    <th id="name" lay-data="{field:'name', width:'30%'}">项目名称</th>
                    <th id="unitName" lay-data="{field:'unitName', width:'25%'}">建设单位</th>
                    <th id="status" lay-data="{field:'status', width:'10%'}">状态</th>
                    <th id="createByUserName" lay-data="{field:'createByUserName', width:'10%'}">创建人</th>
                    <th lay-data="{field:'op',toolbar:'#barDemo', width:'15%', fixed: 'right'}">执行操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

</body>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-submit lay-filter="formDemo" onclick="test2()">
            <i class="layui-icon layui-icon-addition"></i> 录入工程
        </button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<jsp:include page="/res/jsp/modules.jsp"/>
<script src="${pageContext.request.contextPath}/res/js/page/projectmg/default.js"></script>
</html>