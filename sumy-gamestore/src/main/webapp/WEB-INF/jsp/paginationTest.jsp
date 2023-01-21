<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>


<!-- 5개, 10개, 15개, 20개씩 보여주는 정보를 서버에 보내주는 역할 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/admin/page?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<!-- 5개, 10개, 15개, 20개씩 종료 -->


<body>
<h2>게시판</h2>

<div id="outter">
	<div style="float: right;">
	
	
		<!-- 5개 10개 15개 20개 선택해주는 녀석 시작 -->	
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
		<!-- 5개 10개 15개 20개 선택해주는 녀석 끝 -->
		
		
	</div> <!-- 옵션선택 끝 -->
	<table border="1">
		<tr>
			<td>No.</td>
			<td width="50%">제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>		
		</tr>
		
		
		<!-- 게시글 리스트 시작 -->
		<c:forEach items="${viewAll }" var="list">
			<tr>
				<td>${list.seq }</td>
				<td><a href='detail?seq=${list.seq }'>${list.title }</a></td>
				<td>${list.writer }</td>
				<td><fmt:formatDate value="${list.regdate }" pattern="yyyy.MM.dd"/> </td>
				<td>${list.cnt }</td>
			</tr>
		</c:forEach>
		<!-- 게시글 리스트 끝 -->
		
		
	</table>
	<input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br>
	
	<div style="display: block; text-align: center;">
	
	
		<!-- 페이지네이션 시작 -->
		
		<!-- "이전" 버튼 있는지 없는지 유무 시작 -->		
		<c:if test="${paging.startPage != 1 }">
			<a href="/admin/page?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<!-- "이전" 버튼 있는지 없는지 유무 끝 -->
		
		<!-- 페이지네이션 숫자 반복 시작 -->
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			
			<!-- 현재페이지인지 아닌지 조건 시작 -->
			<c:choose>
			
				<!-- 현재페이지면, 링크가 없음 시작 -->
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<!-- 현재페이지면, 링크가 없음 끝 -->
				
				<!-- 현재페이지가 아니면, 링크 있음 시작 -->
				<c:when test="${p != paging.nowPage }">
					<a href="/admin/page?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
				<!-- 현재페이지가 아니면, 링크 있음 시작 -->
				
			</c:choose>
			<!-- 현재페이지인지 아닌지 조건 끝 -->
			
		</c:forEach>
		<!-- 페이지네이션 숫자 반복 끝 -->
		
		<!-- "이후" 버튼 있는지 없는지 유무 시작 -->
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/admin/page?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
		<!-- "이후" 버튼 있는지 없는지 유무 끝 -->
		
		
		<!-- 페이지네이션 끝 -->
	</div>
</div>
</body>
</html>