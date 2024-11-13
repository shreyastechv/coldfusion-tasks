<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
		<div class="container mt-5">
			<form class="d-flex flex-column gap-2" name="testform" method="post">
				<label for="text1">Please enter first text:</label>
				<input class="w-100 rounded-3 p-2" type="text" name="text1" id="text1" placeholder="Enter 1st text" required>
				<label for="text2">Please enter second text:</label>
				<input class="w-100 rounded-3 p-2" type="text" name="text2" id="text2" placeholder="Enter 2nd text" required>
				<input class="btn bg-success" type="submit" name="submit">
			</form>

			<div class="text-primary-emphasis text-center mt-3">
				<cfoutput>
					<cfif IsDefined("form.submit")>
						<cfif StructKeyExists(session.results, form.text1)>
							[#form.text1#] already present. Cannot add again.
						<cfelse>
							<cfset local.obj = createObject('component', 'components.comp')>
							<cfset local.result = local.obj.makeStruct(form.text1, form.text2)>
							<cfset StructAppend(session.results, local.result)>
						</cfif>
						<cfdump var = #session.results#>
					</cfif>
					<cfset StructClear(Form)>
				</cfoutput>
			</div>
		</div>
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>