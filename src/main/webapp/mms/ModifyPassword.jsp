<%@ page import="com.ming.hospital.pojo.Doctor" %>
<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<%@include file="../common.jsp"%>
<html>
<head >
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
    <link rel="stylesheet" href="../css/all.css"/>
    <script src="../js/modifyPassword.js"></script>
    <script>
        // 1、获得焦点，内容为空，tip默认提示
        // 2、失去焦点，内容为空，tip为隐藏
        // 3、其他情况（按键抬起，失去焦点且内容不为空，或最后表单总验证）
        //    按键抬起为空，报错，不能为空
        //    内容匹配，成功
        //    内容不匹配，失败
        // 4、密码要进行安全等级检测，含数字、字母、特殊字符为强，两种为中，一种为弱
        // 5、确认密码失去焦点的时候就要验证是否一致
        <%Doctor doctor = (Doctor)session.getAttribute("doctor"); %>
        var originPwd = <%= doctor.getDpassword()%>;
    </script>
</head>
<body>
<!--头部-->
<div class="header">
    <a class="logo" href=""><img src="../images/logo.jpg"></a>
    <div class="desc" style="margin-left: 120px;font-size: 25px">密码修改</div>
</div>
<!--版心-->
<div class="container">
    <!--密码修改模块-->
    <div class="register">
        <form action="${pageContext.request.contextPath}/doctor/modifyPassword" method="post">

            <!-- 优质医生-->
            <div id="excel-doctor-div" class="excel-doctor">
                <div class="content slideBox2">
                    <div class="doctail-detail bd">
                        <ul id="dictor-list-ul">
                            <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                                <a href="doctor/detail/${sessionScope.doctor.did}" >
                                    <img src="${sessionScope.doctor.image}">
                                </a>
                                <p><b><span>${sessionScope.doctor.dname}</span></b>
                                    <span class="doctor-level">
                                            <c:choose>
                                                <c:when test="${sessionScope.doctor.grade == 1}">主任医师</c:when>
                                                <c:when test="${sessionScope.doctor.grade == 2}">副主任医师</c:when>
                                                <c:when test="${sessionScope.doctor.grade == 3}">主治医师</c:when>
                                                <c:when test="${sessionScope.doctor.grade == 4}">普通医师</c:when>
                                            </c:choose>
                                                       </span>
                                </p>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>


            <!--输入原密码-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="pwd">原 密 码：</label>
                    <input name = "pwd" type="password" id="pwd" placeholder="请输入原密码" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>

            <!--输入新密码-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="pwd1">新 密 码：</label>
                    <input type="password" id="pwd1" name="newPassword" placeholder="建议至少两种字符组合" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>

            <!--确认新密码-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="pwd2">确 认 密 码：</label>
                    <input type="password" id="pwd2" placeholder="请再次输入密码" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>

            <!--注册-->
            <button id="btn" type="submit">保存密码</button>
        </form>
    </div>
</div>
</body>
</html>