document.getElementById("loginForm").addEventListener('submit', function (event) {
    const userName = document.getElementById("username").value;
    let usernameError = document.getElementById("usernameError");
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    let passwordConfirmError = document.getElementById("passwordConfirmError");

    if (userName.includes(" ")) {
        event.preventDefault();
        usernameError.textContent = "Username cannot contain any space.";
    }

    if (password !== confirmPassword) {
        event.preventDefault();
        passwordConfirmError.textContent = "Passwords must match.";
    }
});