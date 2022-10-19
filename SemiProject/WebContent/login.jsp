<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('8fa233a3b298fd44817a61f49898727e');
	console.log( Kakao.isInitialized() );
	
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  
	        	  let id = response.kakao_account.email;;
                  let nickname = response.properties.nickname;
                  
				  location.href="<%=request.getContextPath()%>/user_login_ok.do?id="+id+"&nickname="+nickname+"";
                  
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }
	
	function close()
    {
     window.open('','_self').close(); 
   }

	
</script>
</head>
<body>

	<div align="center">
		<h2>Coders 에 오신것을 환영합니다 !</h2>
		
		<form method="post" action="">
		<table>
			<tr>
				<td>
					<a href="javascript:kakaoLogin();">
						<img src="./upload/kakao_login_medium_narrow.png">
					</a>
				</td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<th>kakao 로그인</th>
				<th></th>
				<th></th>
			</tr>
			
			<tr>
				<td>
					<a href="javascript:kakaoLogout();">로그아웃</a>
				</td>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>