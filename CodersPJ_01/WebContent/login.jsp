<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- KaKao Login Js -->
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- KaKao Login Js -->

<!-- Naver Login Js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- Naver Login Js -->

<!-- facebook Login Js -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=2033737993492001" nonce="SiOBIhLG"></script>
<script type="text/javascript" src="//connect.facebook.net/en_US/sdk.js"></script>
<!-- facebook Login Js -->

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	Kakao.init('8fa233a3b298fd44817a61f49898727e');
	console.log( Kakao.isInitialized() );
	
	// kakao 로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  
	        	  var id = response.kakao_account.email;
                  var nickname = response.properties.nickname;
                  
                  if( id == undefined || id == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						kakaoLogin.reprompt();
						return;
					}
                  
				  location.href="<%=request.getContextPath()%>/user_login_ok.do?id="+id+"&nickname="+nickname+"&token=kakao";
                  
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
	// kakao 로그인 end
	
 	
</script>

</head>
<body>

	<div align="center">
		<h2>Coders 에 오신것을 환영합니다 !</h2>
		
		<form method="post" action="">
		<table align="center">
			<tr>
				<td>
					<!-- kakao 로그인 버튼 노출 영역 -->
					<a href="javascript:kakaoLogin();">
						<img src="./upload/kakao.png" width="50%">
					</a>
					<!-- kakao 로그인 버튼 노출 영역 -->
				</td>
			</tr>	
				
<!----------------------------------------------------------------------------------------------------------------------------------------------->
				
			<tr>	
				<td>
					<!-- naver 로그인 버튼 노출 영역 -->
  					<div id="naverIdLogin" style="display: none;"></div>
		            <div class="social-login">
						<a href="#" class="naver-login" id="naverLogin">
							<img src="./upload/naver.png" width="50%">
						</a> <!-- 커스텀 버튼-->
					</div>
					<!-- naver 로그인 버튼 노출 영역 -->

					<!-- naver 로그인 -->
					<script type="text/javascript">
						var naverLogin = new naver.LoginWithNaverId(
							{
								clientId: "QUJaCNWazN945TqXtLvx",
								callbackUrl: "http://localhost:8282/SemiProject/callback.jsp",
								isPopup: false, /* 팝업을 통한 연동처리 여부 */
								loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
							}
						);
	
						/* 설정정보를 초기화하고 연동을 준비 */
						naverLogin.init();

						const handleClick = () => {
					        naverRef.current.children[0].click();
					    }
						
						/* 이미지 버튼 클릭시 dispaly: none; 이 된 div id=naverIdLogin 실행*/
						$(document).on("click", "#naverLogin", function(){
					        var naverLogin = document.getElementById("naverIdLogin").firstChild;
					        naverLogin.click();
					    });
					</script>
					<!-- naver 로그인 end -->
				</td>
			</tr>	
				
<!----------------------------------------------------------------------------------------------------------------------------------------------->
				
			<tr>	
				<td>
					<!-- facebook 로그인 버튼 노출 영역 -->
					<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
					</fb:login-button>
					
					<a href="#" class="facebook-login" id="facebookLogin">
							<img src="./upload/facebook.png" width="50%">
					</a> <!-- 커스텀 버튼-->
					<!-- facebook 로그인 버튼 노출 영역 -->
					
					<!-- facebook 로그인 -->
					<script type="text/javascript">
						function testAPI() {
							console.log('Welcome! Fetching your information....');
							FB.api('/me',{fields:'email,name'}, function(response){
								var nickname = response.name;
								var id = response.email;
								location.href="<%=request.getContextPath()%>/user_login_ok.do?id="+id+"&nickname="+nickname+"&token=facebook";
								
							});
							
						}
						
						(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id)) return;
							js = d.createElement(s); js.id = id;
							js.src = "http://connect.facebook.net/en_US/sdk.js";
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
						
						function statusChangeCallback(response){
							console.log('statusChangeCallback');
							console.log(response);
							if (response.status == 'connected') {
								testAPI();
							}
						}
						
						function checkLoginState() {
							FB.getLoginStatus(function(response) {
								statusChangeCallback(response);
							});
						}
						
						window.fbAsyncInit = function(){
							FB.init({
								appId : '3335600120006523',
								cookie : true,
								xfbml : true,
								version : 'v2.8'
							});
							
							FB.getLoginStatus(function(response){
								statusChangeCallback(response);
							});
						};
						
						/* 이미지 버튼 클릭시 dispaly: none; 이 된 div id=naverIdLogin 실행*/
						$(document).on("click", "#facebookLogin", function(){
					        var facebookLogin = document.getElementById("facebookIdLogin").firstChild;
					        facebookLogin.click();
					    });
					
					</script>
					
					<!-- facebook 로그인 end -->
				</td>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>