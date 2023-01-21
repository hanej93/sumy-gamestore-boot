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


let mygameList = {
	init: function(){
		
		//게임 제목으로 검색
		$('#mygame-title-search-btn').on('click', ()=>{
			this.search();
		});

		$("#orderOpt").on('change', ()=>{
			this.search();
		});
		
	    $('#mygame-title-search').keydown((key) => {
 
		    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        this.search();
		    }
 
    	});
		// 확인 버튼의 모달이 꺼졌을 때 페이지 리로드
		/*$("#exampleModal4").on('hidden.bs.modal', function () {
			location.reload();			
		});*/
	},
	
	//게임 검색
	search: function(){
				
		var url = "/user/purchased";

		url = url + "?nowPage=" + 1;

		url = url + "&keyword=" + $('#mygame-title-search').val();
		
		url = url + "&orderOpt=" + $('#orderOpt').val();

		location.href = url;
	
	}
}

mygameList.init();