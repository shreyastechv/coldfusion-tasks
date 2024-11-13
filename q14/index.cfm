<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
		<script src="../js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script>
			const imageUploadForm = document.getElementById("imageUploadForm");
			const imageFileInput = document.getElementById("imageFile");
			const messageSection = document.getElementById("message");

			imageUploadForm.addEventListener('submit', function(event) {
				const filetypeArray = ['image/jpeg', 'image/png', 'image/gif'];
				const imageSizeInMB = imageFileInput.files[0].size / 1048576;

				if(!filetypeArray.includes(imageFileInput.files[0].type)) {
					messageSection.textContent = "Wrong image type detected! Use either a png, jpg, jpeg, or gif file.";
					event.preventDefault();
				}
				else if (imageSizeInMB >= 1) {
					messageSection.textContent = "File size should be less than 1MB.";
					event.preventDefault();
				} else {
					messageSection.textContent = "";
				}
			});
		</script>
	</body>
</html>