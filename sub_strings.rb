
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

  def substring(input_string,dictionary)
     nu_hash = Hash.new(0)
     nu_array = input_string.downcase.split(" ")
     nu_array.each do |i|
         dictionary.each do |x|
             if i.include? x
                nu_hash[x] +=1
              end
          end
       end 
      p nu_hash
  end

#substring("Howdy partner, sit down! How's it going?",dictionary)
puts "Enter a string :"
user_input = gets.chomp
substring(user_input,dictionary)