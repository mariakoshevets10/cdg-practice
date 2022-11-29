
    print("Введите свое имя: ")
    name = gets.chomp()

    print("Введите фамилию: ")
    surname = gets.chomp()

    print("Введите возраст: ")
    age = gets.to_i()

def greeting (name, surname, age)

    puts "Привет, #{name} #{surname}."
    age < 18 ? "Тебе меньше 18, но начать учиться программировать никогда не рано" : "Самое время заняться делом"
   
end

puts greeting name, surname, age
