
/*** 
 **
 *
 
	공용 custom function
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/

//1. 이메일 정규식 매칭 함수
//   사용처 - page-signup-1.html(회원가입), page-login-1.html(로그인)
function email_check(email) {
	var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return (email != '' && email != 'undefined' && regex.test(email));//210704 없애고 테스트해보기
}

//2. error클래스 활성화
//   사용처 - page-signup-1.html(회원가입), page-login-1.html(로그인)
function addError(input) {
	input.focus();
	input.parent().parent().addClass('u-has-error-v1');
	input.parent().parent().children('small').css('display', 'block');
}

//3. success클래스 활성화
//   사용처 - page-signup-1.html(회원가입), page-login-1.html(로그인)
function addSuccess(input) {
	input.focus();
	input.parent().parent().addClass('u-has-success-v1-1');
	input.parent().parent().children('small').css('display', 'block');
}

//4. error, success 클래스 초기화
//   사용처 - page-signup-1.html(회원가입), page-login-1.html(로그인)
function removeErrorAndSuccess(input) {
	if (input.parent().parent().is(".u-has-error-v1")) {
		input.parent().parent().removeClass('u-has-error-v1'); input.parent().parent().children('small').css('display', 'none');
	} else if (input.parent().parent().is(".u-has-success-v1-1")) {
		input.parent().parent().removeClass('u-has-success-v1-1'); input.parent().parent().children('small').css('display', 'none');
	}
}

//5. 비밀번호 유효성 함수(영문 대소문자 포함, 숫자 포함, 특수 문자 포함, 공백x, 비밀번호 8~20자)
//   사용처 - page-signup-1.html(회원가입), page-login-1.html(로그인)
function chkPW(password) {
	var num = password.search(/[0-9]/g);
	var eng = password.search(/[a-z]/ig);
	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if (password.length < 8 || password.length > 20) {
		return 0;//비밀번호 8자리 ~ 20자리 false
	} else if (password.search(/\s/) != -1) {
		return 1;//비밀번호 공백 false
	} else if (num < 0 || eng < 0 || spe < 0) {
		return 2;//비밀번호 영문+숫자+특수문자 false
	} else {
		return 3;
	}
}

//6. 비밀번호와 비밀번호 확인 매칭의 true/false 함수
//   사용처 - page-signup-1.html(회원가입)
function mathPwAndRePw(password, rePassword) {
	if (password != rePassword) {
		return false;
	} else {
		return true;
	}
}

//7. 오늘 날짜 구하는 함수
//   사용처 - page-signup-1.html(회원가입)
function todayDate() {
	var today = new Date();
	var yyyy = today.getFullYear();
	var mm = today.getMonth() + 1; //January is 0!
	var dd = today.getDate();
	if (dd < 10) {
		dd = '0' + dd;
	}
	if (mm < 10) {
		mm = '0' + mm;
	}
	today = yyyy + '-' + mm + '-' + dd;
	$("#birthDateInput").attr("max", today);
}

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

//11. string 을 받으면 value를 정규식으로 체크해서 다시 박는 함수
//   사용처 - page-login-security-1.html(회원정보수정), page-signup-1.html(회원가입)
function regixPhone(string) {
	var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
	console.log(string);
	if (!patternPhone.test(string)) {
		return false;
	}
	testPhone = string.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");

	return testPhone;
}

//12. string 을 받으면 한글과 영어만 사용가능하게 true/false
//    사용처 - page-signup-1.html(회원가입)
function hangulAndEnglish(string) {
	var pattern = /^[가-힣a-zA-Z]+$/;
	if (!pattern.test(string)) {
		return false;
	}
}

//13. 우편번호 API 호출 함수
//    사용처 - page-signup-1.html(회원가입)
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

//14. 우편번호 API 결과값 가져오는 함수
//    사용처 - page-signup-1.html(회원가입)
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$("form[name=userInfo] #zipNo").val(zipNo);
		$("form[name=userInfo] #addrDetail").val(addrDetail);
		$("form[name=userInfo] #roadAddrPart1").val(roadAddrPart1);
		
}

/*** 
 **
 *
 
	header fixed height custom script
	제목 : 헤더 fixed만큼 본문 마진주기
	작성자 : 김명주
	작성일 : 2021-07-05

***
**
*/


