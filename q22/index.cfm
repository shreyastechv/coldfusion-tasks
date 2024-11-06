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
				<div class="text-primary-emphasis mt-3">
					<cfset local.objQuery = createObject('component', 'comp')>
					<cfset local.testQuery = local.objQuery.makeQuery()>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Name</th>
								<th>Age</th>
								<th>Location</th>
							</tr>
						</thead>
						<tbody>
							<cfloop query="local.testQuery">
								<tr>
									<td>#name#</td>
									<td>#age#</td>
									<td>#location#</td>
								</tr>
							</cfloop>
						</tbody>
					</table>

				</div>
			</div>
		</cfoutput>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>