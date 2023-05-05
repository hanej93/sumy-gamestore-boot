
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
	
	/*//비밀번호 입력 pocus 시 password off
	$('#userPassword').focus(function() {
		$(this).attr('type', 'text');
	});

	//비밀번호 입력 blur 시 password on
	$('#userPassword').blur(function() {
		$(this).attr('type', 'password');
	});*/


	
	$('#loginForm').on('submit', function() {
		//이메일 공란 check
		if ($('#userEmail').val() == "") {
			removeErrorAndSuccess($('#userEmail'));
			addError($('#userEmail'));
			$('#userEmail').parent().parent().children('small').html('이메일을 입력은 필수항목입니다.');
			return false;
		}

		//이메일 형식이 아닐 시 에러문구 띄우기
		if (!(email_check($('#userEmail').val()))) {
			addError($('#userEmail'));
			$('#userEmail').parent().parent().children('small').html('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
			return false;
		}
		//이메일 유효성 통과했을 시 error클래스 있다면 삭제
		removeErrorAndSuccess($('#userEmail'));

		//비밀번호 유효성 함수 실행
		//비밀번호 불일치일 시
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
		}
		//비밀번호 유효성 통과했을 시 error클래스 있다면 삭제
		removeErrorAndSuccess($('#userPassword'));
		//로그인 유효성 통과 후 로그인 정보 DB와 매칭
		/*$.ajax({
			type: "post",
			url: "/loginProc",
			data : {
	            username : $('#userEmail').val(),
	            password : $('#userPassword').val()
	        },

			success: function(result) {
				emailCode = result;//인증코드 담는 변수
				console.log(emailCode);
				
				alert("로그인에 성공했습니다.");
			},
			error: function(error) {
				alert("로그인에 실패했습니다.");
				return false;
			}
		});*/
	});
});