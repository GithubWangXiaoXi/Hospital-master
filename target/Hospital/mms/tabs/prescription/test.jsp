<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: Administrator--%>
  <%--Date: 2019/1/2 0002--%>
  <%--Time: 下午 1:01--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<title>Title</title>--%>
<%--</head>--%>

<%--<script type="text/javascript">--%>

    <%--var optionIndex;--%>

    <%--function conveyIndexValue() {--%>

        <%--//得到值--%>
        <%--var selectedPid = document.getElementById("pid_list");--%>
        <%--var index = selectedPid.selectedIndex;--%>

<%--//			$.ajax({--%>
<%--//                 type:"GET",--%>
<%--//                 url: "Update.jsp",--%>
<%--//				 data: {index:optionIndex},--%>
<%--//				 success: function (data) {--%>
<%--//					 alert("success");--%>
<%--//                 }--%>
<%--//			});--%>

        <%--//js传值给jsp--%>
        <%--var xmlhttp;--%>
        <%--var msg;--%>
        <%--if (window.XMLHttpRequest)--%>
        <%--{// code for IE7+, Firefox, Chrome, Opera, Safari--%>
            <%--xmlhttp=new XMLHttpRequest();--%>
        <%--}--%>
        <%--else--%>
        <%--{// code for IE6, IE5--%>
            <%--xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");--%>
        <%--}--%>
        <%--xmlhttp.onreadystatechange=function()--%>
        <%--{--%>
            <%--if (xmlhttp.readyState==4 && xmlhttp.status==200)--%>
            <%--{--%>
                <%--document.getElementById("myDiv").innerHTML=xmlhttp.responseText;--%>

                <%--alert(xmlhttp.responseText);--%>
            <%--}--%>
        <%--}--%>
        <%--xmlhttp.open("POST","returnData.jsp",true);--%>
        <%--xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");--%>
        <%--xmlhttp.send("optionIndex=" + optionIndex);--%>

        <%--optionIndex = index;--%>
        <%--alert(optionIndex);--%>

        <%--//js赋值到html--%>
        <%--&lt;%&ndash;&lt;%&ndash;%>--%>
            <%--&lt;%&ndash;String param = request.getParameter("optionIndex");&ndash;%&gt;--%>
            <%--&lt;%&ndash;Integer selectedIndex = 0;&ndash;%&gt;--%>
            <%--&lt;%&ndash;if(param != null){&ndash;%&gt;--%>
                <%--&lt;%&ndash;selectedIndex = Integer.valueOf(param);&ndash;%&gt;--%>
            <%--&lt;%&ndash;}&ndash;%&gt;--%>
            <%--&lt;%&ndash;request.setAttribute("selectedIndex",selectedIndex);&ndash;%&gt;--%>

            <%--&lt;%&ndash;List<Prescription> prescriptions = (List<Prescription>) session.getAttribute("allPrescription");&ndash;%&gt;--%>
        <%--&lt;%&ndash;%>&ndash;%&gt;--%>

        <%--var symptom = document.getElementById("symptom");--%>
        <%--var medicine = document.getElementById("medicine");--%>
        <%--symptom.value = "11111";--%>
        <%--medicine.value = "2222";--%>
    <%--}--%>

<%--<body>--%>

<%--<TR>--%>
    <%--<td>症状：</td>--%>
    <%--<td>--%>
        <%--<INPUT id="symptom" class="textarea" id=sChannel3 value=""--%>
               <%--style="WIDTH: 360px" maxLength=100 name="symptom">--%>
    <%----%>
    <%--<td>处方药：</td>--%>
    <%--<td>--%>
        <%--<INPUT id="medicine" class=textarea" id=sChannel5 value=""--%>
               <%--style="WIDTH: 360px" maxLength=100 name="medicine">--%>
    <%--</td>--%>
<%--</TR>--%>

<%--</body>--%>
<%--</html>--%>
