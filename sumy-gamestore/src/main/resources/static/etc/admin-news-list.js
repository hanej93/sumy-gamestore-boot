let newsList = {
	init: function(){
		$('#news-title-search-btn').on('click', ()=>{
			this.search();
		});
		
		$('#news-title-search').keydown((key) => {
 
		    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        this.search();
		    }
 
    	});

		// 해당 리포트 삭제
		$("[id^='delBtn']").on("click",function(){
			let newsId = $(this).attr("newsId");
			newsList.delete(newsId);
		});
		
		// 확인 버튼의 모달이 꺼졌을 때 페이지 리로드
		$("#exampleModal4").on('hidden.bs.modal', function () {
			location.reload();			
		});
	},
	
	search: function(){
				
		var url = "/admin/news/list";

		url = url + "?nowPage=" + 1;

		url = url + "&keyword=" + $('#news-title-search').val();

		location.href = url;
	
	},
	
	//뉴스 삭제
	delete: function(newsId) {
		
		let data = {
			newsId:newsId
		}
		
		$.ajax({
			type:"DELETE", 
			url:"/admin/news/list",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			$("[id^='exampleModal3']").modal("hide");
			$("#exampleModal4").modal("show");
			
			
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	}
}

newsList.init();



