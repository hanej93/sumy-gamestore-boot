/*** 
 **
 *
 
	공용 custom function
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/
//8. 문자열에서 숫자만 추출하는 함수
//   사용처 - page-wishlist-1.html(위시리스트)
function stringRegexNumber(stringNum) {
	var regex = /[^0-9]/g;
	var result = stringNum.replace(regex, "");
	var stringToNumber = parseInt(result);

	return stringToNumber;
}

//9. 배열을 받으면 덧셈하는 함수
//   사용처 - page-wishlist-1.html(위시리스트)
function arrSum(arr) {
	var arrSumResult = 0;
	for (var i = 0; i < arr.length; i++) {
		arrSumResult += arr[i];
	}
	return arrSumResult;
}

//10. number 을 받으면 콤마를 찍어주는 함수
//   사용처 - page-wishlist-1.html(위시리스트)
function forComma(number) {
	//const inputPriceNonComma = number.split(',').join('');
	const forCommaResult = String(number).replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return forCommaResult;
}



/*** 
 **
 *
 
	page-wishlist-1.html(위시리스트 화면) custom script
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/

$(document).ready(function() {
	var delPriceBefore = $('.priceBefore');

	var priceBeforeArr = [];//문자열에서 숫자만 추출하여 넣는 배열

	for (var i = 0; i < delPriceBefore.length; i++) {
		priceBeforeArr[i] = stringRegexNumber(delPriceBefore[i].innerText);
	}
	var arrBeforeSumResult = arrSum(priceBeforeArr);//배열넣으면 덧셈해주는 함수 결과 가져옴.

	var delPriceAfter = $('.priceAfter');
	var priceAfterArr = [];//문자열에서 숫자만 추출하여 넣는 배열
	for (var i = 0; i < delPriceAfter.length; i++) {
		priceAfterArr[i] = stringRegexNumber(delPriceAfter[i].innerText);
	}

	var arrAfterSumResult = arrSum(priceAfterArr);//배열넣으면 덧셈해주는 함수 결과 가져옴.
	var totalDiscountRate = arrBeforeSumResult - arrAfterSumResult;
	
	$('#totalAmount').val(arrAfterSumResult);

	$('#wishTotalNum').text(delPriceAfter.length);
	$('#wishTotalPriceBefore').text(forComma(arrBeforeSumResult));
	$('#wishTotalDiscountRate').text(forComma(totalDiscountRate));
	$('#wishTotalPriceAfter').text(forComma(arrAfterSumResult));

	$('.deleteWish').on('click', function() {
		if (!confirm('선택된 리스트를 삭제하시겠습니까?')) {
			return false;
		}
		
		let data = {
			wishlistId:$(this).attr("wishlistId")
		};
		
		
		$.ajax({
			type:"DELETE",
			url:"/user/wishlist",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			alert('선택된 위시리스트를 삭제했습니다.');
			location.reload();
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
		
		
	});
});