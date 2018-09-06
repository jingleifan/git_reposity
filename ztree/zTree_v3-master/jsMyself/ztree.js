$(function(){
	z();
	
	
});
function z(){
	var  setting={};
	var zNodes=[
		{ name:"父节点1",
			children:[
			{name:"子节点1"},
			{name:"子节点2"}
			]
			
			
		},
		{
			name:"父节点2",
			children:[
				{name:"子节点1"},
				{name:"子节点2"}
			]
			
		},
		{name:"无父节点",isParent:false}

	];
	$.fn.zTree.init($("#treeDemo"),setting,zNodes);
}



