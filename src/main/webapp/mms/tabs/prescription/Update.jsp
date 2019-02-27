<%@ page import="com.ming.hospital.pojo.Prescription" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ming.hospital.pojo.Medicine" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>添加客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.2.min.js"></script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>

	<SCRIPT>
		var pid = "";

        var prescriptionIndex;
        var medicineIndex;
        var p_descriptionArray = new Array();
        var p_medicineNameArray = new Array();

        var m_medicineNameArray = new Array();  //记录药品的文本
        var m_medicineValueArray = new Array();  //记录药品的值

		var m_medicineAddNameArray = new Array();  //添加的药品的名称
        var m_medicineAddValueArray = new Array();  //添加的药品的值

        <% List<Prescription> prescriptions = (List<Prescription>) session.getAttribute("allPrescription");
           int size = prescriptions.size();

           List<Medicine> medicineList = (List<Medicine>) session.getAttribute("medicineList");
           int m_size = medicineList.size();
        %>

        window.onload= function(){
            loadDescription();
            loadMedicineName();
            loadMedicineList();
        };

        function loadDescription() {

            <% for(int i=0;i < size; i++){   %>
              p_descriptionArray[ <%=i%> ]= "<%=prescriptions.get(i).getDescription()%>";
            <%   }   %>
        }

        function loadMedicineName() {

            <% for(int i=0;i < size; i++){   %>
              p_medicineNameArray[ <%=i%> ]= "<%=prescriptions.get(i).getMedicineMname()%>";
            <%   }   %>
        }

        function loadMedicineList() {
            <% for(int i=0;i <m_size; i++){   %>
              m_medicineNameArray[ <%=i%> ]= "<%=medicineList.get(i).getMname()%>";
              m_medicineValueArray[ <%=i%> ]= "<%=medicineList.get(i).getMno()%>";
            <%   }   %>
        }

        //处方单对象发生触发更改，addMed和deleteMed中的药品信息也要发生修改
        function prescriptionOnChange() {

            var selectedPid = document.getElementById("pid_list");
            var index = selectedPid.selectedIndex;

            pid = selectedPid.options[index].value;
//            alert(pid);

            var medicineSelected = document.getElementById("addMed");
            medicineSelected.selectedIndex = 0;

            //清空m_medicineAddNameArray，m_medicineAddValueArray,prescriptionMedicineMno的信息
            clearMedArray();

            prescriptionIndex = index;

            var description = document.getElementById("symptom");
            var medicine = document.getElementById("medicine");

            if(prescriptionIndex >= 0){
                description.value = p_descriptionArray[prescriptionIndex];
                medicine.value = p_medicineNameArray[prescriptionIndex];
			}
        }

        //药品添加，并将添加后的药品保存在m_medicineAddArray数组中，名字显示在删除药品的选择菜单中
        function medicineAdd() {

            var selectedOption = document.getElementById("addMed");
            var index = selectedOption.selectedIndex;

            medicineIndex = index;

            var medicine = document.getElementById("medicine");

            if(medicineIndex >= 0){
                if(medicine.value == ""){
                    medicine.value = m_medicineNameArray[medicineIndex];
				}else{
                    medicine.value = medicine.value + "," + m_medicineNameArray[medicineIndex];
				}
                var m_addLength = m_medicineAddNameArray.length;
                m_medicineAddNameArray[m_addLength] = m_medicineNameArray[medicineIndex];
                m_medicineAddValueArray[m_addLength] = m_medicineValueArray[medicineIndex];
            }
        }

        //清空m_medicineAddNameArray，m_medicineAddValueArray的信息
        function clearMedArray() {
            m_medicineAddNameArray = [];
            m_medicineAddValueArray = [];
        }

        function testAjax() { 

            var description = document.getElementById("symptom").value;
            var medicines = document.getElementById("medicine").value;

            var prescription = {
                "pid": pid,
				"description":description,
				"medicineMname":medicines
			};  

            $.ajax({       
				type:'POST',       
				data:JSON.stringify(prescription),       
				contentType :'application/json;charset=utf8',       
				dataType:'json',       
				url :'/Prescription/UpdatePrescription',       
//				success :function(data){           
//				    alert("OK");       
//				},       
//
//				error :function(e){         
//				    alert("error");       
//				}
                })     
        }

	</SCRIPT>
</HEAD>
<BODY>
	<FORM id=form1 name=form1
		action="${pageContext.request.contextPath }/Prescription/UpdatePrescription"
		method=post>
		

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						
						<TABLE cellSpacing=0 cellPadding=5  border=0>
						  
						    
							<TR>
								<td>姓名：</td>
								<td>
									<select id="pid_list" name="pid_list" onchange="prescriptionOnChange()">
										<c:forEach items="${sessionScope.allPrescription}" var="prescription">
											<option value="${prescription.pid}">${prescription.appointment.name}</option>
										</c:forEach>
									</select>
								</td>
							</TR>
							
							<TR>
								<td>症状：</td>
								<td>
									<textarea id="symptom" rows="5" cols="50" name="symptom"></textarea>
							</TR>

							<TR>
								<td>处方药：</td>
								<td>
									<textarea id="medicine" rows="5" cols="50" name="medicine"></textarea>
								</td>

								<td>添加</td>
								<td>
									<select id="addMed" name="addMed" onchange="medicineAdd()">
										<c:forEach items="${sessionScope.medicineList}" var="medicine">
											<option value="${medicine.mno}">${medicine.mname}</option>
										</c:forEach>
									</select>
								</td>

							</TR>

							<tr>
								<td rowspan=2>
								<INPUT class=button id=sButton2 type=submit
														value="保存" name=sButton2 onclick="testAjax()">
								</td>
							</tr>
						</TABLE>
						
						
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
					<IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
