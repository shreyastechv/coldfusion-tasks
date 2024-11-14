function logOut() {
    if(confirm("Do you want to logout?")) {
        $.ajax({
            type: "POST",
            url: "./components/logOut.cfc?method=logOut",
            success: function(){
                location.reload();
            }
        });
    }
}