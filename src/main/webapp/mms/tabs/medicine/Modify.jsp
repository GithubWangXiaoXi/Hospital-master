<%@page pageEncoding="UTF-8"  contentType="text/html; UTF-8" language="java" %>
<!-- 药品信息修改MMM -->
<div  style="margin: 2% 0px 0px 30%">
  <div class="easyui-panel" title="药品编号查询" 
    data-options="iconCls:'icon-pill'"
    style="max-width:400px;padding:30px 60px;">
    <div style="margin-bottom:20px">
      <input id="MMMId" class="easyui-textbox" 
      labelPosition="top" 
      data-options="prompt:'请输入药品编号...'" 
      style="width:100%;height:35px">
    </div>
    <div>
      <a href="javascript:MMMIdclick()" class="easyui-linkbutton" iconCls="icon-ok" 
      style="width:100%">查询</a>
    </div>
  </div>
</div>
<!-- 查询结束 -->

<!-- 隐藏页面 -->
<!-- 隐藏对话框 -->        
<div class="easyui-dialog" title="药品信息" closed="true" id="MMMdialog"
    data-options="iconCls:'icon-pill',modal:true,draggable:false"
    style="width:1000px;height:600px;">
    <div 
        style="margin:50px 0px 0px 100px;
        font-size: 40px">
        <form id="MMMform" method="post">
          <input type="hidden" name="mid" id="mmmid">
          <div style="margin-bottom: 30px">
            编号:<input  name="mno" id="mmmno" 
            class="easyui-textbox"
            style="width: 200px;height:40px"
            data-options=""></input>
            &nbsp;
            服用方法:<select  class="easyui-combobox" name="mmode"  id="mmmmode" 
            data-options="panelHeight:'auto'"
            style="width: 200px;height:40px">   
            <option value="内服">内服</option>   
            <option value="外用">外用</option> 
           </select>  
          </div>
          <div style="margin-bottom: 30px">
           名称:<input  name="mname" id="mmmname" 
           multiline="true"
           class="easyui-textbox" 
           style="width: 500px;height:150px"
           data-options="" ></input>
          </div>
          <div style="margin-bottom: 30px;">
            功效:<input  name="mefficacy" id="mmmefficacy" 
            multiline="true"
            class="easyui-textbox" 
            style="width: 500px;height:150px"
            data-options="" ></input>
          </div>
        </form>
      <a  href="javascript:MMMclickModify()"
        class="easyui-linkbutton" 
        data-options="text:'asd',iconCls:'icon-user' "
         style="width: 150px;height: 40px;
            margin-left: 35%" ><h1>修改</h1>
      </a>       
    </div>
</div>
<script type="text/javascript">
  function MMMIdclick() {

  $.post("../Medicine/GetMedicine", {
    mno: $('#MMMId').textbox('getValue')
  }, function(data) {
    if (data == ''){
      $.messager.alert('警告', '药品编号无效');
      return ;
    }
    $('#MMMdialog').dialog('open');
    $("#mmmid").val(data.mid);
    $("#mmmno").textbox('setValue', data.mno);
    $("#mmmno").textbox('textbox').css("font-size", "18pt");
    $("#mmmmode").combobox('setValue', data.mmode);
    $("#mmmmode").textbox('textbox').css("font-size", "18pt");
    $("#mmmname").textbox('setValue', data.mname);
    $("#mmmname").textbox('textbox').css("font-size", "18pt");
    $("#mmmefficacy").textbox('setValue', data.mefficacy);
    $("#mmmefficacy").textbox('textbox').css("font-size", "18pt");
  });
}
function MMMclickModify(){
  $('#MMMform').form({    
    url:'../Medicine/ModifyMedicine',    
    onSubmit: function(){    
        // do some check    
        // return false to prevent submit;    
    },    
    success:function(data){    
        $.messager.alert('提示', data); 
        $('#MMMdialog').dialog('close'); 
    }    
});    
// submit the form    
$('#MMMform').submit();  
   
}
</script>