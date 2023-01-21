

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
	var targetUrl;
	function readURL(input) {
		console.log('미리보기 함수 호출'+input);
		if (input.files && input.files[0]) {
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			reader.onload = function(e) {
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				targetUrl = e.target.result;
				$('#blah').attr('src', targetUrl);
				//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				// $('#imgInp').parent().children('label').text(targetUrl);
				console.log($('#blah'));
			}
			reader.readAsDataURL(input.files[0]);
			//console.log(input.files[0]);
			//File내용을 읽어 dataURL형식의 문자열로 저장
		}
	} //readURL()--
	
	function readURL2(input) {
		console.log('미리보기 함수 호출2'+input);
		if (input.files && input.files[0]) {
			console.log('되냐?1');
			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			reader.onload = function(e) {
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				console.log('되냐?2');
				targetUrl = e.target.result;
				$('#questionImg').attr('src', targetUrl);
				console.log('되냐?3');
			}
			reader.readAsDataURL(input.files[0]);
			//console.log(input.files[0]);
			//File내용을 읽어 dataURL형식의 문자열로 저장
		}
	} //readURL()--
	
	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드-프로필?
	$("#imgInp").change(function() {
		//alert(this.value); //선택한 이미지 경로 표시
		readURL(this);
	});
	
	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드-프로필?
	$("#blah2").change(function() {
		console.log('버튼이벤트 감지'+this);
		//alert(this.value); //선택한 이미지 경로 표시
		readURL(this);
	});
	
	//문의하기
	$("#questionImgInput").change(function() {
		console.log('버튼이벤트 감지'+this);
		readURL2(this);
		var form = $('form[name=questionForm]')[0];
		var formData = new FormData(form);
		console.log("파일 업로드 시작");
		formData.append('file', $('#questionImgInput')[0].files[0]);
		console.log($('#questionImgInput'));
		$.ajax({
			type: 'POST',
			url: '/user/questionImgAdd',
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			data: formData,
		}).done(function(result) {
			console.log("파일 저장 위치"+result);
			$('form[name=questionForm] input[name=questionImage1]').val(result);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
		console.log($('input[name=questionImage1]').val());
	});

	console.log($("form[name=questionForm] input[name=userId]").val());
	//문의하기 버튼
	
	//문의하기 화면이 꺼질 때 문의하기 내용 초기화 하는 역할
	$("#questionForSumyModal").on('hidden.bs.modal', function () {
		/*location.reload();*/
		$('#questionForSumyModalTitle').val('');
		$('#questionForSumyModalContents').val('');
		$('#questionImgInput').val('');
		$('#questionImg').attr('src','/upload/default_img.jpg');
	});
		
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
		
		var queryString = $("form[name=questionForm]").serialize();
		console.log("쿼리스트링" + queryString);
		$.ajax({
			type: 'post',
			url: '/user/questionModal',
			data: queryString,
			dataType: 'json',
			error: function(xhr, status, error) {
				console.log(xhr+status+error);
			},
			success: function(json) {
				console.log(json);
			}
		});
		alert('문의하기를 완료하였습니다.');
		$('#questionForSumyModalTitle').val("");
		$('#questionForSumyModalContents').val("");
		$('#questionImgInput').val("");
		$('#questionImg').attr('src', "/resources/static/assets/img-temp/500x320/img1.png");
		$("#questionForSumyModal").modal('hide');
	});
	
	//프로필 사진 변경 버튼
	$('#profileUpdateBtn').on('click', function() {
		var form = $('#fileForm')[0];
		var formData = new FormData(form);

		formData.append('file', $('#imgInp')[0].files[0]);
		$.ajax({
			type: 'POST',
			url: '/user/profileImgUpdate',
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
			$('#blah2').attr('src', targetUrl);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	});
	
	
	
	// =============================================
	
});
