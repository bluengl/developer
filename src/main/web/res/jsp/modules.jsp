<%--
  Created by IntelliJ IDEA.
  User: NGL18
  Date: 2020-01-25
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js" charset="UTF-8"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/res/js/modules/'
    }).extend({
        tab: 'tab',
        navTree: 'navTree',
        msg: 'msg',
        dataUtil: 'dataUtil',
        ajax: 'ajax',
        win: 'win'
    });
</script>