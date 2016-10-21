require "./Library"
require "./Library_Manager"

lm=LibraryManager.new
l1=Library.new("docker","1.10",45)
l2=Library.new("libc","4.56",21)
l3=Library.new("gstreamer","2.2",123)
l4=Library.new("array","3.3c",15)
lm.addlibrary(l1)
lm.addlibrary(l2)
lm.addlibrary(l3)
lm.addlibrary(l4)
lm.addDependancy(l1, l2)
lm.addDependancy(l1, l3)
lm.addDependancy(l2, l4)
lm.addDependancy(l2, l3)

puts "Generador de objetos:"
puts l1
puts lm
puts "--------------"
lm.each_dependency(l1){|e| puts e}
puts "--------------"
lm.each_deep_dependency(l1){|e| puts e}

