<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
	
	<script>
	
	$('#study_cont').keyup(function(e) {
		let content = $(this).val();
		// 글자수 세기
		if (content.length == 0 || content == '') {
			$('.textCount').text('0자');
		} else {
			$('.textCount').text(content.length + '자');
		}
		// 글자수 제한
		if (content.length > 200) {
			// 1000자 부터는 타이핑 되지 않도록
			$(this).val($(this).val().substring(0, 200));
			// 1000자 넘으면 알림창 뜨도록
			alert('본문은 1000자까지 입력 가능합니다.');
		}
		;
	});
	
</script>

<style type="text/css">
.mb-3 {
	width: 40em;
}
textarea{
	height:26em; 
    resize:none; /* 크기고정 */ 
    maxlength="1000";
}
</style>

<!-- 추가할 기능 : '모집인원은N명을 초과할 수 없습니다' 알림 기능
모임 시작시간보다 종료시간이 앞서면 '모임 시작시간 이후의 날짜여야합니다' 알림 
-->
</head>
<body>

	
	<c:if test="${empty userId }">
	<jsp:include page="../include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="../include/user_top.jsp" />
	</c:if>
<br>

	<div align="center">
		<h3>STUDY 게시판 새 글쓰기</h3>
		<br>
		<%-- enctype : 파일을 업로드 하기 위한 속성 --%>
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/studyBoard_insert_ok.do">
			
			<input type="hidden" value="${userId }" name="study_writer">
			<div class="mb-3 row">
				<label for="exampleFormControlInput1" 
					class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input name="study_title" class="form-control">
				</div>
			</div>


<!-- 			<div class="textLengthWrap"> -->
<!-- 				<p class="textCount">0자</p> -->
<!-- 				<p class="textTotal">/1000자</p> -->
<!-- 			</div> -->
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">본문</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="study_cont" name="study_cont"></textarea>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">파일첨부</label>
				<div class="col-sm-10">
					<input class="form-control" type="file" name="study_file">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집인원</label>
				<div class="col-sm-10">
					<input type="number" name="study_people" class="form-control" min="0" max="10">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집시작일</label>
				<div class="col-sm-10">
					<input type="date" name="study_start" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집종료일</label>
				<div class="col-sm-10">
					<input type="date" name="study_end" class="form-control">
				</div>
			</div>
			
			<div>
					<input class="btn btn-primary" type="submit" value="글쓰기"> &nbsp;&nbsp;&nbsp; 
					<input class="btn btn-outline-primary" type="reset" value="다시작성"> &nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-secondary" value="뒤로가기" onclick="history.back()">
			</div>
			
			
			
			

		</form>

	</div>
	
	<jsp:include page="../include/bottom.jsp" />


</body>
</html>