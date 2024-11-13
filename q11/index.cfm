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
					<cfset local.objMultiply = createObject('component', 'components.functions')>

					<cfset res = local.objMultiply.multiply(1,2)>
					1x2 = #res#
					<br>
					<cfset res = local.objMultiply.multiply(1,2,3)>
					1x2x3 = #res#
					<br>
					<cfset res = local.objMultiply.multiply(1,2,3,4)>
					1x2x3x4 = #res#
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>