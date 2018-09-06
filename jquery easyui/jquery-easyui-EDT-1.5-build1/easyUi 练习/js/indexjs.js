$(function(){
	//$.fn.draggable.defaults.cursor='text';
	$.parser.parse()
	$('#dd').droppable({
		accept:'#box',
		onDragEnter:function(e,source){
		
		}
	})
	$('#box').draggable({
		//revert:true,                 //拖动鼠标放开回到原位置
		//handle:"#pox",
		//cursor:'text',
		
	    //proxy: function(source){
		//var p = $('<div style="border:20px solid #ccc;width:80px"></div>');
		//p.html($(source).html()).appendTo('body');
		//return p;
		//}
	
	});
	//console.log($('#box').draggable('options'));
});
$(function(){
	//$('#rr1').resizable({
			

	//});
	$('#toolstip').tooltip({   
	   
	content: '2345',   
	  });
});

function fixWidth(percent)  
{  
    return document.body.clientWidth * percent ; //这里你可以自己做调整  
}  
var    width=$(window).width()-80;
