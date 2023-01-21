
/*** 
 **
 *
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
	$("#userBirthDate").attr("max", today);
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
		$("form[name=userInfo] #userZipCode").val(zipNo);
		$("form[name=userInfo] #userDetailAddress").val(addrDetail);
		$("form[name=userInfo] #userAddress").val(roadAddrPart1);
		
}

	
	$('#passwordEye').on('click',function(){
		$('#userPassword').toggleClass('active');
        if($('#userPassword').hasClass('active')){
            $('#userPassword').prop('type',"text");
			$('#passwordEye').toggleClass('fa-eye-slash fa-eye');
        }else{
            $('#userPassword').prop('type','password');
			$('#passwordEye').toggleClass('fa-eye-slash fa-eye');
        }	
		
	});
	
	$('#passwordEye2').on('click',function(){
		$('#rePasswordInput').toggleClass('active');
        if($('#rePasswordInput').hasClass('active')){
            $('#rePasswordInput').prop('type',"text");
			$('#passwordEye2').toggleClass('fa-eye-slash fa-eye');
        }else{
            $('#rePasswordInput').prop('type','password');
			$('#passwordEye2').toggleClass('fa-eye-slash fa-eye');
        }	
		
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
	
	//프로필 사진 변경 버튼
	$('#profileSignUpBtn').on('click', function() {
		var form = $('#fileForm')[0];
		var formData = new FormData(form);

		formData.append('file', $('#imgInp')[0].files[0]);
		$.ajax({
			type: 'POST',
			url: '/profileImgUpdate',
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			data: formData,
		}).done(function(result) {
			console.log("파일전송 성공");
			/*if (!confirm('프로필 변경을 완료하시겠습니까?')) {
				alert('프로필 변경을 취소하였습니다.');
				return false;
			}*/
			$('#userProfileImage').attr('value', result);
			alert('프로필 변경을 완료하였습니다.');
			$("#profileUpdateModal").modal('hide');
			$('#blah2').prop('src', result);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	});
	
	
	var emailCode;//이메일로 받은 인증번호 전역변수

	//이메일 인증번호 전송 버튼
	$('#emailCertificationSendBtn').on('click', function() {
		//이메일 형식이 아닐 시 에러문구 띄우기
		if (!(email_check($('#userEmail').val()))) {
			addError($('#userEmail')); $('#userEmail').parent().parent().children('small').html('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
			return false;
		}
		//이메일 인증번호 보내는 시간이 너무 길어서 문구 띄워주기
		removeErrorAndSuccess($('#userEmail'));
		addSuccess($('#userEmail'));
		$('#userEmail').parent().parent().children('small').html('이메일을 보내고 있습니다. 잠시만 기다려주세요..');
		$.ajax({
			type: "GET",
			url: "checkMail?mail=" + $('#userEmail').val(),
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
				removeErrorAndSuccess($('#userEmail'));
				addSuccess($('#userEmail'));
				$('#userEmail').parent().parent().children('small').html('해당 이메일로 전송된 인증번호를 입력해주세요.');
				$('#userEmail').attr('readonly', true);
				$('#emailReBox').css('display', 'block');
				$('#emailCertificationSendBtn').text('재인증');
				$('#emailCertificationNumInput').css('display', 'block');
			}
		});
	});

	//메일주소 재입력 버튼 클릭할 때
	$('#emailReBtn').on('click', function() {
		//success 클래스 활성화 되있을 시 비활성화
		removeErrorAndSuccess($('#userEmail'));

		//이메일 인풋이 readonly상태일 때 메일주소 변경 버튼
		if ($('#userEmail').attr('readonly', true)) {
			$('#emailCertificationSendBox').css('display', 'block');
			$('#emailReBox').css('display', 'none');
			$('#userEmail').attr('readonly', false);
			$('#emailCertificationSendBtn').text('인증');
			$('#emailCertificationNumInput').css('display', 'none');
		}
	});

	//이메일 인증번호 확인 버튼
	$('#emailCertificationSubmitBtn').on('click', function() {
		removeErrorAndSuccess($('#userEmail'));
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
		addSuccess($('#userEmail'));
		$('#userEmail').parent().parent().children('small').html('이메일 인증이 완료되었습니다.');
		$('#emailReBox').css('display', 'none');
		$('#emailCertificationNumInput').css('display', 'none');
		$('#emailCertificationSendBox').css('display', 'none');
		$('#emailReBox').css('display', 'block');
	});
