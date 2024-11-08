<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script>
			var subscribeForm = document.getElementById("subscribeForm");
			subscribeForm.addEventListener('submit', function (event) { event.preventDefault(); });

			function validateEmail() {
				const userEmail = document.getElementById("userEmail").value;
				if (userEmail == "") return;
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						if (this.responseText === "true") {
							document.getElementById("submit").disabled = true;
							document.getElementById("status").style.color = "red";
							document.getElementById("status").textContent = "Email already exists in the database.";
						}
						else {
							document.getElementById("submit").disabled = false;
							document.getElementById("status").style.color = "cyan";
							document.getElementById("status").textContent = "Email not subscribed. Click the button to join mailing list.";
						}
					}
				};
				xhttp.open("GET", "comp.cfc?method=isEmailPresent&userEmail="+userEmail, true);
				xhttp.send();
			}

			function subscribe() {
				const userEmail = document.getElementById("userEmail").value;
				const userFirstName = document.getElementById("userFirstName").value;
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("submit").disabled = true;
						document.getElementById("status").style.color = "green";
						document.getElementById("status").textContent = "Email subscribed.";
					}
					else {
						document.getElementById("status").style.color = "red";
						document.getElementById("status").textContent = "Unable to subscribe.";
					}
				};
				xhttp.open("GET", "comp.cfc?method=addUserData&userEmail="+userEmail+"&userFirstName="+userFirstName, true);
				xhttp.send();
			}
		</script>
	</body>
</html>