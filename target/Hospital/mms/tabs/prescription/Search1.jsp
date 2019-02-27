<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <TITLE>添加客户</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
          rel=stylesheet>

    <%--<c:if test="${sessionScope.doctor.dname eq null}">--%>
        <%--<meta  http-equiv="refresh" content="0.01;url=/mms/tabs/prescription/Error.jsp">--%>
    <%--</c:if>--%>
    <META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>

<!-- 药品编号查询SMM -->
<div  style="margin: 2% 0px 0px 30%">
    <div class="easyui-panel" title="处方编号查询"
        data-options="iconCls:'icon-pill'"
        style="max-width:400px;padding:30px 60px;">

        <form action="${pageContext.request.contextPath}/Prescription/QueryPrescriptionByPid" method="post">
            <div style="margin-bottom:20px">
                <input id="SMMId" class="easyui-textbox"
                labelPosition="top" name="pid" data-options="prompt:'请输入处方编号...'"
                style="width:100%;height:35px">
            </div>
            <div>
                <input type="submit" value="处方编号查询" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%">
                <%--<a href="${pageContext.request.contextPath}/Medicine/QueryMedicineByMno" class="easyui-linkbutton" iconCls="icon-ok" style="width:100%">编号查询</a>--%>
            </div>
        </form>

    </div>
</div>
<!-- 查询结束 -->

