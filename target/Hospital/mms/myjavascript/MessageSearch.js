// 信息查询begin
// <!-- 信息查询-SCM-SAM-SMM+MessageSearch  -->
// 查询顾客信息begin
// var whx = document.getElementsByClassName("whx")[0];
function SCMclick() {
	if (!$('#output').tabs('exists', '查询处方信息')) {
		$('#output').tabs('add', {
			// id:'SCM',
			title: '查询处方信息',
			href: './tabs/client/Search1.jsp',

			closable: true
		});
	}
	else
	{
		$('#output').tabs('select', '查询顾客信息');
	}
}

// 查询顾客信息end
// 查询经办人信息begin
function SAMclick() {
	if(access.indexOf("信息查询功能") < 0 ){
            $.messager.alert('警告','该用户没有此功能');
            event.stopPropagation();    
         }
	if (!$('#output').tabs('exists', '查询经办人信息')) {
		$('#output').tabs('add', {
			// id:'SUM',   
			title: '查询经办人信息',
			href: './tabs/agency/Search1.jsp',
			closable: true
		});
	}
	else
	{
		$('#output').tabs('select', '查询经办人信息');
	}
}


// 查询经办人信息end
// 查询药品信息begin
function SMMclick() {

	if (!$('#output').tabs('exists', '查询药品信息')) {
		$('#output').tabs('add', {
			// id:'SMM',   
			title: '查询药品信息',
			href: './tabs/medicine/Search1.jsp',
			closable: true
		});
	}
	else
	{
		$('#output').tabs('select', '查询药品信息');
	}
}


// 查询药品信息end
// 信息查询end