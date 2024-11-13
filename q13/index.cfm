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
					<label for="keyword">Please enter search term:</label>
					<input class="w-100 rounded-3 p-2" type="text" name="keyword" id="keyword" placeholder="Example: the, quick, fox, etc." required>
					<input class="btn bg-success" type="submit" name="submit">
				</form>

				<div class="text-primary-emphasis mt-3">
						<cfif IsDefined("form.submit")>
							<cfset local.obj = createObject('component', 'components.comp')>
							<cfset local.count = local.obj.search(form.keyword)>
							Found the key word #local.count# times
						</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>