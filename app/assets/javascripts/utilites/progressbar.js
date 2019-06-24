document.addEventListener('turbolinks:load', function () {
    var number_of_question = Number(document.querySelector('.number-of-question').textContent)
    var count_of_questions = Number(document.querySelector('.count-of-questions').textContent)

    move(number_of_question, count_of_questions)
})

function move(number, summ) {
  var elem = document.getElementById("myBar"); 
      var percent = ((number-1)/summ)*100
      elem.style.width = percent + '%'; 
      elem.innerHTML = percent + '%';
}