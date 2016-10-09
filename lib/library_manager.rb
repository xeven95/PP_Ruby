# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class LibraryManager
  #Constructor
  def initialize
    @librerias = []
    @sizes=[]
    @versiones=Hash.new()
    #@dependencias = Hash.new()
  end
  
  #Añade las librerias al gesto
  def addlibrary (lib)
    @librerias.push(lib)
    @sizes.push(lib.size)
    @versiones[lib.name]=lib.version
  end
  
  def addDependancy(lib1,lib2)
    if @librerias.include?(lib1) && @librerias.include?(lib2) && lib1!=lib2
      if lib1.dependencias.include?(lib2)
        puts "Ya depende de esta libreria"
      else
        lib1.dependencias.push(lib2)
      end
      #if @dependencias.key?(lib1.name)
       # @dependencias[lib1.name].push(lib2)
      #else
       # @dependencias[lib1.name]=[lib2]
      #end
    else
      puts "ERROR: Alguna dde las librerias no se encuentra en el sistema"
    end  
  end
    
  def to_s
    "Librerias: #{@librerias}\n"+"Versiones: #{@versiones}\n"+"Dependencias: #{@dependencias}"
  end
end