/*
	//비밀번호 입력 pocus 시 password off
	$('#userPassword').focus(function() {
		$(this).attr('type', 'text');
	});

	//비밀번호 입력 blur 시 password on
	$('#userPassword').blur(function() {
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
*/
	//회원가입 form submit
	$('#joinBtn').on('click', function() {
		//이메일 공란 check
		if ($('#userEmail').val() == "") {
			removeErrorAndSuccess($('#userEmail'));
			addError($('#userEmail'));
			$('#userEmail').parent().parent().children('small').html('이메일을 입력은 필수항목입니다.');
			return false;
		}

		//이메일 인증 공란 check
		if ($('#emailCertificationInput').val() == "") {
			removeErrorAndSuccess($('#userEmail'));
			addError($('#userEmail'));
			$('#userEmail').parent().parent().children('small').html('이메일 인증을 진행해주세요.');
			return false;
		}

		//비밀번호 유효성 함수 실행
		if ((chkPW($('#userPassword').val())) < 3) {
			if ((chkPW($('#userPassword').val())) == 0) {
				removeErrorAndSuccess($('#userPassword'));
				addError($('#userPassword'));
				$('#userPassword').parent().parent().children('small').html('비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.');
				return false;
			} else if ((chkPW($('#userPassword').val())) == 1) {
				removeErrorAndSuccess($('#userPassword'));
				addError($('#userPassword'));
				$('#userPassword').parent().parent().children('small').html('비밀번호는 공백 없이 입력해주세요.');
				return false;
			} else if ((chkPW($('#userPassword').val())) == 2) {
				removeErrorAndSuccess($('#userPassword'));
				addError($('#userPassword'));
				$('#userPassword').parent().parent().children('small').html('비밀번호는 영문,숫자, 특수문자를 혼합하여 입력해주세요.');
				return false;
			}
		} else {
			removeErrorAndSuccess($('#userPassword'));
			//true일 시 비밀번호와 비밀번호 확인 매칭 함수 실행
			if (!(mathPwAndRePw($('#userPassword').val(), $('#rePasswordInput').val()))) {
				removeErrorAndSuccess($('#rePasswordInput'));
				addError($('#rePasswordInput'));
				$('#rePasswordInput').parent().parent().children('small').html('비밀번호 확인 입력값은 비밀번호와 같아야 합니다.');
				return false;
			}
			removeErrorAndSuccess($('#rePasswordInput'));
		}

		//성명 공란일 시
		if ($('#userName').val() == "") {
			removeErrorAndSuccess($('#userName'));
			addError($('#userName'));
			$('#userName').parent().parent().children('small').html('성명 입력은 필수 항목입니다.');
			return false;
		}
		removeErrorAndSuccess($('#userName'));

		//성명 한글, 영문이 아닐 시
		if (hangulAndEnglish($('#userName').val()) == false) {
			removeErrorAndSuccess($('#userName'));
			addError($('#userName'));
			$('#userName').parent().parent().children('small').html('성명은 한글, 영문만 입력 가능합니다.');
			return false;
		}
		removeErrorAndSuccess($('#userName'));

		//별명 공란일 시
		if ($('#userNickname').val() == "") {
			removeErrorAndSuccess($('#userNickname'));
			addError($('#userNickname'));
			$('#userNickname').parent().parent().children('small').html('별명 입력은 필수 항목입니다.');
			return false;
		}
		removeErrorAndSuccess($('#userNickname'));

		//생년월일 공란일 시
		if ($('#userBirthDate').val() == "") {
			removeErrorAndSuccess($('#userBirthDate').parent());
			addError($('#userBirthDate').parent());
			$('#userBirthDate').parent().parent().parent().children('small').html('생년월일 입력은 필수 항목입니다.');
			return false;
		}
		removeErrorAndSuccess($('#userBirthDate').parent());

		//연락처 유효성 체크
		if ($('#userPhoneNumber').val() != "") {//연락처가 선택항목이므로 만약 비어있지 않다면 밑에 실행
			if ((regixPhone($('#userPhoneNumber').val())) == false) {
				removeErrorAndSuccess($('#userPhoneNumber'));
				addError($('#userPhoneNumber'));
				$('#userPhoneNumber').parent().parent().children('small').html('핸드폰 번호를 확인 해주세요.');
				return false;
			}
			$('#userPhoneNumber').val(regixPhone($('#userPhoneNumber').val()));
			removeErrorAndSuccess($('#userPhoneNumber'));

		}
		
		//form 안넘기는 항목 disabled
		$("#emailCertificationInput").attr("disabled", true);
		$("#rePasswordInput").attr("disabled", true);
		alert('회원가입 성공!');
	});//end joinBtn

	//resetBtn 클릭 시 이메일 input 제외하고 초기화
	$('#resetBtn').on('click', function() {
		$('#emailCertificationInput').val("");
		$('#userPassword').val("");
		$('#rePasswordInput').val("");
		$('#userName').val("");
		$('#userNickname').val("");
		$('#userBirthDate').val("");
		$('#userGender').children($('option')).eq(0).prop("selected", true);
		$('#userZipCode').val("");
		$('#userAddress').val("");
		$('#userDetailAddress').val("");
		$('#userPhoneNumber').val("");
	});

	//오늘날짜 구하기 함수 실행
	todayDate();
});