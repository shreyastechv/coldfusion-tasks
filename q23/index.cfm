<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Coldfusion Task</title>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
    </head>

    <body>
		<cfoutput>
            <div class="container col-6 mainContainer">
                <div class="col-10">
                    <img src="assets/logo.PNG" alt="img">
                </div>
                <div class="col-12">
                    <div class="mt-3 col-11">
                        Employment Application
                        <p class="fw-1 para">Infinity Box Inc.</p>
                    </div>
                    <form method="post" id="applicationForm" class="mt-2 form" enctype="multipart/form-data">
                        <div class="col-5 text-secondary"> which position are you applying for?</div>
                        <select id="jobRole" name="jobRole" class="mt-2">
                            <option selected></option>
                            <option>Interface Designer</option>
                            <option>Software Engineer</option>
                            <option>System Administrator</option>
                            <option>Office manager</option>
                        </select>
                        <div class="error text-danger" id="jobRoleError"></div>

                        <div class="col-3 text-secondary mt-2" >Are you willing to relocate?</div>
                        <input type="radio" name="relocateChoice" value="Yes" class="mt-1 me-1" checked>Yes<br>
                        <input type="radio" name="relocateChoice" value="No" class="mt-2 me-1">No<br>
                        <div class="error text-danger" id="relocateError"></div>

                        <div class="col-3 text-secondary mt-2">When can you start?</div>
                        <input type="date" name="startDate" id="startDate"><br>
                        <div class="error text-danger" id="dateError"></div>

                        <div class="col-3 text-secondary mt-2">Portfolio website</div>
                        <input type="url" name="websiteUrl" class="mt-1" value="http://"><br>

                        <div class="col-5 text-secondary mt-2">Attach a copy of your resume</div>
                        <input type="file" name="resume" class="mt-1" accept=".pdf, .docx, .doc"><br>
                        <div class = "para">Word or PDF Documents Only</div><br>

                        <div class = "col-5 text-secondary mt-2">Salary requirements</div>
                        <input type="text" name="salaryReq" class="mt-1"><br>

                        <div class="para">Your contact information</div>
                        <div class="col-5 text-secondary mt-2">Name</div>
                        <div class="d-flex gap-1">
                            <input type="text" id="firstName" name="firstName" class="mt-1 col-2">
                            <input type="text" id="lastName" name="lastName" class = "mt-1 col-2">
                        </div>
                        <div class="error text-danger" id="fullNameError"></div>

                        <div class="col-5 text-secondary mt-2">Email address</div>
                        <input type="text" id="mail" name="mail" class="mt-1">
                        <div class="error text-danger" id="mailError"></div>

                        <div class = "col-5 text-secondary mt-2">Phone</div>
                        <input type= "text" id="phone1"  name="phone1" class="mt-1 col-1" maxlength="3"> -
                        <input type= "text" id="phone2"  name="phone2" class="mt-1 col-1" maxlength="3"> -
                        <input type= "text" id="phone3"  name="phone3" class="mt-1 col-1" maxlength="4">
                        <div class="error text-danger" id="phoneError"></div>

                        <button class="rounded-2 px-2 mt-2" type="submit" name="submit">submit</button><br>
                        This site is protected by reCAPTCHA Enterprise and the Google
                        <a href="#">Privacy Policy </a> and <a href="#">Terms of Service apply.</a>
                    </form>
                </div>
                <cfif structKeyExists(form,"submit")>
                    <cfset local.formObj=createObject("component","components.formSubmit")>
                    <cfset local.result=local.formObj.submitForm(form.jobRole, form.relocateChoice, form.startDate, form.websiteUrl, form.resume, form.salaryReq, form.firstName, form.lastName, form.mail, form.phone1, form.phone2, form.phone3)>
                    <cfif local.result IS "yes">
                        <div class="text-success text-center fs-5 mt-2">Data uploaded successfully</div>
                    <cfelse>
                        <div class="text-danger text-center fs-5 mt-2">Error uploading data</div>
                    </cfif>
                </cfif>
                <script>
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
                </script>
            </div>
        </cfoutput>
		<script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>