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
                    <cfif StructKeyExists(session, "imagePath")>
                        <a href="details.cfm">#session.imageName#</a> -
					    <cfimage source="#session.ImagePath#" width="20" height="20" action="writeToBrowser">
                    <cfelse>
                        <cflocation url="index.cfm" addToken="no">
					</cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
	</body>
</html>