<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<cfif cgi.REQUEST_METHOD IS "get">
					<cfset local.obj = createObject('component', 'comp')>
					<cfset session.randomText = local.obj.generateRandomText()>
				</cfif>

				<form name="captchaForm" method="post">
					<label class="form-label" for="userEmail">Enter email:</label>
					<input class="form-control mb-3" type="email" id="userEmail" name="userEmail" placeholder="abc@example.org" required>

					<label class="form-label" for="userCaptcha">Enter captcha:</label><br>
					<cfimage class="mb-1" action='captcha' text="#session.randomText#">
					<input class="form-control mb-3 w-50" type="text" id="userCaptcha" name="userCaptcha" placeholder="Enter the characters seen in captcha image" required>

					<input class="btn btn-primary" type="submit" id="submit" name="submit">
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(form, "submit")>
						<cfset local.obj = createObject('component', 'components.comp')>
						<cfset local.result = local.obj.validateCaptcha(form.userCaptcha)>
						#local.result#
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>