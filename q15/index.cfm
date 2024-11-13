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
			<div class="text-primary-emphasis mt-3">
				<cfoutput>

					<!--- Using createObject function --->
					<cfset local.obj1 = createObject('component', 'components.comp')>
					<cfset local.product1 = local.obj1.multiply(1,2)>
					Using createObject function: #local.product1#
					<br>

					<!--- Using cfobject tag --->
					<cfobject name="local.obj2" component="components.comp">
					<cfset local.product2 = local.obj2.multiply(1,2,3)>
					Using cfobject tag: #local.product2#
					<br>

					<!--- Using cfinvoke tag --->
					<cfobject name="local.obj3" component="components.comp">
					<cfset local.args = [1,2,3,4]>
					<cfinvoke component="#local.obj3#" method="multiply" argumentCollection="#local.args#" returnVariable="local.product3">
					</cfinvoke>
					Using cfinvoke tag: #local.product3#
				</cfoutput>
			</div>
		</div>
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>