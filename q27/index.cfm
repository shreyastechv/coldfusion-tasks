<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<cfif StructKeyExists(session, "loggedIn")>
					#session.loggedIn#
					<cflocation url="welcome.cfm" addToken="no">
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
						<cfset local.objUserValidation = CreateObject('component', 'comp')>
						<cfset local.result = local.objUserValidation.validateUser(form.username, form.password)>
						<cfswitch expression="#local.result#">
							<cfcase value="nouser">
								There is no user with username #form.username#.
							</cfcase>
							<cfcase value="badpass">
								Wrong password for the user with username #form.username#.
							</cfcase>
							<cfcase value="good">
								<cflocation url="welcome.cfm" addToken="no">
							</cfcase>
							<cfdefaultcase>
								Unknown Error
							</cfdefaultcase>
						</cfswitch>
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>