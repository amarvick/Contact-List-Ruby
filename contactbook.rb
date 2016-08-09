#Goal: Familiarize and strengthen understanding of hashes

quit = false

contact_book = {
"Alex Marvick" => "(999) 999.9999",
"Michael Marvick" => "(888) 888.8888",
"Marguerite Shea" => "(777) 777.7777",
"Mike Marvick" => "(666) 666.6666",
"Nick Blackbourn" => "(555) 555.5555",
"Matt Rouse" => "(444) 444.4444",
"Freddy Paulenich" => "(333) 333.3333",
}

until(quit)
	puts "What would you like to do?"
	puts "1. Search Full Name"
	puts "2. Search Phone Number"
	puts "3. Print All Contacts"
	puts "4. Add Contact"
	puts "5. Delete Contact"
	puts "6. Quit"
	print "Choose: "
	response = gets.to_i
	puts "\n"

	if response == 1
		print "Search Name: "
		name_search = gets.chomp
		puts "\n"

		# contact_book.each { |name, number| puts "The name entered corresponds to the following phone number: #{number}\n" if name.upcase == name_search.upcase }

		matched_names = contact_book.select { |name, number| name.upcase == name_search.upcase }
		if matched_names.any?
		   puts "FOUND: #{matched_names.first.last}\n"

		else
		   puts "The name entered has no matches."
		
		end 

	elsif response == 2
		print "Search Number (FORMAT: (###) ###.####): "
		number_search = gets.chomp
		puts "\n"
		
		matched_numbers = contact_book.select { |name, number| number == number_search }
		if matched_numbers.any?
			puts "FOUND: #{matched_numbers.first}\n"

		else
			puts "The number entered has no matches."

		end

	elsif response == 3
		contact_book.each { |name, number| puts "#{name}'s phone number is #{number}\n" }

	elsif response == 4
		print "Name: "
		name_entry = gets.chomp

		print "Number (Please use correct format ((###) ###.####)... though, it's not enforced right now): "
		number_entry = gets.chomp

		matched_names = contact_book.select { |name, number| name.upcase == name_entry.upcase }
		matched_numbers = contact_book.select { |name, number| number == number_entry }

		if matched_names.any?
			puts "Name is already in file!"

		elsif matched_numbers.any?
			puts "Number is already in file!"

		else
			contact_book[name_entry] = number_entry
			puts "New Contact List updated:"
			contact_book.each { |name, number| puts "#{name}'s phone number is #{number}\n" }

		end

	elsif response == 5
		print "Name of Contact to delete: "
		name_delete = gets.chomp

		matched_names = contact_book.select { |name, number| name.upcase == name_delete.upcase }
		if matched_names.any?
			contact_book.delete(name_delete)
			puts "#{matched_names} successfully deleted.\n"
			
			contact_book.each { |name, number| puts "#{name}'s phone number is #{number}\n" }

		else
			puts "Contact not found."

		end

	elsif response == 6
		puts "Farewell!\n"
		quit = true

	else
		puts "Please put in a number from the list.\n"

	end

end
