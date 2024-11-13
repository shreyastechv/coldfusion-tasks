<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<form class="d-flex flex-column gap-2" name="testform" method="post">
					<label for="dob">Please enter your DOB:</label>
					<input class="w-100 rounded-3 p-2" type="date" name="dob" id="dob" required>
					<label for="dobMom">Please enter your mother's DOB:</label>
					<input class="w-100 rounded-3 p-2" type="date" name="dobMom" id="dobMom" required>
					<input class="btn bg-success" type="submit" name="submit">
				</form>

				<div class="text-primary-emphasis mt-3">
						<cfif IsDefined("form.submit")>
							<cfset local.dob = CreateDateTime(Year(form.dob), Month(form.dob), Day(form.dob))>
							<cfset local.dobMom = CreateDateTime(Year(form.dobMom), Month(form.dobMom), Day(form.dobMom))>
							<cfset local.obj = createObject('component', 'components.comp')>
							<cfset local.result = local.obj.checkDate(local.dob, local.dobMom)>

							Age: #local.result.age#<br>
							Age of mother when delivery: #local.result.momsAgeWhileDelivery#<br>
							Days remaining till birthday: #local.result.daysTillBday#<br>
							Days remaining till mom's birthday: #local.result.daysTillBdayMom#<br>
						</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>