TEXT = "text.txt"
RES = "results.txt"
require 'fileutils'

def index()
    File.foreach(RES) { |line| puts line }
end

def where(pattern)
    File.foreach(TEXT).with_index do |stud, index|
        create(stud) if stud.include?(pattern)
    end
end

def create(name)
    file = File.open(RES, "a")
    file.write(name)
end

loop do 
    print "Введите возраст: "
    age = gets
    where(age)
    FileUtils.compare_file(TEXT, RES)
    break if age.to_i == -1 || FileUtils.identical?(TEXT, RES)
end
index()