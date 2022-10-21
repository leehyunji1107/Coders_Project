<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty userId }">
	<jsp:include page="../include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="../include/user_top.jsp" />
	</c:if>
	<div>
	
	 <br><br>
	   
	    <button type="button"  class="btn btn-outline-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/studyBoard_list.do'">스터디게시판</button>
	
	</div>
	
	<jsp:include page="../include/bottom.jsp" />
</body>
</html>