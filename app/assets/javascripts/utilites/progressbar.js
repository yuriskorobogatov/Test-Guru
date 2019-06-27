
document.addEventListener('turbolinks:load', function () {
    if (document.querySelector('.question') != null) {
      var question_sum = document.querySelector('.question').dataset.sum
    }
    if (document.querySelector('.question') != null){
      var questoin_num = document.querySelector('.question').dataset.num
    }
  
    move(questoin_num, question_sum)
  })
  
  function move(number, summ) {
    var elem = document.getElementById("myBar"); 
    var percent = ((number-1)/summ)*100
    if (elem != null){
      elem.style.width = percent + '%'; 
      elem.innerHTML = percent + '%';
    }
  }
