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
				<form class="d-flex flex-column gap-2" name="testform" method="post">
					<label for="queryNum">Please enter a number between 1-10 :</label>
					<input class="w-100 rounded-3 p-2" type="number" name="queryNum" id="queryNum" min="1" max="10" placeholder="Enter a number" required>
					<input class="btn bg-success" type="submit" name="submit">
				</form>

				<div class="text-primary-emphasis mt-3">
					<cfset local.obj = createObject('component', 'components.comp')>
					<cfif IsDefined("Form.queryNum")>
						<cfset local.result = local.obj.testQuery(Form.queryNum)>
					<cfelse>
						<cfset local.result = local.obj.testQuery()>
					</cfif>

					Fullnames of people: <br>
					<cfloop query="local.result.qOut">
						#local.result.qOut.firstname#
						#local.result.qOut.lastname#
						<br>
					</cfloop>
					<cfif StructKeyExists(form, "submit")>
						<br>
						#form.queryNum# th row first name is #local.result.nthName#
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>