let catalogue = {

	init: function(){	
		$("#catalogueFilterResetBtn").on('click',()=> {
			this.clearFilter();
		});
		
		$("#catalogueFilterApplyBtn").on('click',()=> {
			this.search();
		});
		
		$("#orderOpt").on('change',()=>{
			this.search();
		});
		
		$("[id^='wishlistBtn']").on('click',function() {
			catalogue.wishlist();
		});
	},
	
	clearFilter:function(){
		$("#starFilter").children().removeClass('g-color-primary');
		$("#starFilter").children().removeClass('click');
		
		$("input[name='categoryListFilter']").prop("checked",false);
		
		$.HSCore.components.HSSlider.init('#rangeSlider1');
	},
	
	search: function(){
		
		let text = $("#rangeSliderAmount3").text();
				
		var url = "/catalogue";

		url = url + "?nowPage=" + 1;

		url = url + "&orderOpt=" + $('#orderOpt').val();
		
		url = url + "&lowPriceFilter=" + text.substring(0, text.indexOf(' '));
		
		url = url + "&highPriceFilter=" + text.substring(text.indexOf(' ') + 3);
		
		url = url + "&starFilter=" + $("#starFilter").children('.g-color-primary').length;
		
		url = url + "&discountFilter=" + discountFilter;
		
		$('input[name=categoryListFilter]:checked').each(function(){
			url = url + "&categoryListFilter=" + $(this).val();
		});

		location.href = url;
	
	},
	
	wishlist:function(){
		if (!confirm('위시리스트를 추가하시겠습니까?')) {
			return false;
		}
		
		let data = {
			reviewId:$(this).attr("reviewId")
		};
		
		
		$.ajax({
			type:"DELETE",
			url:"/sumy/game/review",
			data:JSON.stringify(data),
			contentType:"application/json;charset=utf-8", 
			dataType:"json" 
		}).done(function(resp){ 
			alert('리뷰를 삭제를 완료하였습니다.');
			location.reload();
		}).fail(function(error){ 
			console.log(error); 
			alert(JSON.stringify(error));
		});
	}

}

catalogue.init();



