function validate() {
    const input = document.getElementById("userInput").value;
    if (isNaN(input)) {
        alert("You have entered non-numeric value");
        return false;
    }
    else {
        return true;
    }
}