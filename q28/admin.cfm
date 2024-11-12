<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="css/styles.css" rel="stylesheet">
		<script src="../js/fontawesome.js"></script>
		<script src="../js/jquery-3.7.1.min.js"></script>
	</head>

    <body>
		<cfoutput>
			<div class="container mt-5">
				<div class="text-primary-emphasis mt-3">
					<cfif NOT StructKeyExists(session, "userRole")>
						<cflocation url="index.cfm" addToken="no">
					<cfelseif session.userRole IS "user">
						<cflocation url="user.cfm" addToken="no">
					<cfelse>
						<cfif StructKeyExists(session, "userRole") AND (session.userRole IS "admin" OR session.userRole IS "editor")>
							<cfset local.objComponent = CreateObject('component', 'getPages')>
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
					<a class="btn btn-primary" id="logoutBtn" name="logoutBtn" href="comp.cfc?method=logOut">Log Out</a>
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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script>
			function deletePage(pageid, pagename) {
				if (confirm(`Delete the page '${pagename}'?`)) {
					$.ajax({
						type: "POST",
						url: "deletePage.cfc?method=deletePage",
						dataType: "json",
						data: {pageid: pageid},
						success: function(data) {
							if (!data) {
								alert("Unable to delete the page due to lower privileges!");
							}
						}
					});
					location.reload();
				}
			}

			function OverlayToggle() {
				const overlayForm = document.getElementById("overlayForm");
				const addPageBtn = document.getElementById("addPageBtn");

				if (overlayForm.style.display == "block") {
					overlayForm.style.display = "none";
					addPageBtn.style.backgroundColor = "white";
					addPageBtn.innerHTML = "<i class='fa-solid fa-plus'>";
				}
				else {
					overlayForm.style.display = "block";
					addPageBtn.style.backgroundColor = "red";
					addPageBtn.innerHTML = "<i class='fa-solid fa-xmark'></i>";
				}
			}

			document.getElementById("addPageForm").addEventListener('submit', function (event) {
				const pageName = document.getElementById("pageNameInput").value;
				const pageDesc = document.getElementById("pageDescInput").value;
				const pageId = document.getElementById("pageIdInput").value;
				let ajaxData = {pageName: pageName, pageDesc: pageDesc};
				let url = "";
				if (pageId != "") {
					ajaxData.pageId = parseInt(pageId);
					ajaxUrl = "modifyPage.cfc?method=editPage";
				}
				else {
					ajaxUrl = "modifyPage.cfc?method=addPage";
				}
				event.preventDefault();
				$.ajax({
					type: "POST",
					url: ajaxUrl,
					dataType: "json",
					data: ajaxData,
					success: function(result){
						location.reload(result);
					}
				});
			});

			function addPage() {
				document.getElementById("pageIdInput").value = "";
				document.getElementById("pageNameInput").value = "";
				document.getElementById("pageDescInput").value = "";
				OverlayToggle();
			}

			function editPage(pageid, pagename, pagedescs) {
				document.getElementById("pageIdInput").value = pageid;
				document.getElementById("pageNameInput").value = pagename;
				document.getElementById("pageDescInput").value = pagedescs;
				OverlayToggle();
			}
		</script>
	</body>
</html>