document.getElementById("applicationForm").addEventListener('submit', function (event) {
    // User input
    const jobRole = document.getElementById("jobRole").value;
    const relocateChoice = document.querySelector('input[name="relocateChoice"]:checked').value;
    const startDate = document.getElementById("startDate").value;
    const firstName = document.getElementById("firstName").value;
    const lastName = document.getElementById("lastName").value;
    const mail = document.getElementById("mail").value;
    const phone1 = document.getElementById("phone1").value;
    const phone2 = document.getElementById("phone2").value;
    const phone3 = document.getElementById("phone3").value;

    // Error boxes
    let jobRoleError = document.getElementById("jobRoleError");
    let dateError = document.getElementById("dateError");
    let fullNameError = document.getElementById("fullNameError");
    let mailError = document.getElementById("mailError");
    let phoneError = document.getElementById("phoneError");

    if (jobRole == "") {
        jobRoleError.textContent = "This field is required. Please enter a value.";
        event.preventDefault();
    }
    else {
        jobRoleError.textContent = "";
    }

    if (startDate == "") {
        dateError.textContent = "This field is required. Please enter a value.";
        event.preventDefault();
    }
    else {
        dateError.textContent = "";
    }

    if (firstName == "" || lastName == "") {
        fullNameError.textContent = "This field is required. Please enter a value.";
        event.preventDefault();
    }
    else {
        fullNameError.textContent = "";
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (mail == "") {
        mailError.textContent = "This field is required. Please enter a value.";
        event.preventDefault();
    }
    else if (!emailPattern.test(mail)) {
        mailError.textContent = "Please enter a valid email address.";
        event.preventDefault();
    }
    else {
        mailError.textContent = "";
    }

    if (phone1 == "" || phone2 == "" || phone3 == "") {
        phoneError.textContent = "This field is required. Please enter a value.";
        event.preventDefault();
    }
    else if (isNaN(phone1) || isNaN(phone2) || isNaN(phone3)) {
        phoneError.textContent = "Only numbers are allowed.";
        event.preventDefault();
    }
    else if (phone1.length != 3 || phone2.length != 3 || phone3.length != 4) {
        phoneError.textContent = "Please enter a valid phone number.";
        event.preventDefault();
    }
    else {
        phoneError.textContent = "";
    }
});