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
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script src="./js/script.js"></script>
	</body>
</html>