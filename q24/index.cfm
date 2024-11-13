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
				<form id="subscribeForm" name="subscribeForm" method="post" onsubmit="subscribe()">
					<label class="form-label" for="userFirstName">Enter your first name:</label>
					<input class="form-control mb-3" type="text" id="userFirstName" name="userFirstName" required>

					<div class="form-group d-flex gap-3">
						<label class="form-label col-3 h-100" for="userEmail">Enter email ID:</label>
						<input class="form-control col h-100 mb-3" type="email" id="userEmail" name="userEmail" required>
						<button class="btn btn-secondary h-100 col-2" type="button" onclick="validateEmail()">Check</button>
					</div>

					<input class="btn btn-primary" type="submit" id="submit" name="submit" value="Subscribe" disabled>
				</form>

				<div class="text-primary-emphasis mt-3">
					<div id="status"></div>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
		<script src="./js/script.js"></script>
	</body>
</html>