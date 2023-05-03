let newsUpdate = {
	init: function(){
		$("#btn-news-update").on("click",()=>{
			this.newsUpdate();
		});
	},
	
	newsUpdate: function(){
		let data = {
			newsTitle:$("#newsTitle").val(),			
			newsSubTitle:$("#newsSubTitle").val(),		
			newsMainText:$("#summernote").val()			
		};
		
		console.log(data);
		
		$.ajax({
			type:"POST",
			url:"/admin/news/update",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			location.href = history.back();
		}).fail(function(error){
			console.log(error);
			alert(JSON.stringify(error));
		});
	}
	
	
}

newsUpdate.init();


