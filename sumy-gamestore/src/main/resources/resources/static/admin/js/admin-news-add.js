let newsAdd = {
	init: function(){
		$("#btn-news-add").on("click",()=>{
			this.add();
		});
		
		$("#btn-news-update").on("click",()=>{
			this.update();
		});
		
		$("#btn-news-add-parent").on("click",()=>{
			this.valid();
		});
	},
	
	add: function(){
		let data = {
			newsTitle:$("#newsTitle").val(),			
			newsSubTitle:$("#newsSubTitle").val(),		
			newsText:$("#summernote").val()			
		};
		
		console.log(data);
		
		var form =$('#fileForm')[0];
		var formData = new FormData(form);
		
		
		formData.append('newsList', new Blob([JSON.stringify(data)] , {type: "application/json"}));
		formData.append('file', $('#fileAttachment'));
									
		
		$.ajax({
            type: 'POST',
            url: '/admin/news/add',
			enctype: "multipart/form-data",
            processData: false,
            contentType:false,
            data: formData,
        }).done(function() {
            $("#exampleModal2").modal('show');
        }).fail(function (error) {
            alert(JSON.stringify(error));
		});
	},
	
	
	valid:function(){
		if($("#newsTitle").val() == ""){
			alert("뉴스제목을 입력해주세요!");
			$("#newsTitle").focus();
			return false;
		};
		
		if($("#newsSubTitle").val() == ""){
			alert("뉴스부제목을 입력해주세요!");
			$("#newsSubTitle").focus();
			return false;
		};
		
		
		if($("#fileAttachment").val() == ""){
			alert("이미지를 첨부해주세요!");
			$("#fileAttachment").focus();
			return false;
		}

		
		if($("#summernote").val() == ""){
			alert("뉴스본문을 입력해주세요!");
			$("#summernote").focus();
			return false;
		};

		$('#exampleModal').modal('show');
		
		
	},
	
	update: function(){
		let data = {
			newsId:$("#newsId").val(),
			newsTitle:$("#newsTitle").val(),			
			newsSubTitle:$("#newsSubTitle").val(),		
			newsText:$("#summernote").val()			
		};
		
		console.log(data);
		
		var form =$('#fileForm')[0];
		var formData = new FormData(form);
		
		
		formData.append('newsList', new Blob([JSON.stringify(data)] , {type: "application/json"}));
		formData.append('file', $('#fileAttachment'));
									
		
		$.ajax({
            type: 'PUT',
            url: '/admin/news/update',
			enctype: "multipart/form-data",
            processData: false,
            contentType:false,
            data: formData,
        }).done(function() {
            $("#exampleModal2").modal('show');
        }).fail(function (error) {
            alert(JSON.stringify(error));
		});
	},
	
	
}

newsAdd.init();


