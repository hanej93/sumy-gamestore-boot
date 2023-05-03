let userInfo = {
	init: function(){
		$('#user-nickname-search-btn').on('click', ()=>{
			this.search();
		});
		
		$('#user-nickname-search').keydown((key) => {
 
		    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        this.search();
		    }
 
    	});
		
		//블랙리스트 
		$('#blacklistYn-select').on('change', ()=>{
			this.search();
		});
		
		
		$("[id^='blacklist-checkbox']").on('change',function(){
			let checkBox =$(this);
			userInfo.blacklist(checkBox);
		});
		
		//유저 삭제
		$("[id^='delBtn']").on("click",function(){
			let userId = $(this).attr("userId");
			userInfo.delete(userId);
		});
		
		// 확인 버튼의 모달이 꺼졌을 때 페이지 리로드
		$("#exampleModal5").on('hidden.bs.modal', function () {
			location.reload();			
		});
		
		// 확인 버튼의 모달이 꺼졌을 때 페이지 리로드
		$("#exampleModal3").on('hidden.bs.modal', function () {
			location.reload();			
		});
		
		 //경고 횟수 추가
        $("[id^='sumy-warning-plus']").on("click",function(){
			let plusBtn = $(this);
        	userInfo.warningPlus(plusBtn);
        });

        //경고 횟수 감소
        $("[id^='sumy-warning-minus']").on("click",function(){
			let minusBtn = $(this);
        	userInfo.warningMinus(minusBtn);
        });

		// 모달이 켜졌을 때
		$("[id^='exampleModal1']").on('show.bs.modal', function () {
			// 유저 아이디로 정보 가져오기!!
			let data = {
				userId:$(this).attr("userid")
			}
			console.log($(this).attr("userid"));
			$.ajax({
				type:"post", 
				url:"/admin/user/memo",
				data:JSON.stringify(data),
				contentType:"application/json;charset=utf-8", 
				dataType:"json" 
			}).done(function(resp){ 
				console.log(resp);
				console.log(resp.data.userId);
				let userId = resp.data.userId;
				console.log(resp.data.userMemo);
				console.log(resp.data.userWarningCount);
				let userWarningCountStr = "#sumy-warning-num" + userId;
				let userMemoStr = "#userMemo" + userId;
				$(userMemoStr).val(resp.data.userMemo);
				$(userWarningCountStr).text(resp.data.userWarningCount);
				
			}).fail(function(error){ 
				console.log(error); 
				alert(JSON.stringify(error));
			});
			
			
	    });

		// 저장확인버튼 클릭했을 때
		$("[id^='saveBtn']").on('click', function () {
			// 수정된 것들 서버로 보내기!!
			let userIdStr = $(this).attr("userid");
			let userWarningCountStr = "#sumy-warning-num" + userIdStr;
			let userMemoStr = "#userMemo" + userIdStr;
			
			let data = {
				userId:$(this).attr("userid"),
				userWarningCount:$(userWarningCountStr).text(),
				userMemo:$(userMemoStr).val()
			}
			console.log($(userMemoStr).val());
			
			$.ajax({
				type:"PUT", 
				url:"/admin/user/memo",
				data:JSON.stringify(data),
				contentType:"application/json;charset=utf-8", 
				dataType:"json" 
			}).done(function(resp){ 
			}).fail(function(error){ 
				console.log(error); 
				alert(JSON.stringify(error));
			});
			
	    });
		
	},
	
	search: function(){
				
		var url = "/admin/user/list";

		url = url + "?nowPage=" + 1;

		url = url + "&keyword=" + $('#user-nickname-search').val();

		url = url + "&blacklistYn=" + $('#blacklistYn-select').val();

		location.href = url;
	
	},
	
	blacklist: function(blackListCheckBox) {
		console.log(blackListCheckBox.prop('checked'));
		var userBlacklist = 0;
		if(blackListCheckBox.prop('checked')){
			userBlacklist = 1;
		}
		
		
		let data = {
			userBlacklist:userBlacklist,
			userId:blackListCheckBox.attr("userId")
		};
		
		$.ajax({
			type:"PUT",
			url:"/admin/user/blacklist",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			console.log(resp);
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
		
	},
	
	warningPlus: function(plusBtn) {
		//let warningNum = $("#sumy-warning-num").text();
		//let warningNum = $("#sumy-warning-plus").parent().children("span").text();
		let warningNum = plusBtn.parent().children("span").text();
		
        if(warningNum < 3){
        }
        plusBtn.parent().children("span").text(Number(warningNum)+1);

	},
	
	warningMinus: function(minusBtn) {
		//let warningNum = $("#sumy-warning-num").text();
		let warningNum = minusBtn.parent().children("span").text();
        if(warningNum > 0){
            minusBtn.parent().children("span").text(Number(warningNum)-1);
        }
	},
	
	//유저 삭제
	delete: function(userId) {
		
		let data = {
			userId:userId
		}
		
		$.ajax({
			type:"DELETE", 
			url:"/admin/user/list",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			$("[id^='exampleModal4']").modal("hide");
			$("#exampleModal5").modal("show");
			
			
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	}
	
	
}

userInfo.init();



