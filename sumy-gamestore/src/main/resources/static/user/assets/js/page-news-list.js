let newsList = {
	init: function(){
		$('#news-search-btn').on('click', ()=>{
			this.search();
		});
		
	},
	
	
	search: function(){
				
		var url = "/sumy/news/list";

		url = url + "?nowPage=" + 1;

		url = url + "&keyword=" + $('#news-search').val();
		
		url = url + "&keywordOpt=" + $('#keywordOpt-select').val();
		
		location.href = url;
	
	}
	
}


newsList.init();