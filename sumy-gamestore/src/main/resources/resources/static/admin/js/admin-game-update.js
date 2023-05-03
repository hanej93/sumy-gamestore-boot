let gameUpdate = {
	init: function(){
		$("#btn-game-add").on("click",()=>{
			this.update();
		});
	},
	
	update: function(){
  
		let stringNum = $("#sumy-game-input-price").val();
		let regex = /[^0-9]/g;
		let numberToString = stringNum.replace(regex,"");
		
		let categoryArr = []; 
	    $("#sumy-game-category input[type='checkbox']:checked").each(function (index) {
	        categoryArr.push($(this).val());
	    });
		
		let data = {
			gameTitle:$("#gameTitle").val(),			
			gameDev:$("#gameDev").val(),			
			gamePrice: numberToString,			
			gameDiscountRate:$("#sumy-game-discount-rate").val(),
			gameSubText:$("#gameSubText"),			
			gameMainText:$("#summernote").val(),			
			gameRate:$("#gameRate").val(),	
			/*categoryArr:categoryArr		
			gameThumbImage:$("#gameThumbImage").val()			
			gameCategoryId1:$("#c").val(),			
			gameCategoryId2:$("#c").val(),			
			gameCategoryId3:$("#c").val(),				
			gameCategoryId4:$("#c").val()*/
			
		};
		
		console.log(data);
		
		$.ajax({
			type:"POST",
			url:"/admin/game/update",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			location.href = history.back();
		}).fail(function(error){
			console.log(error);
			alert(JSON.stringify(error));
		});
	}
	
	
}

gameUpdate.init();


