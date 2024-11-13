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
			<cfparam name="cookie.visitsCounter" default=0>
			<div class="container mt-5">
				<form class="d-flex flex-column gap-2" name="testform" method="post">
					<input class="btn bg-success w-25" type="submit" name="submit">
				</form>
				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(form, "submit")>
						<cfset local.objCookie = createObject('component', 'components.cookieCount')>
						<cfset local.cookieCount = local.objCookie.getCookieCount()>
						<cflocation url="index.cfm" addToken="no">
					</cfif>
					Visits Count: #cookie.visitsCounter#
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
	</body>
</html>