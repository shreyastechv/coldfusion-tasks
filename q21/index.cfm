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

				<form name="emailForm" method="post" enctype="multipart/form-data">
					<div class="mb-3">
						<label class="form-label" for="name">Enter name of baby:</label>
						<input class="form-control mb-3" type="text" id="name" name="name" placeholder="Cute Baby Name" required>

						<label class="form-label" for="email">Enter email id:</label>
						<input class="form-control mb-3" type="email" id="email" name="email" placeholder="abc@example.org" required>

						<label class="form-label" for="bdayMessage">Enter greetings message:</label>
						<textarea class="form-control mb-3" id="bdayMessage" name="bdayMessage" placeholder="Enter message here" rows="5" required></textarea>

						<label class="form-label" for="greetingsImage">Select a greeting image:</label>
						<input class="form-control mb-3" type="file" id="greetingsImage" name="greetingsImage" required>

						<input class="btn btn-primary" type="submit" id="submit" name="submit">
					</div>
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfif structKeyExists(form,"submit")>
						<cfset local.objformSubmit = createObject('component', 'components.comp')>
						<cfset local.objformSubmit.sendEmail(form.name, form.email, form.bdayMessage, form.greetingsImage)>
						<cflocation url="index.cfm" addToken="false">
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>