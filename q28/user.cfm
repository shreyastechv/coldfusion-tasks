<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="../js/fontawesome.js"></script>
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<div class="text-primary-emphasis mt-3">
					<cfif NOT StructKeyExists(session, "userRole")>
						<cflocation url="index.cfm" addToken="no">
					<cfelseif session.userRole IS "user">
                        <cfset objComponent = CreateObject('component', 'getPages')>
                        <cfset queryPages = objComponent.getPages()>
                        <ul>
                            <cfloop query="queryPages">
                                <li class="mb-2">
                                    <div class="d-flex align-items-center gap-4">
                                        <button type="button" class="btn btn-info" data-bs-toggle="collapse" data-bs-target="###pageid#">#pagename#</button>
                                    </div>
                                    <div id="#pageid#" class="collapse">#pagedescs#</div>
                                </li>
                            </cfloop>
                        </ul>
                    <cfelse>
                        <cflocation url="admin.cfm" addToken="no">
					</cfif>
					<a class="btn btn-primary" id="logoutBtn" name="logoutBtn" href="comp.cfc?method=logOut">Log Out</a>
				</div>
			</div>
		</cfoutput>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>