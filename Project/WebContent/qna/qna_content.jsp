<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c"  uri ="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">
.mb-3 {
	width: 40em;
}
#qna_cont{
	height:26em; 
    resize:none; /* 크기고정 */ 
    maxlength = "1000";
}


table {
	width: 1200px;
}


</style>


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
		<c:set var="dto" value="${Cont }"/>
		
	<h3> ${dto.qna_writer } 님의 게시글입니다. </h3>
	
	<br>

			<div class="mb-3 row">
			<label for="exampleFormControlInput1" 
					class="col-sm-2 col-form-label">작성자 </label>
			<div class="col-sm-10">
					<input name="qna_writer" class="form-control" value="${dto.qna_writer }" readonly="readonly">
				</div>
			</div>
		
		
		<div class="mb-3 row">
			<label for="exampleFormControlInput1" 
					class="col-sm-2 col-form-label">제목 </label>
			<div class="col-sm-10">
					<input name="qna_title" class="form-control" value="${dto.qna_title }" readonly="readonly">
				</div>
		</div>
			
		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">본문</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="qna_cont" name="qna_cont" rows="7" cols="35" readonly>${dto.qna_cont }</textarea>
				</div>
		</div>
		
		<div class="mb-3 row">
			<c:if test="${empty dto.qna_update }">
			
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">작성일자 </label>
	
					<input name="qna_date" class="form-control" value="${dto.qna_date }" readonly="readonly">
			
			</c:if>
			
			<c:if test="${empty dto.qna_update }">

				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">수정일자 </label>
				
					<input name="qna_update" class="form-control" value="${dto.qna_update }" readonly="readonly">
				
			</c:if>
		</div>
		 
		
		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">조회수 </label>
		<div class="col-sm-10">
					<input name="qna_hit" class="form-control" value="${dto.qna_hit }" readonly="readonly">
				</div>
		</div>
		
		
		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">파일 첨부</label>
				<div class="col-sm-10">
					<input class="form-control" type="file" name="qna_file">
				</div>
		</div>
		
	
	<%-- 	<tr>
			<th> 파일 첨부</th>
				<c:if test="${!empty dto.qna_file }">
				<td> 
					<a href = "<%= request.getContextPath()%>/upload/${dto.getQna_file() }"
					target = "_blank"> ${dto.qna_file }</a>
				
				 </td>
				</c:if>
				
				<c:if test="${empty dto.qna_file }">
				<td> </td>
				</c:if>
		</tr> --%>
		
		
		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label"> 태그 </label>
			<div class="col-sm-10">
					<input name="qna_tag" class="form-control" value="${dto.qna_tag }" readonly="readonly">
			</div>		
		</div>
		

		<div>
				<input class= "btn btn-primary" type = "button" value="글 수정"
					onclick = "location.href='qna_modify.do?no=${dto.qna_num}'">
					
				<input class="btn btn-outline-primary" type = "button" value="글 삭제"
					onclick = "location.href='qna_delete.do?no=${dto.qna_num}'">
					
				<input class="btn btn-outline-secondary" type = "button" value="전체 목록"
					onclick = "location.href='qna_list.do'">
		</div>


	<br>
	<br>
	<br>
	
	<h3>댓글 목록</h3>
	
	<br>
	<br>
	
	<div>
		<table class ="list" cellspacing ="0" width = "400" >
		
			<tr class = "line">
				<td colspan ="3"></td>
			</tr>
		
			<tr class = "line">
				<td></td> <td></td> <td></td>
			</tr>
		
		</table>

	</div>
	
	<br>
	<br>
	<br>
	
	<h3> ${dto.qna_writer } 님의 게시글에 댓글 작성하기 </h3>
	
	<br>
	<br>
	<!-- 댓글 폼 영역 -->
	<div class = "commentArea"> 
		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">작성자 </label>
				<div class="col-sm-10">
					<input class="form-control" type = "text" name = "co_writer" id ="co_writer" value =${userId  } readonly>
				 </div>
		</div>
			
		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">본문</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="co_content" name="co_content" rows="10" cols="3"></textarea>
				</div>
		</div>

		<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">파일 첨부</label>
				<div class="col-sm-10">
					<input class="form-control" type="file" name = "co_file" id ="co_file">
				</div>
		</div>
			
			
		<div>	
			<input type="button" id="commentBtn" value="댓글 작성" class= "btn btn-primary">

			<input type="reset" id="resetBtn" value="다시 작성" class="btn btn-outline-primary">
		</div>
		
		
	</div> 
	<!-- 댓글폼 end -->
	
	
	</div>
	<!-- 전체 div end -->	
	
	
	<script type="text/javascript">

	$(function() {
		
		// ajax에서 동일하게 사용되는 속성 설정
		$.ajaxSetup({
			// ajax에서 한글 깨짐 문제 해결
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		//qna_comment 테이블의 모든 데이터를 가져오는 함수
		function getList() {
			
			$.ajax({
				url : "/Project/qna/qna_comment.jsp",
				data : { qcomment_num : ${dto.qna_num } },
				datatype : "xml",    // 결과 데이터 타입
				success : function(data) {
					// 테이블 태그의 타이틀태그를 제외한 댓글 목록을 지우는 명령어.
					$(".list tr:gt(1)").remove();
					
					let table = "";
					
					$(data).find("comment").each(function() {
						table += "<tr>";
						table += "<td colspan='2'>" + "작성자: " + $(this).find("qcomment_writer").text() +"</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td>" + "답글 번호: " +$(this).find("qcomment_num").text() + "</td>";
						table += "<td>" + "내용: " + $(this).find("qcomment_cont").text() + "</td>";
						table += "<td>" + "작성일자: " + $(this).find("qcomment_date").text() + "</td>";
						table += "<td>" + "첨부파일: " + $(this).find("qcomment_file").text() + "</td>";
						table += "</td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='5' align = 'right'>" + 
									"<input type = 'button' value = '수정' id ='modifyBtn' class= 'btn btn-primary'>" + "&nbsp &nbsp"+
									"<input type = 'button' value = '삭제' id ='deleteBtn' class='btn btn-outline-primary'>";
						table += "</td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='2'>&nbsp;</td>";
						table += "</tr>";
					});
					
					$(".list tr:eq(1)").after(table);
				},
				
				error : function() {
					alert('데이터 통신 에러 발생');
				}
			});
		}  // getList() 함수 end
		
		
		//댓글 수정 버튼 누르기
		$("#modifyBtn").on("click", function(){
		
			alert('test');
			
		});
		
		
		// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
		$("#commentBtn").on("click", function() {
			
			$.ajax({
				url : "/Project/qna_comment_insert_ok.do",
				datatype : "text",
				data : {
						qcomment_num : ${dto.qna_num },
						qcomment_writer : $("#co_writer").val(),
						qcomment_cont : $("#co_content").val(),
						qcomment_file : $("#co_file").val()
						},
				success : function(data) {
						if(data > 0) {
							alert('댓글이 등록되었습니다.');
						
							// 댓글 작성 후 다시 전체 댓글 리스트를 화면에 출력.
							getList();
							
							// input 태그에 입력된 내용을 지워줌.
							$("input[type=text]").each(function() {
								$(this).val("");  // 입력된 값 지우기
							});
						
						}else {
							alert('댓글 등록에 실패했습니다.');
						}
				},
				
				error : function() {
					alert('데이터 통신 오류입니다.');
				}
			});
		});  // 댓글 등록하기 end
				
		getList();  // 전체 리스트 함수 호출
		
	});

	</script>	
	
	<br>
	<br>
	<br>
	
	<jsp:include page="../include/bottom.jsp" />
	
</body>
</html>