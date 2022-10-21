<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">

a{
  text-decoration: none;
  line-height: 48px;
  color: gray;
}

#container {
  display: flex;
  width: 50em;
  padding-top: 10px;
  padding-bottom: 10px;
  margin: auto;
}

.study_view_left {
  flex: 1;
}

.study_view_left2{
  display: table-cell;
  vertical-align: middle;
  text-align: right;
}

.study_view_center {
  align-items: center;
  flex: 3;
  text-align: left;
  font-size: 1.2em;
}
.study_view_right {
  flex: 1;
  text-align: right;
}
.studyViewDate{
font-size: 0.8em;
}
.studyViewWriter{
font-size: 1.1em;
}

</style>


</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-primary">
			<div class="container-fluid text-white">
				<a class="navbar-brand" href="#" style="color: light">Coders</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/q&alist.do" style="color: light">Q&A</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/studyBoard_list.do" style="color: light">Study</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								${userId }
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">프로필 보기</a></li>
								<li><a class="dropdown-item" href="#">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>