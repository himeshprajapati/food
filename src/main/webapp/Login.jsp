<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
/* CSS styles */
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	background-image: url("back-image.jpg");
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 50px;
	margin-top;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

input[type="submit"], .signup-button {
	display: block;
	width: 100%;
	padding: 10px;
	margin-top: 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.signup-button {
	background-color: #ccc;
}
</style>
<script>
	// JavaScript code
	window.onload = function() {
		var loginForm = document.getElementById('loginForm');
		loginForm.onsubmit = function() {
			// Perform form validation or other actions if needed
		};
	};
</script>
</head>
<body>
	<div class="container">
		<h1>Login</h1>
		<form id="loginForm" method="post" action="LoginServlet">
			<label for="username">Email:</label> <input type="text" id="email"
				name="email" required><br>
			<br> <label for="password">Password:</label> <input
				type="password" id="password" name="password" required><br>
			<br> <input type="submit" value="Login">
			<button class="signup-button"
				onclick="window.location.href='Signup.jsp'">Signup</button>

		</form>
		<h2>
			<%
			if (null != request.getAttribute("errorMessage")) {
				out.println(request.getAttribute("errorMessage"));
			}
			%>
		</h2>
	</div>
</body>
</html>
