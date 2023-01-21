/*-카카오페이 ajax 비동기 통신 부분-*/

$(function() {
	var total = $('#wishTotalPriceAfter1').html().replace(/,/g, '');


	//결제 api 호출
	$('#kakaoPayApiBtn').click(function() {
		if (total <= 0) {
			$.ajax({
				type: "POST",
				url: '/user/orderSuccess',
				dataType: "text",
				success: function(result) {
					console.log("0원 결제 성공");
					location.href="/user/orderSuccess";
				},
				error: function(err) {
					console.log("err" + err);
				}
			})
		}else {
			$.ajax({
				type: "POST",
				url: '/user/kakaoPayApi',
				data: total,
				contentType: "application/json;charset=utf-8",
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
	});
});