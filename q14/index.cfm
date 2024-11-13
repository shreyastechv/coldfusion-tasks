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
				<form action="components/comp.cfc?method=uploadImage" id="imageUploadForm" name="imageUploadForm" method="post" enctype="multipart/form-data">
					<label for="imageName" class="form-label">Please enter a name for image:</label>
					<input class="form-control" type="text" name="imageName" id="imageName" placeholder="Enter name for image" required>
					<label for="imageDesc" class="form-label mt-3">Please enter image description:</label>
					<textarea class="form-control" type="text" name="imageDesc" id="imageDesc" required></textarea>
					<label for="imageFile" class="form-label mt-3">Please choose an image:</label>
					<input class="form-control" type="file" name="imageFile" id="imageFile" accept="image/jpeg, image/png, image/gif" required>
					<input class="btn bg-success mt-3" type="submit" id="submit" name="submit">
				</form>

				<div class="text-primary-emphasis mt-3">
					<div id="message"></div>
				</div>
			</div>
		</cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
		<script src="./js/script.js"></script>
	</body>
</html>