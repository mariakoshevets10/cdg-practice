BAL = "balance.txt"
START_BALANCE = 100.0
$balance = ""

if File.exist?(BAL) 
    file = File.open(BAL)
    file_read = file.read
    $balance = file_read.to_f
    file.close
else  
    $balance = START_BALANCE
end

def deposit()
    puts "Ваш баланс:",  $balance
    puts "Сумма депозита: "
    dep = gets.to_f
    if dep > 0 
        $balance += dep
        puts "Ваш новый баланс: ", $balance
        File.open(BAL, "w") { |s| s.write $balance}
    else 
        puts "Ваш депозит меньше 0"
    end
end

def withdraw()
    puts "Ваш баланс:",  $balance
    puts "Какую сумму хотите снять: "
    with = gets.to_f
    if with >0 && with <= $balance 
        $balance -= with
        puts "Ваш новый баланс: ", $balance
        File.open(BAL, "w") { |s| s.write $balance}
    else 
        puts "Недостаточно средств "
    end
end

def balance()
    file = File.open(BAL)
    b = file.read.to_f
    puts "Ваш баланс : ", b
    file.close
end

loop do
    puts "Чтобы внести деньги: введите d"
    puts "Чтобы вывести деньги: введите w"
    puts "Чтобы проверить баланс: введите b"
    puts "Чтобы выйти: введите q"
    operation = gets.to_s.downcase.chomp
    break if operation == "q"
    if  operation == "d"
        deposit()
    elsif operation == "w"
        withdraw()
    elsif operation == "b"
        balance()
    else 
        print "Вы ввели неверную букву, попробуйте еще раз"
    end
end