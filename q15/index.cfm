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
			<div class="text-primary-emphasis mt-3">
				<cfoutput>

					<!--- Using createObject function --->
					<cfset obj1 = createObject('component', 'comp')>
					<cfset product1 = obj1.multiply(1,2)>
					Using createObject function: #product1#
					<br>

					<!--- Using cfobject tag --->
					<cfobject name="obj2" component="comp">
					<cfset product2 = obj2.multiply(1,2,3)>
					Using cfobject tag: #product2#
					<br>

					<!--- Using cfinvoke tag --->
					<cfobject name="obj3" component="comp">
					<cfset args = [1,2,3,4]>
					<cfinvoke component="#obj3#" method="multiply" argumentCollection="#args#" returnVariable="product3">
					</cfinvoke>
					Using cfinvoke tag: #product3#
				</cfoutput>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>