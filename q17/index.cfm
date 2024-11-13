<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">

				<form name="userForm" method="post" onsubmit="return validate()">
					<label class="form-label" for="userInput">Enter text:</label>
					<input class="form-control mb-3" type="text" id="userInput" name="userInput" placeholder="Enter some text" required>
					<input class="btn btn-primary" type="submit" id="submit" name="submit">
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfif structKeyExists(form, "submit")>
						<cfset local.objOddEven = createObject('component', 'components.oddEven')>
						<cfset local.resultArray = local.objOddEven.getOddEven(form.userInput)>
						<cfloop array="#local.resultArray#" item="span">
							#span#
						</cfloop>
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
		<script src="./js/script.js"></script>
	</body>
</html>