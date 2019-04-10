# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create([
    {login: 'user1', password: 'password1'}, 
    {login: 'user2', password: 'password2'},
    {login: :user3, password: :password3}])

Category.delete_all
Category.create([
    {title: 'digital TV'}, 
    {title: 'analog TV'}, 
    {title: 'satellite TV'}])

Test.delete_all
Test.create([
    {title: 'junior_ingeneer', level: 0, category_id: 1},
    {title: 'middle_ingeneer', level: 1, category_id: 1},
    {title: 'junior_ingeneer', level: 0, category_id: 2},
    {title: 'middle_ingeneer', level: 1, category_id: 2},
    {title: 'junior_ingeneer', level: 0, category_id: 3},
    {title: 'middle_ingeneer', level: 1, category_id: 3},
    {title: 'junior_master', level: 0, category_id: 1},
    {title: 'middle_master', level: 1, category_id: 1},
    {title: 'junior_master', level: 0, category_id: 2},
    {title: 'middle_master', level: 1, category_id: 2},
    {title: 'junior_master', level: 0, category_id: 3},
    {title: 'middle_master', level: 1, category_id: 3}])

Question.delete_all
Question.create([
    {test_id: 1, body: 'Что такое ТВК и СК диапазоны?'},
    {test_id: 1, body: 'Что такое эквалайзер, аттенюатор. Для чего они нужны?'},
    {test_id: 1, body: 'Что значит активное, пассивное устройство?'},
    {test_id: 1, body: 'В чем разница между QAM 128 и QAM256?'},
    {test_id: 1, body: 'Что такое C/N?'},
    {test_id: 1, body: 'Для какого из видов модуляции, указанных выше, необходимо лучшее значение C/N?'},
    {test_id: 2, body: 'Какие параметры цифрового сигнала используются в
        нашей сети(метод модуляции, скорость потока)?'},
    {test_id: 2, body: 'Что такое АЧX? Где мы её можем увидеть в своей работе?'},
    {test_id: 2, body: 'Какие частоты затухают быстрее низкие или
        высокие?'},
    {test_id: 2, body: 'Для чего с оптического приемника выдается сигнал с
        наклоном ( с использованием эквалайзера)?'},
    {test_id: 2, body: 'Что такое BER, MER.'},
    {test_id: 2, body: 'Сколько будет 2 + 3  и как зовут экзаменатора?'},
    {test_id: 3, body: 'Какая система звука используется в России?'},
    {test_id: 3, body: 'Выберете возможные системы цветности в аналоговом ТВ.'},
    {test_id: 3, body: 'Какая система звука используется в России?'},
    {test_id: 3, body: 'Каково максимально допустимое значение сигнала на абонентской розетке для аналогового ТВ?'},
    {test_id: 3, body: 'Каково минимально допустимое значение уровня сигнала на абонентской розетке?'},
    {test_id: 3, body: 'Назовите диапазон вещания тв каналов в кабельной сети.'},
    {test_id: 4, body: 'Какова ширина полосы пропускания одного канала?'},
    {test_id: 4, body: 'Максимальная неравномерность АЧХ всей полосы частот по ГОСТу?'},
    {test_id: 4, body: 'Максимальная разница в уровне смежных каналов по ГОСТу'},
    {test_id: 4, body: 'Какие максимальные значения эквалайзера и аттенюатора на оптических приемниках, используемых в нашей компании?'},
    {test_id: 4, body: 'Какие максимальные значения эквалайзера и аттенюатора на усилителях, используемых в нашей компании?'},
    {test_id: 4, body: 'Какие коаксиальные кабели используются нашей компанией?'}])

Answer.delete_all
Answer.create([
    {question_id: 1, body: 'ТВК и СК диапазоны это диапазоны распределения ТВ каналов в частотной сети'},
    {question_id: 1, body: 'Активное - с питанием, пассивное - без'},
    {question_id: 1, body: 'В глубине модуляции'},
    {question_id: 1, body: 'С/N - это сигнал/шум'},
    {question_id: 1, body: 'АЧХ - это амплитудно-частотная характеристика'},
    {question_id: 1, body: 'высокие затухают быстрее'},
    {question_id: 1, body: 'MER - ошибки модуляции, BER - битовые ошибки'},
    {question_id: 1, body: '2+2 будет 4'},
    {question_id: 1, body: 'В России используется D/K'},
    {question_id: 1, body: 'В аналоговом ТВ pal, secam, ntsc'},
    {question_id: 1, body: 'Максимально 80 ДБ'},
    {question_id: 1, body: 'Минимально 60 ДБ'},
    {question_id: 1, body: 'Максимальная неравномерность по всей полосе 12Дб'},
    {question_id: 1, body: 'Максимальное значение аттенюатора 15 Дб'},
    {question_id: 1, body: 'кабели RG-6, RG-11'}
])


