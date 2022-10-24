<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function statusChangeCallback(response){
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status == 'connected') {
			alert("로그인 되었습니다.")
			$('#status').after('<button id="logout">로그아웃</button>');
			testAPI();
		}else {
			document.getElementById('status').innerHTML = 'please log into this app.';
			
		}
	}
	
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
	
	window.fbAsyncInit = function(){
		FB.init({
			appId : '2033737993492001';
			cookie : true,
			xfbml : true,
			version : 'v2.8'
		});
		
		FB.getLoginStatus(function(response){
			statusChangeCallback(response);
		});
	};
	
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "http://connect.facebook.net/en_US/sdk.js";
		fjs.parentnode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	function testAPI() {
		console.log('Welcome! Fetching your information....');
		FB.api('/me',{fields:'email,name'}, function(response){
			console.log('Successful Name: ' + response.name);
			console.log('Successful Email: ' + response.email);
			
			//javascript 형식 문자열 추가하기
			document.getElementById('status').innerHTML = '페이스북 로그인되었습니다.' + response.name + '님!';
			
			//jQuery형 문자열 추가하기
			$('#userInfo').html("이름 : " + response.name + " 메일 : " + response.email);
		});
		
	}
	
	$(document).on("click", "#logout", function(){
		FB.logout(function(response){
			alert("로그아웃 되었습니다.";)
			location.reload();
		});
	});
</script>

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
<div id="status"></div>
<div id="userInfo"></div>

</body>
</html>