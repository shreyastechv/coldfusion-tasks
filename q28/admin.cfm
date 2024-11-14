<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link href="css/styles.css" rel="stylesheet">
		<script src="../js/fontawesome.js"></script>
		<script src="../js/jquery-3.7.1.min.js"></script>
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<div class="text-primary-emphasis mt-3">
					<cfif NOT StructKeyExists(session, "userRole")>
						<cflocation url="login.cfm" addToken="no">
					<cfelseif session.userRole IS "user">
						<cflocation url="index.cfm" addToken="no">
					<cfelse>
						<cfif StructKeyExists(session, "userRole") AND (session.userRole IS "admin" OR session.userRole IS "editor")>
							<cfset local.objComponent = CreateObject('component', 'components.getPages')>
							<cfset local.queryPages = local.objComponent.getPages()>
							<ul>
								<cfloop query="local.queryPages">
									<li class="mb-2">
										<div class="d-flex align-items-center gap-2">
											<button type="button" class="btn btn-info" data-bs-toggle="collapse" data-bs-target="###pageid#">#pagename#</button>
											<button class="btn" type="button" onclick="editPage('#pageid#', '#pagename#', '#pagedescs#')"><i class="fa-solid fa-pen-to-square text-white"></i></button>
											<button class="btn" type="button" onclick="deletePage('#pageid#', '#pagename#')"><i class="fa-solid fa-trash text-danger"></i></button>
										</div>
										<div id="#pageid#" class="collapse">#pagedescs#</div>
									</li>
								</cfloop>
							</ul>
							<button id="addPageBtn" type="button" class="btn btn-light addPageBtn" onclick="addPage()"><i class="fa-solid fa-plus"></i></button>
						<cfelse>
							<cflocation url="index.cfm" addToken="no">
						</cfif>
					</cfif>
                    <button type="button" class="btn btn-danger" id="logoutBtn" name="logoutBtn" onclick="logOut()">Log Out</button>
					<div id="overlayForm" class="overlayForm">
						<form name="addPageForm" id="addPageForm" method="post">
							<label class="form-label text-white" for="pageNameInput">Enter page name:</label>
							<input class="form-control mb-3" type="text" id="pageNameInput" name="pageNameInput" required>
							<label class="form-label text-white" for="pageDescInput">Enter page description:</label>
							<textarea class="form-control mb-3" id="pageDescInput" name="pageDescInput" maxlength="500" rows="7" required></textarea>
							<input type="hidden" id="pageIdInput" name="pageIdInput" value="">
							<input class="btn btn-primary" type="submit" id="submit" name="submit">
						</form>
					</div>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
		<script src="./js/admin.js"></script>
	</body>
</html>