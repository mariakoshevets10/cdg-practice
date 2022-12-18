TEXT = "text.txt"

def index
    File.foreach(TEXT) { |people| puts people }
end

index 

def find(id)
    File.foreach(TEXT).with_index do |stud, index|
        if id == index
            puts stud
        end
    end
end
find(5)

def where(pattern)
    arr = []
    File.foreach(TEXT).with_index do |stud, index|
    arr.push(index) if stud.include?(pattern)
    end
puts arr
end
where("Варв") 

NEW = "newfile.txt"
def update(id, text)
   file = File.open(NEW, 'w')
   File.foreach(TEXT).with_index do |student, index|
        file.puts(id == index ? text : student)
   end

    file.close
    File.write(TEXT, File.read(NEW))

    File.delete(NEW) if File.exist?(NEW)
end
update(1, "change")

def delete(id)
    file = File.open("newfile.txt", 'w')
    File.foreach(TEXT).with_index do |student, index|
         file.puts(id == index ? nil : student)
    end

     file.close
     File.write(TEXT, File.read("newfile.txt"))
 
     File.delete("newfile.txt") if File.exist?("newfile.txt")
 end
 delete(2)

def create(name)
    file = File.open(TEXT, "a")
    file.write(name)
end
create("Новая строка")