<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
	
<style type="text/css">


 .container col-md-6{
 margin: auto;
 }

</style>
	
	
</head>
<body>

	<c:set var="dto" value="${Cont }" />
	<br>
<div class="align-middle">
	<div class="container col-md-6" style="width: 600px;">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title mb-3">${dto.getStudy_title() }</h4>
				<h6 class="card-subtitle text-muted mb-4">
				<i class="fa-regular fa-user"></i>${dto.getStudy_writer() }
				&nbsp;
				<i class="fa-regular fa-clock"></i> ${dto.getStudy_date()}
				&nbsp;
				<i class="fa-solid fa-eye"></i> ${dto.getStudy_hit() }            
				</h6>
				<br> <br>
				<p><img src="<%=request.getContextPath()%>/study_upload/${dto.getStudy_file()}" alt="" /></p>
				<p class="card-text">${dto.getStudy_cont() }</p>
			</div>
			<div class="card-body">
				            
				
				       
			</div>
			<div class="card-body">


  
			</div>
		</div>
	</div>
	</div>

<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
</body>
</html>