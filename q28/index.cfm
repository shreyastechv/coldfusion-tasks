<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<script src="../js/fontawesome.js"></script>
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<div class="text-primary-emphasis mt-3">
					<cfif StructKeyExists(session, "userRole") AND (session.userRole IS "admin" OR session.userRole IS "editor")>
                        <cflocation url="admin.cfm" addToken="no">
					<cfelse>
                        <cfset objComponent = CreateObject('component', 'components.getPages')>
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
					</cfif>
                    <cfif StructKeyExists(session, "userRole")>
                        <a class="btn btn-primary" id="logoutBtn" name="logoutBtn" href="components/logOut.cfc?method=logOut">Log In</a>
                    <cfelse>
					    <a class="btn btn-primary" id="loginBtn" name="loginBtn" href="login.cfm">Log In</a>
                    </cfif>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>