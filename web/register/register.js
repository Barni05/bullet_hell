function RegisterUser() {
  //Regex for character checking
  let allowed_username = /^[a-zA-Z0-9]{2,30}$/;

  //Displaying invalid character errormessages
  if (!$("#username").val().match(allowed_username)) {
    $("#username-invalid-character").removeClass("d-none");
  } else {
    $("#username-invalid-character").addClass("d-none");
    let username = $("#username").val();
    HashPassword($("#password").val()).then(function (hash) {
      $.ajax({
        type: "POST",
        url: "register_user.php",
        data: { username: username, password: hash },
        success: function (data, textStatus, xhr) {
          console.log(xhr.status);
          switch (xhr.status) {
            // If the registration succesful, open the site
            case 201:
              window.open("../index.php", "_self");
          }
        },
        error: function (data, textStatus, xhr) {
          console.error(xhr);
        },
      });
    });
  }
}
