<%@page pageEncoding="UTF-8"  contentType="text/html; UTF-8" language="java" %>
<!-- 药品编号录入EMM -->
   
<div style="margin:10px 0px 0px 250px">
    <div class="easyui-panel" title="药品信息" 
    data-options="iconCls:'icon-pill_add'"
    style="width:1000px;height:600px;">
        <div style="margin:50px 0px 0px 100px;font-size: 40px">
            <form id="EMMform" method="post">
                <div style="margin-bottom: 30px">
                    编号:<input  name="mno" id="emmno" 
                    class="easyui-textbox"
                    style="width: 200px;height:40px"
                    data-options=""></input>
                    &nbsp;
                    服用方法:<select  class="easyui-combobox" name="mmode"  id="emmmode" 
                    data-options="panelHeight:'auto'"
                    style="width: 60px;height:40px">   
                      <option value="内服">内服</option>   
                      <option value="外用">外用</option> 
                    </select>  
                
                </div>
                <div style="margin-bottom: 30px">
                    名称:<input  name="mname" id="emmname" 
                    multiline="true"
                    class="easyui-textbox" 
                    style="width: 500px;height:150px"
                    data-options="" ></input>
                </div>
                <div style="margin-bottom: 30px;">
                    功效:<input  name="mefficacy" id="emmefficacy" 
                    multiline="true"
                    class="easyui-textbox" 
                    style="width: 500px;height:150px"
                    data-options="" ></input>
                </div>
            </form>
        <a  href="javascript:EMMclickEntry()"
            class="easyui-linkbutton"
            style="width: 150px;height: 40px;
            margin-left: 35%" 
            data-options="iconCls:'icon-pill_add'"><h1>录入</h1>
        </a>
        </div>
    </div>
</div>
<!-- 测试完成 -->
<script type="text/javascript">
     function EMMclickEntry() {
    if($("#emmno").val().length>12||$("#emmno").val().length==0) {
        $.messager.alert('提示', '编号不能长度大于12且不为空'); 
        return ;
    }
    if($("#emmname").val().length>50) {
        $.messager.alert('提示', '名称不能长度大于50'); 
        return ;
    }
    
    if($("#emmefficacy").val().length>50) {
        $.messager.alert('提示', '功效不能长度大于50'); 
        return ;
    }
    
    $('#EMMform').form({    
    url:'../Medicine/SaveMedicine',    
    onSubmit: function(){    
        // do some check    
        // return false to prevent submit;    
    },    
    success:function(data){    
        $.messager.alert('提示', data); 
    }    
});    
// submit the form    
$('#EMMform').submit();  
}
</script>