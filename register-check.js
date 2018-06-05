function Check() {
    var name = "";
    name = String(document.getElementById("name").value);
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var passwordConfirm = document.getElementById("passwordConfirm").value;
    var email = document.getElementById("email").value;
    var adress = document.getElementById("adress").value;
    var zipCode = document.getElementById("zipCode").value;

    var nameComment = document.getElementById("nameComment").value;
    var usernameComment = document.getElementById("usernameComment").value;
    var passwordComment = document.getElementById("passwordComment").value;
    var passwordConfirmComment = document.getElementById("confirmPasswordComment").value;
    var emailComment = document.getElementById("emailComment").value;
    var adressComment = document.getElementById("adressComment").value;
    var zipCodeComment = document.getElementById("zipCodeComment").value;

    //name check
    var nameCheck = true;
    for (var i = 0; i < name.Length; i++) {
        if (name[i] < 'א' || name[i] > 'ת') {
            document.getElementById("nameComment").value = "amit";
        }
        else {
            document.getElementById("nameComment").value = "amit";
        }
    }
}