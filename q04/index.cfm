<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="./css/styles.css" rel="stylesheet">
	</head>

    <body>
		<div class="container mt-5">
			<div class="text-primary-emphasis mt-3">
				<cfoutput>
					<cfset local.obj = createObject('component', 'comp')>
					<cfset local.result = local.obj.printDate()>
					<p>Todays Date: #local.result.todaysDate#</p>
					<p>Current Month in numeric: #local.result.currMonthInNum#</p>
					<p>Current Month in word: #local.result.currMonthInWord#</p>
					<p>Last Friday date: #local.result.lastFriday#</p>
					<p>Last day of month: #local.result.lastDayOfMonth#</p>
					<p>Last five days:</p>
					<cfloop array="#local.result.prevDays#" item="prevDay">
						<p class="#DayOfWeekAsString(DayOfWeek(prevDay))#">#DateFormat(prevDay, "dd-mmm-yyyy - dddd")#</p>
					</cfloop>
				</cfoutput>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>