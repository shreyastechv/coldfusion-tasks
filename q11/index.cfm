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

					<cfset local.result1 = local.objMultiply.multiply(1,2)>
					1x2 = #local.result1#
					<br>
					<cfset local.result2 = local.objMultiply.multiply(1,2,3)>
					1x2x3 = #local.result2#
					<br>
					<cfset local.result3 = local.objMultiply.multiply(1,2,3,4)>
					1x2x3x4 = #local.result3#
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>