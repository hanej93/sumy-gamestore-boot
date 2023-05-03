let gameList = {
	init: function(){
		
		//게임 제목으로 검색
		$('#game-title-search-btn').on('click', ()=>{
			this.search();
		});
		
		$('#game-title-search').keydown((key) => {
 
		    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        this.search();
		    }
 
    	});

		//게임 삭제
		$("[id^='delBtn']").on("click",function(){
			let gameId = $(this).attr("gameId");
			gameList.delete(gameId);
		});
		
		// 확인 버튼의 모달이 꺼졌을 때 페이지 리로드
		$("#exampleModal4").on('hidden.bs.modal', function () {
			location.reload();			
		});
	},
	
	//게임 검색
	search: function(){
				
		var url = "/admin/game/list";

		url = url + "?nowPage=" + 1;

		url = url + "&keyword=" + $('#game-title-search').val();

		location.href = url;
	
	},
	
	//게임 삭제
	delete: function(gameId) {
		
		let data = {
			gameId:gameId
		}
		
		$.ajax({
			type:"DELETE", 
			url:"/admin/game/list",
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

gameList.init();



