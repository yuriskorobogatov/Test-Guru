
document.addEventListener('turbolinks:load', function () {

    if (document.querySelector('.question') != null) {
      var question_sum = document.querySelector('.question').dataset.sum
    }
    if (document.querySelector('.question') != null){
      var questoin_num = document.querySelector('.question').dataset.num
    }
    if (document.querySelector('.questions') != null){
    var questoins_summ = document.querySelector('.questions').dataset.sumQuestions
    }
    if (document.querySelector('.answers') != null){
    var correct_answ = document.querySelector('.answers').dataset.correctAnswers
    }
    move(questoin_num, question_sum, questoins_summ, correct_answ)
  })
  
  function move(number, summ, questions, answers) {
    var elem = document.getElementById("myBar");
    var result_elem = document.getElementById("myBarResult");
    var percent = Math.floor(((number-1)/summ)*100)
    var result = Math.floor((answers/questions)*100)
    if (elem != null){
      elem.style.width = percent + '%'; 
      elem.innerHTML = percent + '%';
    }
    if (result_elem !=null){
    result_elem.style.width = result + '%'; 
    result_elem.innerHTML = result + '%';
    }
  }
