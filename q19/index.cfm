<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>

    <body>
		<div class="container mt-5">
			<cfoutput>
				<form class="d-flex flex-column gap-2" name="testform" method="post">
					<input class="btn bg-success w-25" type="submit" name="submit">
				</form>
				<div class="text-primary-emphasis mt-3">
					<cfif NOT StructKeyExists(Cookie, "VisitsCounter")>
						<cfcookie name="VisitsCounter" value=0>
					</cfif>

					<cfif StructKeyExists(Form, "submit")>
						<cfset Cookie.VisitsCounter += 1>
					</cfif>
					Visits Count: #Cookie.VisitsCounter#
				</cfoutput>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>