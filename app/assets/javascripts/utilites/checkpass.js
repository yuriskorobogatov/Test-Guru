  document.addEventListener('turbolinks:load', function () {
    var user_password_confirmation = document.getElementById('user_password_confirmation')

    var user_password = document.getElementById('user_password')

    if (user_password_confirmation) { user_password_confirmation.addEventListener('input', check) }

    if (user_password) { user_password.addEventListener('input', check) } 

});

var check = function() {
  var password = document.getElementById('user_password').value
  var conf_password = document.getElementById('user_password_confirmation').value
  var message = document.getElementById('message')
  var coincidence = document.querySelector('.octicon-thumbsup')
  var alert =  document.querySelector('.octicon-alert')

  if (password == conf_password && conf_password != '')  {

    coincidence.classList.remove('hide')
    alert.classList.add('hide')

    message.style.color = 'green';
    message.textContent = 'Пароли совпадают';

  } else if (password != conf_password && conf_password != '')  {

    coincidence.classList.add('hide')
    alert.classList.remove('hide')

    message.style.color = 'red';
    message.textContent = 'Пароли не совпадают';
  }
}