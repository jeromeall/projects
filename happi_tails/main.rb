require './animal'
require './client'
require './shelter'
require 'pry'

shelter = Shelter.new("Pets\"R\"Us", "555 FetchBone St.")


def menu message
  puts `clear`
  puts "*** Shell-Ter v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Display all Animals'
  puts '2 : Display all Clients'
  puts '3 : Create an Animal'
  puts '4 : Create a Client'
  puts '5 : Facilitate Client adopts Animal'
  puts '6 : Facilitate Client puts Animal up for adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end


message = ""
choice = menu message
while choice != 'q'
	case choice
	when "1"
	message = "Animal list:\n"
	message += shelter.animal_list()	
    when "2"
    message = "Client list:\n"
    message += shelter.client_list()
	when "3"
		puts "Enter animal info:"   # a_name, a_age, gender, species, toys
		print "name: "; a_name = gets.chomp
		while a_name == ""
			puts "Please enter a valid name: "
			a_name = gets.chomp
		end

		print "age: "; a_age = gets.chomp
		# figure out how to check for valid age

		print "gender: "; gender = gets.chomp
		# figure out how to check for valid gender

		print "species:"; species = gets.chomp
		# figure out how to check for valid species

		print "toys (separate with a comma if multiple toys) : "; toys = gets.chomp.split(", ")
		
		shelter.animals << Animal.new(a_name, a_age, gender, species, toys)
		message = "Animal added."

	when "4"
		puts "Enter client info:"
		print "name: "; c_name = gets.chomp
		while c_name == ""
			puts "Please enter a valid name: "
			c_name = gets.chomp
		end

		print "age: "; c_age = gets.chomp
		# figure out how to get a valid age

		print "number of children :"; child_num = gets.chomp
		# figure out how to get a valid age

		print "number of pets: " ; pet_num = gets.chomp
		while pet_num == ""
			print "Enter valid number: "
			pet_num = gets.chomp
		end
		
		shelter.clients << Client.new(c_name, c_age, child_num, pet_num.to_i)
		message = "Client added."
	when "5"
		puts "Which client would like to adopt a pet?"
		client_choice_name = gets.chomp
		while client_choice_name == ""
			puts "Please enter a valid name: "
			client_choice_name = gets.chomp
		end
		
		client_choice_object = shelter.clients.select{|client| client.c_name == client_choice_name}.first
		
		if shelter.clients.include?(client_choice_object)
			puts "Which animal would he like to adopt? (enter name): "
			animal_choice_name = gets.chomp
			animal_choice_object = (shelter.animals.select{|animal| animal.a_name == animal_choice_name}).first

			if shelter.animals.include?(animal_choice_object)
				shelter.animals.delete(animal_choice_object)
				client_choice_object.pet_num +=1
				message = "Congrats! You adopted #{animal_choice_name}"
			else
				message = "We don't have that pet."
			end
		else
			message = "That client doesn't exist."
		end
	when "6"
		print "Sad to hear that :(\n"
		print "name: "; a_name = gets.chomp
		print "age: "; a_age = gets.chomp
		print "gender: "; gender = gets.chomp
		print "species:"; species = gets.chomp
		print "toys (separate with a comma if multiple toys) : "; toys = gets.chomp.split(", ")
		
		shelter.animals << Animal.new(a_name, a_age, gender, species, toys)
		message = "We'll take good care of him!"
	end

	choice = menu message
end









