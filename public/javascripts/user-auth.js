$(document).ready(function() {
  // Getting references to our form and inputs
  const emailInput = $('input#email-input');
  const passwordInput = $('input#password-input');
  const loginSubmit = $('#login-submit');
  // When the form is submitted, we validate there's an email and password entered
  loginSubmit.on('click', function(event) {
    event.preventDefault();
    console.log(`submitted`);
    const userData = {
      email: emailInput.val().trim(),
      password: passwordInput.val().trim()
    };

    if (!userData.email || !userData.password) {
      return;
    }

    // If we have an email and password we run the loginUser function and clear the form
    loginUser(userData.email, userData.password);
    emailInput.val('');
    passwordInput.val('');
  });

  // loginUser does a post to our 'api/login' route and if successful, redirects us the the members page
  function loginUser(email, password) {
    $.post('/api/login', {
      email: email,
      password: password
    }).then(function(data) {
      window.location.pathname = '/members';
  
      // If there's an error, log the error
    }).catch(function(err) {
      console.log(err);
    });
  }


  //nav-login, nav-signup, nav-logout

  $('#nav-login').on('click', function(){
    $.get('/login');
  })

  $('#nav-logout').on('click', function() {
    $.get('/api/logout');
    location.reload();
  })
});

