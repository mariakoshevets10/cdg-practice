
    puts("Введите свое имя: ")
    name = gets.chomp()

    puts("Введите фамилию: ")
    surname = gets.chomp()

    puts("Введите возраст: ")
    age = gets.to_i()

def greeting (name, surname, age)

    puts "Привет, #{name} #{surname}."
    age < 18 ? "Тебе меньше 18, но начать учиться программировать никогда не рано" : "Самое время заняться делом"
   
end

puts greeting name, surname, age
