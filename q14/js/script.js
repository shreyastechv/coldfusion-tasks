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