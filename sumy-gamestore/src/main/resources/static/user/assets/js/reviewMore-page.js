let singleProduct = {
	init: function() {

		// 이벤트

	},
	purchase: function(gameId) {
		console.log("ajax 보내기 전 gameId : "+$("form[name='singlePaymentForm'] input[name='gameId']").val());
		console.log("ajax 보내기 전 gamePrice : "+$("form[name='singlePaymentForm'] input[name='gamePrice']").val());
		$("form[name='singlePaymentForm'] input[name='gamePrice']").val(Math.floor($("form[name='singlePaymentForm'] input[name='gamePrice']").val()));
		var singlePaymentForm = $("form[name='singlePaymentForm']").serialize();
		sessionStorage.setItem("gameId", $("form[name='singlePaymentForm'] input[name='gameId']").val());


		if ($("form[name='singlePaymentForm'] input[name='gamePrice']").val() <= 0) {
			$.ajax({
				type: "POST",
				url: '/user/orderSuccess2',
				data:singlePaymentForm,
				dataType: "json",
				success: function(result) {
					console.log("0원 결제 성공");
					location.href="/user/orderSuccess2";
				},
				error: function(err) {
					console.log("err" + err);
				}
			})
		}else {
			$.ajax({
				type: "POST",
				url: '/user/kakaoPayApi2',
				data:singlePaymentForm,
				dataType: "json",
				success: function(result) {
					if (result == "free") {
						free();
					}
					var resultBox = result.next_redirect_pc_url;
					window.open(resultBox);
				},
				error: function(err) {
					console.log("err" + err);
				}
			})
		}
	}
}
singleProduct.init();

