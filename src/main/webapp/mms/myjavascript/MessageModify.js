// 信息修改begin
// <!-- 信息修改-MCM-MAM-MMM+MessageModify  -->
// 修改顾客信息begin
function MCMclick(){

    	if(!$('#output').tabs('exists','修改处方信息')) {
				     $('#output').tabs('add',{ 
				     	// id:'ECM',   
					    title:'修改处方信息',
					      // fit:true,
					    href:'./tabs/client/Modify.jsp',
					    closable:true
					});
				 }
		else
		{
		$('#output').tabs('select', '修改处方信息');
		}
}

// 修改顾客信息end
// 修改经办人信息begin
function MAMclick(){

    	if(!$('#output').tabs('exists','修改经办人信息')) {
				     $('#output').tabs('add',{ 
				     	// id:'ECM',   
					    title:'修改经办人信息',    
					      // fit:true,
					    href:'./tabs/agency/Modify.jsp',
					    closable:true
					});
				 }
		else
		{
		$('#output').tabs('select', '修改经办人信息');
		}
}

// 修改经办人信息end
// 修改药品信息begin
function MMMclick(){

    	if(!$('#output').tabs('exists','修改药品信息')) {
				     $('#output').tabs('add',{ 
				     	// id:'ECM',   
					    title:'修改药品信息',    
					      // fit:true,
					    href:'./tabs/medicine/Modify.jsp',
					    closable:true
					});
				 }
		else
		{
		$('#output').tabs('select', '修改药品信息');
		}
}

// 删除药品信息end
// 信息录入end