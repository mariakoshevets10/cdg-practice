DEFAULT_START_BALANCE = 100.0
BALANCE_FILE = "balance.txt"

class CashMachine
  def inititialize
    if File.exist?(BALANCE_FILE)
      @file = File.open(BALANCE_FILE)
      @string = @file.read.chomp
      @bal = @string.to_f
      @file.close
    else
      @bal = DEFAULT_START_BALANCE
    end
  end

  def init 
    loop do
      puts "Чтобы внести деньги: введите d"
      puts "Чтобы вывести деньги: введите w"
      puts "Чтобы проверить баланс: введите b"
      puts "Чтобы выйти: введите q"
      print "Введите команду: "
      @operation = gets.to_s.downcase.chomp
      break if @operation == "q"
      if @operation == "d"
          deposit
      elsif @operation == "w"
          withdraw
      elsif @operation == "b"
          balance
      else 
          print "Вы ввели неверную букву, попробуйте еще раз"
      end
    end
  end

  def deposit
    puts "Ваш баланс:",  @bal
    print "Сумма депозита: "
    @dep = gets.to_f
    if @dep > 0 
        @bal += @dep
        puts "Ваш новый баланс: ", @bal
        File.open(BALANCE_FILE, "w") { |s| s.write @bal}
    else 
        puts "Ваш депозит меньше 0"
    end
  end

  def withdraw
    puts "Ваш баланс:",  @bal
    puts "Какую сумму хотите снять: "
    @with = gets.to_f
    if @with >0 && @with <= @bal.to_f
        @bal -= @with
        puts "Ваш новый баланс: ", @bal
        File.open(BALANCE_FILE, "w") { |s| s.write @bal}
    else 
        puts "Недостаточно средств "
    end
  end

  def balance
    @file = File.open(BALANCE_FILE)
    @bal = @file.read.to_f
    puts "Ваш баланс : ", @bal
    @file.close
  end

end
Atm = CashMachine.new 
Atm.init