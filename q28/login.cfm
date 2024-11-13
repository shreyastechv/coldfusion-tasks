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
						<cfswitch expression="#local.result#">
							<cfcase value="nouser">
								There is no user with username #form.username#.
							</cfcase>
							<cfcase value="badpass">
								Wrong password for the user with username #form.username#.
							</cfcase>
							<cfcase value="good">
								<cfif session.userRole IS "user">
									<cflocation url="index.cfm" addToken="no">
								<cfelse>
									<cflocation url="admin.cfm" addToken="no">
								</cfif>
							</cfcase>
							<cfdefaultcase>
								Unknown Error
							</cfdefaultcase>
						</cfswitch>
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>