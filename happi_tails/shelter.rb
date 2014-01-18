require 'pry'



class Shelter
attr_accessor :s_name, :address, :clients, :animals
	
	def initialize(s_name, address, clients = [], animals = [])
		@s_name = s_name
		@address = address
		@clients = clients
		@animals = animals
	end
	
	def client_list
		list = @clients.inject("") do |client_list_string, client|
			 client_list_string << "Name: #{client.c_name}, Age: #{client.c_age}, Children: #{client.child_num}, Pets: #{client.pet_num}\n"
			end
		list || ""
	end

	def animal_list
		list = @animals.inject("") do |animal_list_string, animal|
			 animal_list_string << "Name: #{animal.a_name}, Age: #{animal.a_age}, Gender: #{animal.gender}, Species: #{animal.species}, Toys: #{animal.toys.join(", ")}\n"
			end
		list || ""
	end

	def animal_available(choice)
		 available = []
		 @animals.select do |animal|
			if animal.a_name == choice
				available << animal
				# binding.pry
			end
		end
		available

	end
	
	def adopt(choice)
		@animals -= available
	end

end


