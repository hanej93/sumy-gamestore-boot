/*** 
 **
 *
	작성자 : 김명주
	작성일 : 2021-07-01

***
**
*/
//6. 비밀번호와 비밀번호 확인 매칭의 true/false 함수
//   사용처 - page-signup-1.html(회원가입)
function mathPwAndRePw(password, rePassword) {
	if (password != rePassword) {
		return false;
	} else {
		return true;
	}
}

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


	
	$('#passwordEye').on('click',function(){
		$('#loginSecurityUpdateNewPwd').toggleClass('active');
        if($('#loginSecurityUpdateNewPwd').hasClass('active')){
            $('#loginSecurityUpdateNewPwd').prop('type',"text");
			$('#passwordEye').toggleClass('fa-eye-slash fa-eye');
        }else{
            $('#loginSecurityUpdateNewPwd').prop('type','password');
			$('#passwordEye').toggleClass('fa-eye-slash fa-eye');
        }	
		
	});
	
	$('#passwordEye2').on('click',function(){
		$('#loginSecurityUpdateCheckNewPwd').toggleClass('active');
        if($('#loginSecurityUpdateCheckNewPwd').hasClass('active')){
            $('#loginSecurityUpdateCheckNewPwd').prop('type',"text");
			$('#passwordEye2').toggleClass('fa-eye-slash fa-eye');
        }else{
            $('#loginSecurityUpdateCheckNewPwd').prop('type','password');
			$('#passwordEye2').toggleClass('fa-eye-slash fa-eye');
        }	
		
	});
	


/*** 
 **
 *
 
	page-password-recovery-1(비밀번호 찾기) custom script
	작성자 : 김명주
	작성일 : 2021-07-15

***
**
*/

$(document).ready(function() {
	var emailCode;//이메일로 받은 인증번호 전역변수

	//이메일 인증번호 전송 버튼
	$('#emailCertificationSendBtn').on('click', function() {
		//이메일 형식이 아닐 시 에러문구 띄우기
		if (!(email_check($('#userEmail').val()))) {
			addError($('#userEmail')); $('#userEmail').parent().parent().children('small').html('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
			return false;
		}

		//로그인 상태가 아닐 때
		if ($('#hideEmail').val() == "") {
			removeErrorAndSuccess($('#userEmail'));
			addSuccess($('#userEmail'));

			$.ajax({
				type: "POST",
				url: "/selectEmail",
				data: {"userEmail": $('#userEmail').val()},
				error: function(error) {
					alert("이메일을 확인해주세요.");
					return false;
				},

				success: function(result) {
					if (result==0) {
						removeErrorAndSuccess($('#userEmail'));
						addError($('#userEmail'));
						$('#userEmail').parent().parent().children('small').html('등록된 이메일이 아닙니다.');
						return false;
					}
					$('#upuserId').val(result);
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
							$('#emailCertificationSendBtn').text('재인증');
							$('#emailCertificationNumInput').css('display', 'block');
						}
					});
				}
			});

		} else {//로그인 되어있을 때
			//작성한 이메일과 로그인된 이메일이 일치하지 않을 때
			if ($('#userEmail').val() != $('#hideEmail').val()) {
				addError($('#userEmail')); $('#userEmail').parent().parent().children('small').html('로그인 이메일과 같은 이메일이어야 합니다.');
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
					if (result == null || result == 'null' || result == "null") {
						alert("가입한 이메일 주소와 일치해야 합니다.");
						removeErrorAndSuccess($('#userEmail'));
						return false;
					}
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
					$('#emailCertificationSendBtn').text('재인증');
					$('#emailCertificationNumInput').css('display', 'block');
				}
			});
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
		if ($('#emailCertificationInput').val() != emailCode) {
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
		$('#emailReBox').css('display', 'none');
		$('#rePasswordFirst').css('display', 'none');
		$('#rePasswordLast').css('display', 'block');
		$('#loginSecurityUpdateEmail').val($('#userEmail').val());
	});
/*
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
*/
	//비밀번호 수정완료 : update review
	$('#loginSecurityUpdatePwdBtn').on('click', function() {
		if ($('#loginSecurityUpdateNowPwd').val() == "") {
			alert('현재 비밀번호 입력을 완료해주세요.');
			return false;
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

		if (!confirm('비밀번호 수정을 완료하시겠습니까?')) {
			alert('비밀번호 수정을 취소했습니다.');
			return false;
		}
		var queryString = $("form[name=pwdRecoveryForm]").serialize();
		console.log("쿼리스트링" + queryString);

		$.ajax({
			type: 'post',
			url: '/pwdRecoveryUpdate',
			data: queryString,
			dataType: 'json',
			error: function(xhr, status, error) {
				//alert(xhr);
			},
			success: function(json) {
				console.log("비밀번호 수정 성공");
			}
		});
		alert('비밀번호 수정을 완료하였습니다.');
		if($('#userId').val()==""){
			location.href = "/home-page";
			return false;
		}
		location.href = "/user/login-security";
	});

	//비밀번호 수정취소 : update review
	$('#loginSecurityCancelPwdBtn').on('click', function() {
		if (!confirm('비밀번호 수정을 취소하시겠습니까?')) {
			return false;
		}
		alert('비밀번호 수정을 취소하였습니다.');

		location.reload();


	});
});