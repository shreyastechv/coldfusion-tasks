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
				<form class="d-flex flex-column gap-2" name="testform" method="post">
					<label for="num">Please enter a number:</label>
					<input class="w-100 rounded-3 p-2" type="number" name="num" id="num" placeholder="Enter number from 1-5" min="1" max="5" required>
					<input class="btn bg-success" type="submit" name="submit">
				</form>

				<div class="text-primary-emphasis text-center mt-3">
					<cfif IsDefined("form.submit")>
						<cfset local.num = .num>
						<cfset local.obj = createObject('component', 'comp')>
						<cfset local.result = local.obj.checkNum(local.num)>
						#local.result#
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>