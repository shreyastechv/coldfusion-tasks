<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
		<div class="container mt-5">
			<form class="d-flex flex-column gap-2" name="testform" method="post">
				<label for="num">Please enter a number:</label>
				<input class="w-100 rounded-3 p-2" type="number" name="num" id="num" placeholder="Enter number from 1-5" min="1" max="5" required>
				<input class="btn bg-success" type="submit" name="submit">
			</form>

			<div class="text-primary-emphasis text-center mt-3">
				<cfif IsDefined("form.submit")>
					<cfset local.num = #form.num#>
					<cfset local.obj = createObject('component', 'components.comp')>
					<cfset local.result = local.obj.checkNum(local.num)>
					<cfoutput>#local.result#</cfoutput>
				</cfif>
			</div>
		</div>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>