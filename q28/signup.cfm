<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SignUp Form</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<form id="loginForm" name="loginForm" method="post">
					<label class="form-label" for="username">Enter username:</label>
					<input class="form-control mb-2" type="text" id="username" name="username" placeholder="Example: user101" autocomplete="on" required>
					<div id="usernameError" class="text-danger"></div>
                    <label class="form-label" for="password">Enter password:</label>
					<input class="form-control mb-2" type="password" id="password" name="password" placeholder="Enter the super secure password" required>
					<div id="passwordError" class="text-danger"></div>
                    <label class="form-label" for="confirmPassword">Confirm password:</label>
					<input class="form-control mb-2" type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your super secure password" required>
					<div id="passwordConfirmError" class="text-danger"></div>
                    <div class="d-flex align-items-center gap-2">
						<input class="btn btn-primary" type="submit" id="submit" name="submit" value="Sign Up">
						<span>Already have an account?</span>
						<a class="text-decoration-none" href="login.cfm">Log In</a>
					</div>
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(form, "submit")>
						<cfset local.objUserCreation = CreateObject('component', 'components.createUser')>
						<cfset local.result = local.objUserCreation.createUser(form.username, form.password, form.confirmPassword)>
						#local.result#
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
		<script>
			document.getElementById("loginForm").addEventListener('submit', function (event) {
				const userName = document.getElementById("username").value;
				let usernameError = document.getElementById("usernameError");
				const password = document.getElementById("password").value;
				const confirmPassword = document.getElementById("confirmPassword").value;
				let passwordConfirmError = document.getElementById("passwordConfirmError");

				if (userName.includes(" ")) {
					event.preventDefault();
					usernameError.textContent = "Username cannot contain any space.";
				}

				if (password !== confirmPassword) {
					event.preventDefault();
					passwordConfirmError.textContent = "Passwords must match.";
				}
			});
		</script>
    </body>
</html>