<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<cfif StructKeyExists(session, "userRole")>
					<cflocation url="index.cfm" addToken="no">
				</cfif>

				<form name="captchaForm" method="post">
					<label class="form-label" for="username">Enter username:</label>
					<input class="form-control mb-3" type="text" id="username" name="username" placeholder="Example: user101" required>
					<label class="form-label" for="password">Enter password:</label>
					<input class="form-control mb-3" type="password" id="password" name="password" placeholder="Enter the super secure password" required>
					<input class="btn btn-primary" type="submit" id="submit" name="submit">
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