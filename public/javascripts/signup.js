$(function() {
  // Getting references to our form and input
  var signupForm = $("form#auth-form");
  var emailInput = $("input#email-input");
  var passwordInput = $("input#password-input");

  // When the signup button is clicked, we validate the email and password are not blank
  signupForm.on("submit", function(event) {
    event.preventDefault();
    event.stopPropagation();

    var userData = {
      email: emailInput.val().trim(),
      password: passwordInput.val().trim()
    };  

    if (!userData.email || !userData.password) {
      return;
    }
    // If we have an email and password, run the signUpUser function
    signUpUser(userData.email, userData.password);
    emailInput.val('');
    passwordInput.val('');
  });

  // Does a post to the signup route. If succesful, we are redirected to the members page
  // Otherwise we log any errors
  function signUpUser(email, password) {
    $.post("/api/signup", {
      email: email,
      password: password
    }).then(function(data) {
      
      window.location.pathname = "/members";
      // If there's an error, handle it by throwing up a boostrap alert
    }).catch(handleLoginErr);
  }

  function handleLoginErr(err) {
    console.log(err)
    $("#login-issue").text('Username or Password is incorrect.');
  }
});
