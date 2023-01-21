<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer -->
  <footer id="footer"
    class="u-footer--bottom-sticky g-bg-white g-color-gray-dark-v6 g-brd-top g-brd-gray-light-v7 g-pa-20">
    <div class="justify-content-end row align-items-center">
    
    <!-- 
      Footer Nav
      <div class="col-md-4 g-mb-10 g-mb-0--md">
        <ul class="list-inline text-center text-md-left mb-0">
          <li class="list-inline-item">
            <a class="g-color-gray-dark-v6 g-color-secondary--hover" href="/qna">FAQ</a>
          </li>
          <li class="list-inline-item">
            <span class="g-color-gray-dark-v6">|</span>
          </li>
          <li class="list-inline-item">
            <a class="g-color-gray-dark-v6 g-color-secondary--hover" href="#">Support</a>
          </li>
          <li class="list-inline-item">
            <span class="g-color-gray-dark-v6">|</span>
          </li>
          <li class="list-inline-item">
            <a class="g-color-gray-dark-v6 g-color-secondary--hover" href="#">Contact Us</a>
          </li>
        </ul>
      </div>
      End Footer Nav

      Footer Socials
      <div class="col-md-4 g-mb-10 g-mb-0--md">
        <ul class="list-inline g-font-size-16 text-center mb-0">
          <li class="list-inline-item g-mx-10">
            <a href="#" class="g-color-facebook g-color-secondary--hover">
              <i class="fa fa-facebook-square"></i>
            </a>
          </li>
          <li class="list-inline-item g-mx-10">
            <a href="#" class="g-color-google-plus g-color-secondary--hover">
              <i class="fa fa-google-plus"></i>
            </a>
          </li>
          <li class="list-inline-item g-mx-10">
            <a href="#" class="g-color-black g-color-secondary--hover">
              <i class="fa fa-github"></i>
            </a>
          </li>
          <li class="list-inline-item g-mx-10">
            <a href="#" class="g-color-twitter g-color-secondary--hover">
              <i class="fa fa-twitter"></i>
            </a>
          </li>
        </ul>
      </div>
      End Footer Socials
 -->
 
      <!-- Footer Copyrights -->
      <div class="col-md-4 text-md-right ">
        <small class="d-block g-font-size-default">2021 © All Rights Reserved.</small>
      </div>
      <!-- End Footer Copyrights -->
    </div>
  </footer>
<script src="/resources/static/admin/assets/vendor/jquery/jquery.min.js"></script>
<script>

	let pageName = $("#pageName").text();
	if(pageName == '게임 관리'){
		$("#gameSidebar").addClass('has-active');
		$("#gameSidebar>a").addClass('g-color-primary');
		$("#gameSidebar i:first").addClass('g-color-primary');
	}
	if(pageName == '고객 관리'){
		$("#userSidebar").addClass('has-active');
		$("#userSidebar>a").addClass('g-color-primary');
		$("#userSidebar i:first").addClass('g-color-primary');
	}
	if(pageName == '문의 관리'){
		$("#questionSidebar").addClass('has-active');
		$("#questionSidebar>a").addClass('g-color-primary');
		$("#questionSidebar i:first").addClass('g-color-primary');
	}
	if(pageName == '신고 관리'){
		$("#warningSidebar").addClass('has-active');
		$("#warningSidebar>a").addClass('g-color-primary');
		$("#warningSidebar i:first").addClass('g-color-primary');
	}
	if(pageName == '뉴스 관리'){
		$("#newsSidebar").addClass('has-active');
		$("#newsSidebar>a").addClass('g-color-primary');
		$("#newsSidebar i:first").addClass('g-color-primary');
	}
	
	
		/* has-active 
			
		gameSidebar 게임 관리
		userSidebar 유저 관리
		questionSidebar 문의 관리
		warningSidebar 신고 관리
		newsSidebar 뉴스 관리
		
		*/
	
</script>
<!-- End Footer -->