$(document).on('ready', function() {
	$('#purchaseBtn').on('click', function(){
		
		let gameId = $(this).attr('gameId');

		
		$.ajax({
			type:"POST",
			url:"/user/selectPurchasedGameYN",
			data:JSON.stringify(gameId),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			singleProduct.purchase(gameId);
			console.log(resp);
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	});
	
	//리뷰 수정하기 : p, textarea toggle
	$('.reviewUpdateBtn').on('click', function() {
		//리뷰 수정 전 p값 가져와서 input에 넣기.
		$('.reviewUpdateInput').val($(this).parents($('.media-body')).children('p').html().trim());
		$(this).parents().children($('.media-body')).children('p').css('display', 'none');
		$(this).parents().children($('.media-body')).children('form[name=reviewForm]').css('display', 'block');
	});

	//리뷰 취소
	$('.reviewFormReset').on('click', function() {
		if (!confirm('작성중인 리뷰를 나가시겠습니까?')) {
			return false;
		}
		$(this).parents().children($('.media-body')).children('p').css('display', 'block');
		$(this).parents().children($('.media-body')).children('form[name=reviewForm]').css('display', 'none');
	});

	//리뷰 수정완료 : update review
	$('.reviewFormComplete').on('click', function() {
		if ($(this).parent().parent().parent().children().first().children($('#reviewUpdateInput')).val() == "") {
			console.log("dd2");
			alert("수정할 리뷰 내용이 없습니다.");
			return false;
		}
		
		let reviewId = $(this).attr('reviewId');
		let updateWriteTextStr = "#updateWriteText" + reviewId;
		let updateWriteStarStr = "#updateWriteStar" + reviewId;
		
		
		if($(updateWriteStarStr).children('.g-color-primary').length == 0){
			alert("별점을 입력해주세요.");
			return false;
		}
		
		
		if (!confirm('리뷰 수정을 완료하시겠습니까?')) {
			return false;
		}
		$(this).parents().children($('.media-body')).children('p').css('display', 'block');
		$(this).parents().children($('.media-body')).children('form[name=reviewForm]').css('display', 'none');
		
		


		let data = {
			reviewId:reviewId,
			reviewText:$(updateWriteTextStr).val(),
			reviewStarRating:$(updateWriteStarStr).children('.g-color-primary').length
		};
		
		$.ajax({
			type:"PUT",
			url:"/sumy/game/review",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			alert('리뷰 수정을 완료하였습니다.');
			location.reload();
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
		
	});

	//리뷰 삭제하기 : delete review
	$('.reviewDeleteBtn').on('click', function() {
		if (!confirm('리뷰를 삭제하시겠습니까?')) {
			return false;
		}
		
		let data = {
			reviewId:$(this).attr("reviewId")
		};
		
		
		$.ajax({
			type:"DELETE",
			url:"/sumy/game/review",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			alert('리뷰를 삭제를 완료하였습니다.');
			location.reload();
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
		
	});


	//리뷰 신고하기 : declaration(width declarationModal)
	$("[id^='declarationBtn']").on('click', function() {
		let reviewId = $(this).attr("reviewId");
		let declarationNameStr = "#declarationName" + reviewId;
		let declarationTextStr = "#declarationText" + reviewId;
		
		if ($(declarationTextStr).val() == "") {
			alert('신고할 내용을 작성해주세요.');
			return false;
		}

		if (!confirm("'" + $(declarationNameStr).text() + "' 님을 신고하시겠습니까?")) {
			return false;
		}
		let data = {
			reviewId:reviewId,
			reportFromUserId:$(this).attr("principalUserId"),
			reportText:$(declarationTextStr).val()
		};
		
		$.ajax({
			type:"POST",
			url:"/sumy/game/review/report",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			alert('신고가 완료되었습니다.');
			$("[id^='declarationModal']").modal('hide');
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
		
		
	});

	// 자세히보기 인덱스1
	$("#detailsBtn").on("click", () => {
		$("#details").toggleClass("line--clamp");
		$('#detailsBtn').text($('#detailsBtn').text() == '자세히 보기' ? '간략히 보기' : '자세히 보기');
	});

});



/*** 
 **
 *
 
	reviewMore-page.html(리뷰 상세 화면) custom script
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/


$(document).on('ready', function() {
	//리뷰 작성하기
	//DB연동 가능해 질 때, 구매 고객이 인입하게 되었을때 이것 삭제하기.
	$('form[name=reviewInsertForm]').css('display', 'block');

	$('#reviewUpdateCompleteBtn').on('click', function() {
		if ($('#riviewInsertTestarea').val() == "") {
			alert('리뷰를 입력해주세요.');
			return false;
		}
		
		if($("#reviewWriteStar").children('.g-color-primary').length == 0){
			alert("별점을 입력해주세요.");
			return false;
		}
		
		if (!confirm('리뷰 작성을 완료하시겠습니까?')) {
			return false;
		}
		
		
		
		
		let data = {
			gameId:$(this).attr("gameId"),
			userId:$(this).attr("userId"),
			reviewText:$(riviewInsertTestarea).val(),
			reviewStarRating:$("#reviewWriteStar").children('.g-color-primary').length
		};
		
		
		$.ajax({
			type:"POST",
			url:"/sumy/game/review",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			alert('리뷰 작성을 완료하였습니다.');
			location.reload();
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	});
	
	// 위시리스트 추가/삭제
	$("#wishlist-btn").on("click", function(){
		
		let gameId = $(this).attr("gameId");
		
		$.ajax({
			type:"POST",
			url:"/user/wishlist",
			data:JSON.stringify(gameId),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			if(resp == 1){
				$("#wishlist-btn").toggleClass('u-btn-bluegray');
				$("#wishlist-btn").toggleClass('u-btn-black');
				//$('#wishlist-btn span').text($('#wishlist-btn span').text() == '위시리스트 담기' ? '위시리스트 있음' : '위시리스트 담기');
				if($('#wishlist-btn span').text() == '위시리스트 담기'){
					$('#wishlist-btn span').text('위시리스트 있음');
					$("#wishlist-btn").attr('data-original-title','해당 게임이 위시리스트에 담겨졌습니다.');
					$("#wishlist-btn").tooltip('show');
					setTimeout(function() {
					    $("#wishlist-btn").tooltip('hide');
					}, 1000);
				} else {
					$('#wishlist-btn span').text('위시리스트 담기');
					$("#wishlist-btn").attr('data-original-title','해당 게임이 위시리스트에서 제거되었습니다.');
					$("#wishlist-btn").tooltip('show');
					setTimeout(function() {
					    $("#wishlist-btn").tooltip('hide');
					}, 1000);
				}
			}
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	});
});