$(document).ready(function () {
    $("#username").keyup(function () {
        let username = $(this).val();
        if (username != "") {
            checkUsername(username);
        }
    });
});
function checkUsername(username, callback) {
    //Regex for character constraints
    let allowed_username = /^[a-zA-Z0-9]{2,30}$/;

    //Display errors if needed
    if (!username.match(allowed_username)) {
        $("#username-invalid-character").removeClass("d-none");
    } else {
        $("#username-invalid-character").addClass("d-none");
    }

    //Checks if username exists, if so, it warns the user
    $.ajax({
        type: "GET",
        url: `../src/php/username_exists.php?user=${username}`,
        success: function (data) {
            if (eval(`data.${username}`) == 1) {
                $("#username-exists").removeClass("d-none");
            } else {
                $("#username-exists").addClass("d-none");
            }
        },
    });
}

function LoginUser() {
    //Hashing the password
    HashPassword($("#password").val()).then(function(hash) {
        let username = $("#username").val();

        //Checking if the login credentials are correct
        $.ajax({
            type: "GET",
            url: "login_check.php",
            data: { username: username, password: hash },
            success: function (_data, _textStatus, xhr) { //On success, the user is taken to the main site
                switch (xhr.status) {
                    case 200:
                        window.open("../index.php", "_self");
                        break;
                }
            },
            error: function (xhr) { //Login error handling
                switch (xhr.status) {
                    case 401:
                        $("#incorrect-login").removeClass("d-none");
                        break;
                }
            },
        });
    });
}