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

			<form class="d-flex flex-column gap-2" name="testform" method="post">
				<label for="queryNum">Please enter a number between 1-10 :</label>
				<input class="w-100 rounded-3 p-2" type="number" name="queryNum" id="queryNum" min="1" max="10" placeholder="Enter a number" required>
				<input class="btn bg-success" type="submit" name="submit">
			</form>

			<div class="text-primary-emphasis mt-3">
				<cfset local.obj = createObject('component', 'comp')>
				<cfif IsDefined("Form.queryNum")>
					<cfset local.result = local.obj.testQuery(Form.queryNum)>
				<cfelse>
					<cfset local.result = local.obj.testQuery()>
				</cfif>

				Fullnames of people: <br>
				<cfoutput query="local.result.qOut">
					#local.result.qOut.firstname#
					#local.result.qOut.lastname#
					<br>
				</cfoutput>

				<cfoutput>
					<cfif IsDefined("Form.submit")>
						<br>
						#Form.queryNum# th row first name is #local.result.nthName#
					</cfif>
				</cfoutput>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>