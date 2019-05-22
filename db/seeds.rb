# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create([
    {login: 'user1', password: 'password1', email: 'user1@mail.ru', password_digest: '122'}, 
    {login: 'user2', password: 'password2', email: 'user2@mail.ru', password_digest: '122'},
    {login: :user3, password: :password3, email: 'user3@mail.ru', password_digest: '122'}])

Category.delete_all
Category.create([
    {title: 'digital TV'}, 
    {title: 'analog TV'}, 
    {title: 'satellite TV'}])

Test.delete_all
users = User.ids
categories = Category.ids
Test.create([
    {title: 'junior_ingeneer', level: 0, user_id: users[0], category_id: categories[0]},
    {title: 'junior_ingeneer', level: 1, user_id: users[0], category_id: categories[0]},
    {title: 'middle_ingeneer', level: 0, user_id: users[1], category_id: categories[1]},
    {title: 'middle_ingeneer', level: 1, user_id: users[1], category_id: categories[1]},
    {title: 'senior_ingeneer', level: 0, user_id: users[2], category_id: categories[2]},
    {title: 'senior_ingeneer', level: 1, user_id: users[2], category_id: categories[2]} ])

Question.delete_all
tests = Test.ids
Question.create([
    {test_id: tests[0], body: 'Что такое ТВК и СК диапазоны?'},
    {test_id: tests[0], body: 'Что такое эквалайзер, аттенюатор. Для чего они нужны?'},
    {test_id: tests[0], body: 'Что значит активное, пассивное устройство?'},
    {test_id: tests[0], body: 'В чем разница между QAM 128 и QAM256?'},
    {test_id: tests[0], body: 'Что такое C/N?'},
    {test_id: tests[0], body: 'Для какого из видов модуляции, указанных выше, необходимо лучшее значение C/N?'},
    {test_id: tests[1], body: 'Какие параметры цифрового сигнала используются в
        нашей сети(метод модуляции, скорость потока)?'},
    {test_id: tests[1], body: 'Что такое АЧX? Где мы её можем увидеть в своей работе?'},
    {test_id: tests[1], body: 'Какие частоты затухают быстрее низкие или
        высокие?'},
    {test_id: tests[1], body: 'Для чего с оптического приемника выдается сигнал с
        наклоном ( с использованием эквалайзера)?'},
    {test_id: tests[1], body: 'Что такое BER, MER.'},
    {test_id: tests[1], body: 'Сколько будет 2 + 3  и как зовут экзаменатора?'},
    {test_id: tests[2], body: 'Какая система звука используется в России?'},
    {test_id: tests[2], body: 'Выберете возможные системы цветности в аналоговом ТВ.'},
    {test_id: tests[2], body: 'Какая система звука используется в России?'},
    {test_id: tests[2], body: 'Каково максимально допустимое значение сигнала на абонентской розетке для аналогового ТВ?'},
    {test_id: tests[2], body: 'Каково минимально допустимое значение уровня сигнала на абонентской розетке?'},
    {test_id: tests[2], body: 'Назовите диапазон вещания тв каналов в кабельной сети.'},
    {test_id: tests[3], body: 'Какова ширина полосы пропускания одного канала?'},
    {test_id: tests[3], body: 'Максимальная неравномерность АЧХ всей полосы частот по ГОСТу?'},
    {test_id: tests[3], body: 'Максимальная разница в уровне смежных каналов по ГОСТу'},
    {test_id: tests[3], body: 'Какие максимальные значения эквалайзера и аттенюатора на оптических приемниках, используемых в нашей компании?'},
    {test_id: tests[3], body: 'Какие максимальные значения эквалайзера и аттенюатора на усилителях, используемых в нашей компании?'},
    {test_id: tests[3], body: 'Какие коаксиальные кабели используются нашей компанией?'}])

Answer.delete_all
questions = Question.ids
Answer.create([
    {question_id: questions[0], body: 'ТВК и СК диапазоны это диапазоны распределения ТВ каналов в частотной сети', correct: 1},
    {question_id: questions[1], body: 'Эквалайзер - для создания неравномерности АЧХ, Аттенюатор - для гашения сигнала по всей полосе частот', correct: 1},
    {question_id: questions[2], body: 'Активное - с питанием, пассивное - без', correct: 1},
    {question_id: questions[3], body: 'В глубине модуляции', correct: 1},
    {question_id: questions[4], body: 'С/N - это сигнал/шум', correct: 1},
    {question_id: questions[5], body: 'для QAM 256 сигнал/шум нужен лучше', correct: 1},
    {question_id: questions[6], body: 'QAM 256, 6875Мсим/ceк', correct: 1},
    {question_id: questions[7], body: 'АЧХ - это амплитудно-частотная характеристика', correct: 1},
    {question_id: questions[8], body: 'высокие затухают быстрее', correct: 1},
    {question_id: questions[9], body: 'Для компенсации затухания на коаксиальной части сети', correct: 1},
    {question_id: questions[10], body: 'MER - ошибки модуляции, BER - битовые ошибки', correct: 1},
    {question_id: questions[11], body: '2+2 будет 4', correct: 1},
    {question_id: questions[12], body: 'В России используется D/K', correct: 1},
    {question_id: questions[13], body: 'В аналоговом ТВ pal, secam, ntsc', correct: 1},
    {question_id: questions[14], body: 'Максимально 80 ДБ', correct: 1},
    {question_id: questions[15], body: 'Минимально 60 ДБ', correct: 1},
    {question_id: questions[16], body: 'Максимальная неравномерность по всей полосе 12Дб', correct: 1},
    {question_id: questions[17], body: 'Максимальное значение аттенюатора 15 Дб', correct: 1},
    {question_id: questions[18], body: 'кабели RG-6, RG-11', correct: 1}
])


