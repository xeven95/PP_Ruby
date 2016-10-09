# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Library
  #Constructor
  def initialize (name, version, size)
    @name,@version= name,version
    @size=size
    @dependencias=[]
  end
  
  def to_s
    "#{@name}, #{@version}, #{@size}"
  end
  
  attr_reader :name,:version,:size
  attr_accessor :dependencias
end
