//Password Protection Section
//Original Password
const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('.Password');

togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});


//Re-entered Password
const repasswordToggle = document.querySelector('#rePassword');
const Ppassword = document.querySelector('.PPassword');

repasswordToggle.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = Ppassword.getAttribute('type') === 'password' ? 'text' : 'password';
    Ppassword.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});


////disply poricive message wehn suff is right
//function passwordCorrect() {
//    //get modal
//    var modal = document.getElementById("passwordModal");
//    //getButton
//    var passwordBtn = document.getElementById("btnSignup");
//    //get label
//    var passwordLabel = document.getElementById("lblconfirmPassword")
//}

