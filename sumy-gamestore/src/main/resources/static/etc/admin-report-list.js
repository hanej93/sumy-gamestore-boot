let reportList = {
	init: function(){
		
		// 닉네임(신고대상)으로 검색
		$('#report-nickname-search-btn').on('click', ()=>{
			this.search();
		});
		
		$('#report-nickname-search').keydown((key) => {
 
		    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        this.search();
		    }
 
    	});
		
		// 읽음 상태에 따른 조회
		$('#reportReadYn-select').on('change', ()=>{
			this.search();
		});
		
		// 읽음 상태 변경
		$("[id^='readYn-checkbox']").on('change',function(){
			let checkBox =$(this);
			reportList.updateReadYn(checkBox);
		});
		
		
		// 경고 횟수 추가
        $("[id^='sumy-warning-plus']").on("click",function(){
			let plusBtn = $(this);
        	reportList.warningPlus(plusBtn);
        });

        // 경고 횟수 감소
        $("[id^='sumy-warning-minus']").on("click",function(){
			let minusBtn = $(this);
        	reportList.warningMinus(minusBtn);
        });

		// 해당 리포트 삭제
		$("[id^='delBtn']").on("click",function(){
			let reportId = $(this).attr("reportId");
			reportList.delete(reportId);
		});
		
			
		// 해당 댓글(리뷰) 삭제
		$("[id^='delReviewBtn']").on("click",function(){
			let reviewId = $(this).attr("reviewId");
			reportList.deleteReview(reviewId);
		});
		
		// 모달이 켜졌을 때 읽음 상태로 변경
		$("[id^='exampleModal1']").on('shown.bs.modal', function () {
			let reportId = $(this).attr("reportId");
			reportList.updateReadYes(reportId); 
		});
		
		// 모달이 꺼졌을 때 경고횟수 저장
		$("[id^='exampleModal1']").on('hidden.bs.modal', function () {
			let modal = $(this);
			var toUserId = modal.attr("toUserId");
			var reportId = modal.attr("reportId");
			
			let userWarningCountStr = "#sumy-warning-num" + reportId;
			
			var data = {
				toUserId:toUserId,
				toUserWarningCount:$(userWarningCountStr).text()
				
			}
			
			$.ajax({
				type:"put", 
				url:"/admin/report/memo",
				data:JSON.stringify(data),
				contentType:"application/json;charset=utf-8", 
				dataType:"json" 
			}).done(function(resp){ 
				location.reload();
			}).fail(function(error){ 
				console.log(error); 
				alert(JSON.stringify(error));
			});
			
		});
		
		
		// 확인 버튼의 모달이 꺼졌을 때 모든 모달 닫기
		$("#exampleModal3").on('hidden.bs.modal', function () {
			
			$("[id^='exampleModal1']").modal('hide');
		});
		
		// 확인 버튼의 모달이 꺼졌을 때 페이지 리로드
		$("#exampleModal5").on('hidden.bs.modal', function () {
			location.reload();			
		});

	},
	
	// 페이지 GET 요청
	search: function(){
				
		var url = "/admin/report/list";

		url = url + "?nowPage=" + 1;

		url = url + "&keyword=" + $('#report-nickname-search').val();
		
		url = url + "&reportReadYn=" + $('#reportReadYn-select').val();

		location.href = url;
	
	},
	
	// 읽음상태 수정
	updateReadYn: function(checkBox) {
		console.log(checkBox.prop('checked'));
		var reportReadYn = 0;
		if(checkBox.prop('checked')){
			reportReadYn = 1;
		}
		
		
		let data = {
			reportReadYn:reportReadYn,
			reportId:checkBox.attr("reportId")
		};
		
		$.ajax({
			type:"PUT",
			url:"/admin/report/readYn",
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
	
	// 경고 증가
	warningPlus: function(plusBtn) {
		let warningNum = plusBtn.parent().children("span").text();
		
        if(warningNum < 3){
        }
        plusBtn.parent().children("span").text(Number(warningNum)+1);

	},
	
	// 경고 감소
	warningMinus: function(minusBtn) {
		let warningNum = minusBtn.parent().children("span").text();
        if(warningNum > 0){
            minusBtn.parent().children("span").text(Number(warningNum)-1);
        }
	},
	
	// 신고리스트 삭제
	delete: function(reportId) {
		
		let data = {
			reportId:reportId
		}
		console.log(reportId);
		
		$.ajax({
			type:"DELETE", 
			url:"/admin/report/list",
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
	},
	
	deleteReview: function(reviewId) {
		
		let data = {
			reviewId:reviewId
		}
		
		$.ajax({
			type:"DELETE", 
			url:"/admin/report/review",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			$("[id^='exampleModal2']").modal('hide');
			if(resp.data == 1){
				$("#exampleModal3").modal('show');
			} else{
				alert("해당 댓글은 이미 삭제되었습니다.");
			}
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	},


	// 읽음상태로 변경	
	updateReadYes: function(reportId) {
		
		let data = {
			reportId:reportId,
			reportReadYn:1
		}
		
		$.ajax({
			type:"PUT",
			url:"/admin/report/readYn",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			console.log(resp);
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	}
	
	
	
}

reportList.init();



