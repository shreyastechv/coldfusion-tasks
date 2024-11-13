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
				<form class="d-flex flex-column gap-2" name="testform" method="post">
					<input class="btn bg-success w-25" type="submit" name="submit">
				</form>
				<div class="text-primary-emphasis mt-3">
					<cfif NOT StructKeyExists(Cookie, "VisitsCounter")>
						<cfcookie name="VisitsCounter" value=0>
					</cfif>

					<cfif StructKeyExists(Form, "submit")>
						<cfset Cookie.VisitsCounter += 1>
						<cflocation url="index.cfm" addToken="false">
					</cfif>

					Visits Count: #Cookie.VisitsCounter#
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
	</body>
</html>