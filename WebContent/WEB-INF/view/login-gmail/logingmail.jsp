<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="1012288331395-k24u9pj63e593k273179pbtrigshvj2p.apps.googleusercontent.com">
</head>



<body>


	<div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>


	<img id="myImg">
	<br>
	<p id="name"></p>


	<div id="status"></div>



	<script type="text/javascript">
		function onSignIn(googleUser) {
			// window.location.href='success.jsp';

			var profile = googleUser.getBasicProfile();
			var imagurl = profile.getImageUrl();
			var name = profile.getName();
			var email = profile.getEmail();
			document.getElementById("myImg").src = imagurl;
			document.getElementById("name").innerHTML = name;

			document.getElementById("myP").style.visibility = "hidden";

			document.getElementById("status").innerHTML = 'Bem vindo ' + name
					+ '! <a href="success.jsp"?email=' + email + '&name=' + name
					+ '/>Continue com o login do Google</a></p>'

		}
	</script>





	<button onclick="myFunction()">Sair</button>

	<script>
		function myFunction() {
			gapi.auth2.getAuthInstance().disconnect();
			location.reload();
		}
	</script>



</body>
</html>