puts "Сколько добавить покемонов? "
$a = gets.to_i

$pokemonarray = []

def pokemony()

    $a.times do
        puts "Введите имя покемона:"
        name = gets.chomp
        puts "Введите цвет покемона:"
        colour = gets.chomp
        
        $pokemonarray << {name: name, colour: colour}
    end
end

pokemony()
puts $pokemonarray