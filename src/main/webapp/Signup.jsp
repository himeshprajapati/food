<!DOCTYPE html>
<html>
<head>
<title>Sign Up Page</title>
<style>

body{
background-image: url("back-image.jpg");
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 50px;
	margin-top;
	border: 1px solid #ccc;
	border-radius: 5px;
}

h2 {
	text-align: center;
}

.form-group {
	margin-bottom: 10px;
}

.form-group1 {
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="submit"] {
	width: 100%;
	padding: 8px 12px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.login-link {
	display: inline-block;
	padding: 7px 20px;
	background-color: #4CAF50;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	border: 1px solid #ccc;
	text-align: center;
	width: 90%;
}

.error-message {
	color: red;
}
</style>
<script>
	function validateForm() {
		var email = document.getElementById("email").value;
		var phoneNumber = document.getElementById("phone").value;
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmPassword").value;

		var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var phoneRegex = /^\d{10}$/;

		if (!emailRegex.test(email)) {
			document.getElementById("emailError").innerText = "Invalid email format.";
			return false;
		}

		if (!phoneRegex.test(phoneNumber)) {
			document.getElementById("phoneError").innerText = "Invalid phone number format.";
			return false;
		}

		if (password.trim().length < 8) {
			document.getElementById("passwordError").innerText = "Password must be at least 8 characters long.";
			return false;
		}

		if (password !== confirmPassword) {
			document.getElementById("confirmPasswordError").innerText = "Passwords do not match.";
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<div class="container">
		<h2>Sign Up</h2>
		<form method="post" action="Signup_Connection"
			onsubmit="return validateForm()">
			<div class="form-group">
				<label for="email">Email:</label> <input type="text" id="email"
					name="email"> <span id="emailError" class="error-message"></span>
			</div>
			<div class="form-group">
				<label for="phone">Phone Number:</label> <input type="text"
					id="phone" name="phone"> <span id="phoneError"
					class="error-message"></span>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password"> <span id="passwordError"
					class="error-message"></span>
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password:</label> <input
					type="password" id="confirmPassword" name="confirmPassword">
				<span id="confirmPasswordError" class="error-message"></span>
			</div>
			<div class="form-group">
				<input type="submit" value="Sign Up">

			</div>
			<a href="Login.jsp" class="login-link">Login</a>
		</form>
	</div>
</body>
</html>
