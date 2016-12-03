function showmore(){
	layer.closeAll();
	layer.open({
    type: 2,
	title:'多选主体统计',
    area: ['610px', '400px'],
    fix: false, //不固定
	scrollbar: false,
    content: '/box/zhuti.asp',
	});
}