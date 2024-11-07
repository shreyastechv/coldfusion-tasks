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
						<cfset local.objformSubmit = createObject('component', 'comp')>
						<cfset local.objformSubmit.sendEmail(form.name, form.email, form.bdayMessage, form.greetingsImage)>
						<cflocation url="index.cfm" addToken="false">
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>