<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<form name="loginForm" method="post">
					<label class="form-label" for="username">Enter username:</label>
					<input class="form-control mb-3" type="text" id="username" name="username" placeholder="Example: user101" required>
					<label class="form-label" for="password">Enter password:</label>
					<input class="form-control mb-3" type="password" id="password" name="password" placeholder="Enter the super secure password" required>
					<div class="d-flex align-items-center gap-2">
						<input class="btn btn-primary" type="submit" id="submit" name="submit" value="Login">
						<span>Don't have an account?</span>
						<a class="text-decoration-none" href="signup.cfm">Sign Up</a>
					</div>
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(form, "submit")>
						<cfset local.objUserValidation = CreateObject('component', 'components.validateUser')>
						<cfset local.result = local.objUserValidation.validateUser(form.username, form.password)>
						#local.result#
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>