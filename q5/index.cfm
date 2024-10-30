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
			<cfform class="d-flex flex-column gap-2" name="testform" method="post">
				<label for="dob">Please enter your DOB:</label>
				<input class="w-100 rounded-3 p-2" type="date" name="dob" id="dob" required>
				<label for="dobMom">Please enter your mother's DOB:</label>
				<input class="w-100 rounded-3 p-2" type="date" name="dobMom" id="dobMom" required>
				<input class="btn bg-success" type="submit" name="submitBtn">
			</cfform>

			<div class="text-primary-emphasis mt-3">
				<cfoutput>
					<cfif IsDefined("Form.dob") AND IsDefined("Form.dobMom")>
						<cfset dob = CreateDateTime(Year(Form.dob), Month(Form.dob), Day(Form.dob))>
						<cfset dobMom = CreateDateTime(Year(Form.dobMom), Month(Form.dobMom), Day(Form.dobMom))>
						<cfset obj = createObject('component', 'comp')>
						<cfset result = obj.checkDate(dob, dobMom)>

						<p>Age: #result.age#<p>
						<p>Age of mother when delivery: #result.momsAgeWhileDelivery#<p>
						<p>Days remaining till birthday: #result.daysTillBday#<p>
						<p>Days remaining till mom's birthday: #result.daysTillBdayMom#<p>
					</cfif>
				</cfoutput>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>