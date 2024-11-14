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
				<cfif NOT StructKeyExists(session, "loggedIn")>
					<cflocation url="index.cfm" addToken="no">
				</cfif>

				<form name="logoutForm" method="post">
					<input class="btn btn-primary" type="submit" id="submit" name="submit" value="Log Out">
				</form>
				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(form, "submit")>
						<cfset StructDelete(session, "loggedIn")>
						<cflocation url="index.cfm" addToken="no">
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>