# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class LibraryManager
  #Constructor
  def initialize
    @librerias = []
    @dependencias = Hash.new()
  end
  
  #Añade las librerias al gesto
  def addlibrary (lib)
    if !@librerias.include?(lib) && !existe_lib?(lib)#Comprobamos que ese obj no esta ya añadido
      @librerias.push(lib)
    end
  end
  
  #Añade las dependencias entre librerias
  def addDependancy(lib1,lib2)
    #Comprobamos que ambas librerias fueron añadidas y que son distintas
    if @librerias.include?(lib1) && @librerias.include?(lib2) && lib1!=lib2
      #Si tiene ya alguna dependencia se le añade y si no se crea
      if @dependencias.key?(lib1.name)
        if !@dependencias[lib1.name].include?(lib2)
          @dependencias[lib1.name].push(lib2)
        end
      else
        @dependencias[lib1.name]=[lib2]
      end
    else
      puts "ERROR: Alguna de las librerias no se encuentra en el sistema"
    end  
  end
  
  #Busqueda de dependencias
  def each_dependency(lib)
    if (depen=@dependencias[lib.name])!=nil
      depen.each { |elem|
        yield elem
      }
    end
  end
  
  #Busqueda en profundidad de dependencias
  def each_deep_dependency(lib)
    #Comprobamos que puede cargar dependencias en caso de que tenga
    if (lista=@dependencias[lib.name])!=nil 
      lista.each { |elem|
        yield elem #Devolvemos el obj
        if (aux=@dependencias[elem.name])!=nil
          aux.each { |dep|
            #Comprobamos que dep es distinto a la libreria original y que no hayamos o vayamos a pasar
            if !lista.include?(dep) && dep!=lib
              lista.push(dep)
            end
          }
        end
      }
    else
      yield "No tiene dependencias"
    end
  end
  
  def sizes()
    @librerias.collect { |elem| elem.size  }    
  end
  
  def versions()
    aux=Hash.new()
    @librerias.each { |elem|  
      aux[elem.name]=elem.version
    }
    return aux
  end
  
  def existe_lib?(lib)
    @librerias.find_index { |elem| elem.name.downcase==lib.name.downcase  } !=nil
  end
  
  def to_s
    "Librerias: #{@librerias}\n"+"Versiones: #{@versiones}\n"+"Dependencias: #{@dependencias}"
  end
end
