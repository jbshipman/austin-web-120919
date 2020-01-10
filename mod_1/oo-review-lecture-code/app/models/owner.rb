class Owner

  attr_reader :pets

  def initialize
    @pets = []
  end

  def add_pet(pet_obj)
    @pets << pet_obj
  end
  
end

fido = Dog.new
fido.name = "Fido"

edwin = Owner.new

edwin.add_pet(fido)
