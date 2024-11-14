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
				<div class="text-primary-emphasis mt-3">
					<cfset local.objQuery = createObject('component', 'components.comp')>
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
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>