const subscribeForm = document.getElementById("subscribeForm");
const userFirstNameInput = document.getElementById("userFirstName");
const userEmailInput = document.getElementById("userEmail");
const submitBtn = document.getElementById("submit");
const statusSection = document.getElementById("status");

subscribeForm.addEventListener('submit', function (event) { event.preventDefault(); });
userEmailInput.addEventListener('change', function () {
    submitBtn.disabled = true;
    statusSection.style.color = "grey";
    statusSection.textContent = "Click 'Check' button to check email.";
});

function validateEmail() {
    if (userEmailInput.value == "") {
        statusSection.style.color = "red";
        statusSection.textContent = "INPUT IS EMPTY!";
        return;
    }
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText === "true") {
                submitBtn.disabled = true;
                statusSection.style.color = "red";
                statusSection.textContent = "Email already exists in the database.";
            }
            else {
                submitBtn.disabled = false;
                statusSection.style.color = "cyan";
                statusSection.textContent = "Email not subscribed. Click the button to join mailing list.";
            }
        }
    };
    xhttp.open("GET", "components/comp.cfc?method=isEmailPresent&userEmail="+userEmailInput.value, true);
    xhttp.send();
}

function subscribe() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            submitBtn.disabled = true;
            statusSection.style.color = "green";
            statusSection.textContent = "Email subscribed.";
            userEmailInput.value = "";
            userFirstNameInput.value = "";
        }
        else {
            statusSection.style.color = "red";
            statusSection.textContent = "Unable to subscribe.";
        }
    };
    xhttp.open("GET", "components/comp.cfc?method=addUserData&userEmail="+userEmailInput.value+"&userFirstName="+userFirstNameInput.value, true);
    xhttp.send();
}