$(document).on('ready', function() {
	$('main').css('padding-top', '80px');
});


/*** 
 **
 *
 
	catalogue-page.html(카탈로그 화면) custom script
	제목 : 필터인덱스2
	작성자 : 한의진
	작성일 : 2021-06-25
	기능: 필터 초기화 이벤트
	설명:
	1. 초기화 버튼을 눌렀을 때 별 4개로 초기화
	2. 가격 20000 - 40000으로 초기화

***
**
*/



$(document).on('ready', function() {
	$("#catalogueFilterResetBtn").click(function() {
		$("h3:contains('별점')").next().children().addClass('g-color-primary click');
		$("h3:contains('별점')").next().children().last().removeClass('g-color-primary click');
		var slider = $("h3:contains('가격')").next().children();
		$("#rangeSliderAmount3").text("20000 - 40000");
	});

});




/*** 
 **
 *
 
	page-signup-1.html(회원가입) custom script
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/



$(document).ready(function() {
	var emailCode;//이메일로 받은 인증번호 전역변수

	//이메일 인증번호 전송 버튼
	$('#emailCertificationSendBtn').on('click', function() {
		//이메일 형식이 아닐 시 에러문구 띄우기
		if (!(email_check($('#emailInput').val()))) {
			addError($('#emailInput')); $('#emailInput').parent().parent().children('small').html('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
			return false;
		}
		//이메일 인증번호 보내는 시간이 너무 길어서 문구 띄워주기
		removeErrorAndSuccess($('#emailInput'));
		addSuccess($('#emailInput'));
		$('#emailInput').parent().parent().children('small').html('이메일을 보내고 있습니다. 잠시만 기다려주세요..');
		$.ajax({
			type: "GET",
			url: "checkMail?mail=" + $('#emailInput').val(),
			error: function(error) {
				alert("이메일을 확인해주세요.");
				return false;
			},

			success: function(result) {
				alert("인증 이메일을 전송했습니다.");
				emailCode = result;//인증코드 담는 변수
				console.log(emailCode);
				//인증번호 두 번째 입력 시 value 초기화
				$('#emailCertificationInput').val('');
				//이메일 유효성 통과했을 시 error클래스 있다면 삭제
				removeErrorAndSuccess($('#emailInput'));
				addSuccess($('#emailInput'));
				$('#emailInput').parent().parent().children('small').html('해당 이메일로 전송된 인증번호를 입력해주세요.');
				$('#emailInput').attr('readonly', true);
				$('#emailReBox').css('display', 'block');
				$('#emailCertificationSendBtn').text('재인증');
				$('#emailCertificationNumInput').css('display', 'block');
			}
		});
	});

	//메일주소 재입력 버튼 클릭할 때
	$('#emailReBtn').on('click', function() {
		//success 클래스 활성화 되있을 시 비활성화
		removeErrorAndSuccess($('#emailInput'));

		//이메일 인풋이 readonly상태일 때 메일주소 변경 버튼
		if ($('#emailInput').attr('readonly', true)) {
			$('#emailCertificationSendBox').css('display', 'block');
			$('#emailReBox').css('display', 'none');
			$('#emailInput').attr('readonly', false);
			$('#emailCertificationSendBtn').text('인증');
			$('#emailCertificationNumInput').css('display', 'none');
		}
	});

	//이메일 인증번호 확인 버튼
	$('#emailCertificationSubmitBtn').on('click', function() {
		removeErrorAndSuccess($('#emailInput'));
		//이메일 인증번호 입력 value가 비어있다면 false
		if ($('#emailCertificationInput').val() == "") {
			removeErrorAndSuccess($('#emailCertificationInput'));
			addError($('#emailCertificationInput'));
			$('#emailCertificationInput').parent().parent().children('small').html('이메일로 받은 인증번호를 입력해주세요.');
			return false;
		}
		if($('#emailCertificationInput').val() != emailCode){
			removeErrorAndSuccess($('#emailCertificationInput'));
			addError($('#emailCertificationInput'));
			$('#emailCertificationInput').parent().parent().children('small').html('인증번호와 일치하지 않습니다.');
			return false;
		}
		removeErrorAndSuccess($('#emailCertificationInput'));
		addSuccess($('#emailInput'));
		$('#emailInput').parent().parent().children('small').html('이메일 인증이 완료되었습니다.');
		$('#emailReBox').css('display', 'none');
		$('#emailCertificationNumInput').css('display', 'none');
		$('#emailCertificationSendBox').css('display', 'none');
		$('#emailReBox').css('display', 'block');
	});

	//비밀번호 입력 pocus 시 password off
	$('#passwordInput').focus(function() {
		$(this).attr('type', 'text');
	});

	//비밀번호 입력 blur 시 password on
	$('#passwordInput').blur(function() {
		$(this).attr('type', 'password');
	});

	//비밀번호 재입력 pocus 시 password off
	$('#rePasswordInput').focus(function() {
		$(this).attr('type', 'text');
	});

	//비밀번호 재입력 blur 시 password on
	$('#rePasswordInput').blur(function() {
		$(this).attr('type', 'password');
	});

	//회원가입 form submit
	$('#joinBtn').on('click', function() {
		//이메일 공란 check
		if ($('#emailInput').val() == "") {
			removeErrorAndSuccess($('#emailInput'));
			addError($('#emailInput'));
			$('#emailInput').parent().parent().children('small').html('이메일을 입력은 필수항목입니다.');
			return false;
		}

		//이메일 인증 공란 check
		if ($('#emailCertificationInput').val() == "") {
			removeErrorAndSuccess($('#emailInput'));
			addError($('#emailInput'));
			$('#emailInput').parent().parent().children('small').html('이메일 인증을 진행해주세요.');
			return false;
		}

		//비밀번호 유효성 함수 실행
		if ((chkPW($('#passwordInput').val())) < 3) {
			if ((chkPW($('#passwordInput').val())) == 0) {
				removeErrorAndSuccess($('#passwordInput'));
				addError($('#passwordInput'));
				$('#passwordInput').parent().parent().children('small').html('비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
				return false;
			} else if ((chkPW($('#passwordInput').val())) == 1) {
				removeErrorAndSuccess($('#passwordInput'));
				addError($('#passwordInput'));
				$('#passwordInput').parent().parent().children('small').html('비밀번호는 공백 없이 입력해주세요.');
				return false;
			} else if ((chkPW($('#passwordInput').val())) == 2) {
				removeErrorAndSuccess($('#passwordInput'));
				addError($('#passwordInput'));
				$('#passwordInput').parent().parent().children('small').html('비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.');
				return false;
			}
		} else {
			removeErrorAndSuccess($('#passwordInput'));
			//true일 시 비밀번호와 비밀번호 확인 매칭 함수 실행
			if (!(mathPwAndRePw($('#passwordInput').val(), $('#rePasswordInput').val()))) {
				removeErrorAndSuccess($('#rePasswordInput'));
				addError($('#rePasswordInput'));
				$('#rePasswordInput').parent().parent().children('small').html('비밀번호 확인 입력값은 비밀번호와 같아야 합니다.');
				return false;
			}
			removeErrorAndSuccess($('#rePasswordInput'));
		}

		//성명 공란일 시
		if ($('#nameInput').val() == "") {
			removeErrorAndSuccess($('#nameInput'));
			addError($('#nameInput'));
			$('#nameInput').parent().parent().children('small').html('성명 입력은 필수 항목입니다.');
			return false;
		}
		removeErrorAndSuccess($('#nameInput'));

		//성명 한글, 영문이 아닐 시
		if (hangulAndEnglish($('#nameInput').val()) == false) {
			removeErrorAndSuccess($('#nameInput'));
			addError($('#nameInput'));
			$('#nameInput').parent().parent().children('small').html('성명은 한글, 영문만 입력 가능합니다.');
			return false;
		}
		removeErrorAndSuccess($('#nameInput'));

		//별명 공란일 시
		if ($('#nickNameInput').val() == "") {
			removeErrorAndSuccess($('#nickNameInput'));
			addError($('#nickNameInput'));
			$('#nickNameInput').parent().parent().children('small').html('별명 입력은 필수 항목입니다.');
			return false;
		}
		removeErrorAndSuccess($('#nickNameInput'));

		//생년월일 공란일 시
		if ($('#birthDateInput').val() == "") {
			removeErrorAndSuccess($('#birthDateInput').parent());
			addError($('#birthDateInput').parent());
			$('#birthDateInput').parent().parent().parent().children('small').html('생년월일 입력은 필수 항목입니다.');
			return false;
		}
		removeErrorAndSuccess($('#birthDateInput').parent());

		//연락처 유효성 체크
		if ($('#phoneNumInput').val() != "") {//연락처가 선택항목이므로 만약 비어있지 않다면 밑에 실행
			if ((regixPhone($('#phoneNumInput').val())) == false) {
				removeErrorAndSuccess($('#phoneNumInput'));
				addError($('#phoneNumInput'));
				$('#phoneNumInput').parent().parent().children('small').html('핸드폰 번호를 확인 해주세요.');
				return false;
			}
			$('#phoneNumInput').val(regixPhone($('#phoneNumInput').val()));
			removeErrorAndSuccess($('#phoneNumInput'));

		}
		alert('회원가입 성공!');
	});//end joinBtn

	//resetBtn 클릭 시 이메일 input 제외하고 초기화
	$('#resetBtn').on('click', function() {
		$('#emailCertificationInput').val("");
		$('#passwordInput').val("");
		$('#rePasswordInput').val("");
		$('#nameInput').val("");
		$('#nickNameInput').val("");
		$('#birthDateInput').val("");
		$('#genderSelect').children($('option')).eq(0).prop("selected", true);
		$('#zipNo').val("");
		$('#roadAddrPart1').val("");
		$('#addrDetail').val("");
		$('#phoneNumInput').val("");
	});

	//오늘날짜 구하기 함수 실행
	todayDate();
});


/*** 
 **
 *
 
	page-login-1.html(로그인) custom script
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/

$(document).on('ready', function() {

	//로그인 버튼 클릭 시 
	$('#loginBtn').on('click', function() {
		//이메일 공란 check
		if ($('#emailInput').val() == "") {
			removeErrorAndSuccess($('#emailInput'));
			addError($('#emailInput'));
			$('#emailInput').parent().parent().children('small').html('이메일을 입력은 필수항목입니다.');
			return false;
		}

		//이메일 형식이 아닐 시 에러문구 띄우기
		if (!(email_check($('#emailInput').val()))) {
			addError($('#emailInput'));
			$('#emailInput').parent().parent().children('small').html('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
			return false;
		}
		//이메일 유효성 통과했을 시 error클래스 있다면 삭제
		removeErrorAndSuccess($('#emailInput'));

		//비밀번호 유효성 함수 실행
		//비밀번호 불일치일 시
		if ((chkPW($('#passwordInput').val())) < 3) {
			if ((chkPW($('#passwordInput').val())) == 0) {
				removeErrorAndSuccess($('#passwordInput'));
				addError($('#passwordInput'));
				$('#passwordInput').parent().parent().children('small').html('비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
				return false;
			} else if ((chkPW($('#passwordInput').val())) == 1) {
				removeErrorAndSuccess($('#passwordInput'));
				addError($('#passwordInput'));
				$('#passwordInput').parent().parent().children('small').html('비밀번호는 공백 없이 입력해주세요.');
				return false;
			} else if ((chkPW($('#passwordInput').val())) == 2) {
				removeErrorAndSuccess($('#passwordInput'));
				addError($('#passwordInput'));
				$('#passwordInput').parent().parent().children('small').html('비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.');
				return false;
			}
		}
		//비밀번호 유효성 통과했을 시 error클래스 있다면 삭제
		removeErrorAndSuccess($('#passwordInput'));
		alert('로그인 성공!');
	});
});



/*** 
 **
 *
 
	page-single-product-1.html(게임 상세 화면) custom script
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/


$(document).on('ready', function() {
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
		if (!confirm('리뷰 수정을 완료하시겠습니까?')) {
			return false;
		}
		$(this).parents().children($('.media-body')).children('p').css('display', 'block');
		$(this).parents().children($('.media-body')).children('form[name=reviewForm]').css('display', 'none');
		alert('리뷰 수정을 완료하였습니다.');
	});

	//리뷰 삭제하기 : delete review
	$('.reviewDeleteBtn').on('click', function() {
		if (!confirm('리뷰를 삭제하시겠습니까?')) {
			return false;
		}
		alert('리뷰를 삭제를 완료하였습니다.');
	});

	//리뷰 신고하기 : declaration(width declarationModal)
	$('#declarationBtn').on('click', function() {
		var declarationName = $('span#declarationName').text();

		if ($('#inputGroup2_2').val() == "") {
			alert('신고할 내용을 작성해주세요.');
			return false;
		}

		if (!confirm("'" + declarationName + "' 님을 신고하시겠습니까?")) {
			return false;
		}
		alert('신고가 완료되었습니다.');
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
		if (!confirm('리뷰 작성을 완료하시겠습니까?')) {
			return false;
		}
		alert('리뷰 작성을 완료하였습니다.');
		$(this).parents().children('form[name=reviewInsertForm]').css('display', 'none');
	});
});


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

	$('#wishTotalNum').text(delPriceAfter.length);
	$('#wishTotalPriceBefore').text(forComma(arrBeforeSumResult));
	$('#wishTotalDiscountRate').text(forComma(totalDiscountRate));
	$('#wishTotalPriceAfter').text(forComma(arrAfterSumResult));

	$('.deleteWish').on('click', function() {
		if (!confirm('선택된 리스트를 삭제하시겠습니까?')) {
			return false;
		}
		alert('선택된 위시리스트를 삭제했습니다.');
	});
});


/*** 
 **
 *
 
	page-help-1.html(문의하기 폼) custom script
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/

$(document).on('ready', function() {

	//문의하기 버튼
	$('#questionForSumyBtn').on('click', function() {
		if ($('#questionForSumyModalTitle').val() == "") {
			alert('문의할 내용의 제목을 입력해주세요.');
			return false;
		}

		if ($('#questionForSumyModalContents').val() == "") {
			alert('문의할 내용을 입력해주세요.');
			return false;
		}

		if (!confirm('문의하기를 완료하시겠습니까?')) {
			return false;
		}
		alert('문의하기를 완료하였습니다.');
	});
});


/*** 
 **
 *
 
	page-login-security-1.html(회원정보 수정 화면) custom script
	작성자 : 김명주
	작성일 : 2021-07-05

***
**
*/


