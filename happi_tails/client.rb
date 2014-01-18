
class Client
attr_accessor :c_name, :c_age, :child_num, :pet_num

	def initialize(c_name, c_age, child_num, pet_num)
		@c_name = c_name
		@c_age = c_age
		@child_num = child_num
		@pet_num = pet_num
	end

	def client_info
		info = "#{@c_name}, #{@c_age}, #{@child_num}, #{@pet_num}"
	end
	
end