$(document).on('ready', function() {

	//이름 수정 버튼
	$('#loginSecurityNameBtn').on('click', function() {
		$(this).css('display', 'none');
		$('form[name=nickNameForm]').css('display', 'block');
		$('#loginSecurityStarName').css('display', 'none');
		$('#loginSecurityNickNameTextArea').val($('#loginSecurityStarName').text());
	});

	//이름 수정완료 : update review
	$('#loginSecurityUpdateBtn').on('click', function() {
		if ($('#loginSecurityNickNameTextArea').val() == "") {

			alert('별명 수정을 완료해주세요.');
			return false;
		}

		if (!confirm('별명 수정을 완료하시겠습니까?')) {
			return false;
		}
		alert('별명 수정을 완료하였습니다.');

		$(this).css('display', 'inline-block');
		$('form[name=nickNameForm]').css('display', 'none');
		$('#loginSecurityStarName').css('display', 'block');
		$('#loginSecurityNameBtn').css('display', 'inline-block');
		$('#loginSecurityStarName').text($('#loginSecurityNickNameTextArea').val());
	});

	//이름 수정취소 : update review
	$('#loginSecurityCancelBtn').on('click', function() {
		$(this).css('display', 'inline-block');
		$('form[name=nickNameForm]').css('display', 'none');

		if (!confirm('별명 수정을 취소하시겠습니까?')) {
			return false;
		}
		alert('별명 수정을 취소하였습니다.');

		$('#loginSecurityStarName').css('display', 'block');
		$('#loginSecurityNameBtn').css('display', 'inline-block');
	});

	//비밀번호 수정 버튼
	$('#loginSecurityPasswordBtn').on('click', function() {
		$('#loginSecurityPwdUpdate').css('display', 'block');
		$('#loginSecurityPasswordBtn').css('display', 'none');
		$('#loginSecurityNowPwdDiv').css('display', 'none');
	});

	//현재 비밀번호 수정 입력 pocus 시 password off
	$('#loginSecurityUpdateNowPwd').focus(function() {
		$(this).attr('type', 'text');
	});

	//현재 비밀번호 수정 입력 blur 시 password on
	$('#loginSecurityUpdateNowPwd').blur(function() {
		$(this).attr('type', 'password');
	});

	//변경할 비밀번호 입력 pocus 시 password off
	$('#loginSecurityUpdateNewPwd').focus(function() {
		$(this).attr('type', 'text');
	});

	//변경할 비밀번호 입력 blur 시 password on
	$('#loginSecurityUpdateNewPwd').blur(function() {
		$(this).attr('type', 'password');
	});

	//변경할 비밀번호 재입력 pocus 시 password off
	$('#loginSecurityUpdateCheckNewPwd').focus(function() {
		$(this).attr('type', 'text');
	});

	//변경할 비밀번호 재입력 blur 시 password on
	$('#loginSecurityUpdateCheckNewPwd').blur(function() {
		$(this).attr('type', 'password');
	});

	//비밀번호 수정완료 : update review
	$('#loginSecurityUpdatePwdBtn').on('click', function() {
		if ($('#loginSecurityUpdateNowPwd').val() == "") {
			alert('현재 비밀번호 입력을 완료해주세요.');
			return false;
		}

		//true일 시 비밀번호와 비밀번호 확인 매칭 함수 실행
		if (!(mathPwAndRePw($('#loginSecurityNowPwd').val(), $('#loginSecurityUpdateNowPwd').val()))) {
			console.log('현재 비밀번호' + $('#loginSecurityNowPwd').val());
			console.log('현재 비밀번호 확인' + $('#loginSecurityUpdateNowPwd').val());
			alert('현재 비밀번호가 일치하지 않습니다.');
			return false;
		}

		//현재 비밀번호 유효성 함수 실행
		if ((chkPW($('#loginSecurityUpdateNowPwd').val())) < 3) {
			if ((chkPW($('#loginSecurityUpdateNowPwd').val())) == 0) {
				alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
				return false;
			} else if ((chkPW($('#loginSecurityUpdateNowPwd').val())) == 1) {
				alert("비밀번호는 공백 없이 입력해주세요.");
				return false;
			} else if ((chkPW($('#loginSecurityUpdateNowPwd').val())) == 2) {
				alert("비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				return false;
			}
		}

		if ($('#loginSecurityUpdateNewPwd').val() == "") {
			alert('새 비밀번호 입력을 완료해주세요.');
			return false;
		}

		//새 비밀번호 유효성 함수 실행
		if ((chkPW($('#loginSecurityUpdateNewPwd').val())) < 3) {
			if ((chkPW($('#loginSecurityUpdateNewPwd').val())) == 0) {
				alert("새 비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
				return false;
			} else if ((chkPW($('#loginSecurityUpdateNewPwd').val())) == 1) {
				alert("새 비밀번호는 공백 없이 입력해주세요.");
				return false;
			} else if ((chkPW($('#loginSecurityUpdateNewPwd').val())) == 2) {
				alert("새 비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				return false;
			}
		}

		if ($('#loginSecurityUpdateCheckNewPwd').val() == "") {
			alert('새 비밀번호 재입력을 완료해주세요.');
			return false;
		}

		//true일 시 새 비밀번호와 새 비밀번호 확인 매칭 함수 실행
		if (!(mathPwAndRePw($('#loginSecurityUpdateNewPwd').val(), $('#loginSecurityUpdateCheckNewPwd').val()))) {
			console.log('바꾸려는 비밀번호 위에' + $('#loginSecurityUpdateNewPwd').val());
			console.log('바꾸려는 비밀번호 아래' + $('#loginSecurityUpdateCheckNewPwd').val());
			alert('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.');
			return false;
		}

		if ($('#loginSecurityUpdateNewPwd').val() != $('#loginSecurityNowPwd').val()) {
			$('#loginSecurityNowPwd').val($('#loginSecurityUpdateNewPwd').val());
		}

		if (confirm('비밀번호 수정을 완료하시겠습니까?')) {
			alert('비밀번호 수정을 완료하였습니다.');
		}

		$(this).css('display', 'inline-block');
		$('#loginSecurityPwdUpdate').css('display', 'none');
		$('#loginSecurityPasswordBtn').css('display', 'inline-block');
		$('#loginSecurityNowPwdDiv').css('display', 'block');
		console.log($('#loginSecurityNowPwd').val());
	});

	//비밀번호 수정취소 : update review
	$('#loginSecurityCancelPwdBtn').on('click', function() {
		if (!confirm('비밀번호 수정을 취소하시겠습니까?')) {
			return false;
		}
		alert('비밀번호 수정을 취소하였습니다.');

		$(this).css('display', 'inline-block');
		$('#loginSecurityPwdUpdate').css('display', 'none');
		$('#loginSecurityPasswordBtn').css('display', 'inline-block');
		$('#loginSecurityNowPwdDiv').css('display', 'block');
	});

	//주소 수정 버튼
	$('#loginSecurityAddressBtn').on('click', function() {
		$('#loginSecurityAddressUpdate01').val($('#loginSecurityAddressNow01').text());
		$('#loginSecurityAddressUpdate02').val($('#loginSecurityAddressNow02').text());
		$('#loginSecurityAddressUpdate03').val($('#loginSecurityAddressNow03').text());
		$('#loginSecurityAddressDiv').css('display', 'none');
		$('#loginSecurityAddressBlock').css('display', 'block');
		$('#loginSecurityAddressBtn').css('display', 'none');
	});

	//주소 수정 완료 : update review
	$('#loginSecurityUpdateAddressBtn').on('click', function() {
		if ($('#loginSecurityAddressUpdate01').val() == "") {
			alert('우편번호 수정을 완료해주세요.');
			return false;
		}
		if ($('#loginSecurityAddressUpdate02').val() == "") {
			alert('주소 수정을 완료해주세요.');
			return false;
		}
		if ($('#loginSecurityAddressUpdate03').val() == "") {
			alert('상세주소 수정을 완료해주세요.');
			return false;
		}
		if (!confirm('주소 수정을 완료하시겠습니까?')) {
			return false;
		}
		alert('주소 수정을 완료하였습니다.');
		$('#loginSecurityAddressNow01').text($('#loginSecurityAddressUpdate01').val());
		$('#loginSecurityAddressNow02').text($('#loginSecurityAddressUpdate02').val());
		$('#loginSecurityAddressNow03').text($('#loginSecurityAddressUpdate03').val());

		$(this).css('display', 'inline-block');
		$('#loginSecurityAddressBlock').css('display', 'none');
		$('#loginSecurityAddressDiv').css('display', 'block');
		$('#loginSecurityAddressBtn').css('display', 'inline-block');
	});

	//주소 수정 취소 : update review
	$('#loginSecurityCancelAddressBtn').on('click', function() {
		if (!confirm('주소 수정을 취소하시겠습니까?')) {
			return false;
		}
		alert('주소 수정을 취소하였습니다.');

		$(this).css('display', 'inline-block');
		$('#loginSecurityAddressBlock').css('display', 'none');
		$('#loginSecurityAddressDiv').css('display', 'block');
		$('#loginSecurityAddressBtn').css('display', 'inline-block');
	});


	//핸드폰 번호 수정 버튼
	$('#loginSecurityNumberBtn').on('click', function() {
		$('#loginSecurityNumberForm').css('display', 'block');
		$('#loginSecurityNumberBtn').css('display', 'none');
		$('#loginSecurityNumber').css('display', 'none');
	});

	//핸드폰 번호 수정 완료 : update review
	$('#loginSecurityUpdateNumberBtn').on('click', function() {
		if ((regixPhone($('#loginSecurityNumberUpdate').val())) == false) {
			alert('핸드폰 번호를 확인 해주세요');
			return false;
		}
		if (!confirm('핸드폰 번호 수정을 완료하시겠습니까?')) {
			return false;
		}
		$('#loginSecurityNumberUpdate').val(regixPhone($('#loginSecurityNumberUpdate').val()));
		alert('핸드폰 번호 수정을 완료하였습니다.');
		$('#loginSecurityNumber').text($('#loginSecurityNumberUpdate').val());
		$(this).css('display', 'inline-block');
		$('#loginSecurityNumberForm').css('display', 'none');
		$('#loginSecurityNumberBtn').css('display', 'inline-block');
		$('#loginSecurityNumber').css('display', 'block');
	});

	//핸드폰 번호 수정 취소 : update review
	$('#loginSecurityCancelNumberBtn').on('click', function() {
		$(this).css('display', 'inline-block');

		if (!confirm('핸드폰 번호 수정을 취소하시겠습니까?')) {
			return false;
		}
		alert('핸드폰 번호 수정을 취소하였습니다.');

		$('#loginSecurityNumberForm').css('display', 'none');
		$('#loginSecurityNumberBtn').css('display', 'inline-block');
		$('#loginSecurityNumber').css('display', 'block');
	});

});


// 이미지 미리보기 custom script
// 작성자 : 김명주
// 작성일 : 2021-07-01

$(document).ready(function() {
	var targetUrl;
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			reader.onload = function(e) {
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				targetUrl = e.target.result;
				$('#blah').attr('src', targetUrl);
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				// $('#imgInp').parent().children('label').text(targetUrl);
			}
			reader.readAsDataURL(input.files[0]);
			//console.log(input.files[0]);
			//File내용을 읽어 dataURL형식의 문자열로 저장
		}
	} //readURL()--

	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#imgInp").change(function() {
		//alert(this.value); //선택한 이미지 경로 표시
		readURL(this);
	});

	//프로필 사진 변경 버튼
	$('#profileUpdateBtn').on('click', function() {
		if (!confirm('프로필 변경을 완료하시겠습니까?')) {
			alert('프로필 변경을 취소하였습니다.');
		}
		$('#blah2').attr('src', targetUrl);
		alert('프로필 변경을 완료하였습니다.');

	});
});

