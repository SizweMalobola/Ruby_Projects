
def ceasar_cipher(string,shift)
    arr = string.unpack('U*')
    nu_arr = arr.map do |char_code|
        if char_code >= 65 && char_code <= 90 #uppercase
            char_code += shift 
            char_code > 90? char_code = (char_code - 90) + 64 : char_code
        elsif char_code >= 97 && char_code <= 122 #lowercase
            char_code += shift
            char_code > 122? char_code = (char_code - 122) + 96 : char_code
        else
            char_code
        end
    end
    encrpted_string = nu_arr.pack('U*')
    return p encrpted_string
end
puts "Enter string you wish to encrypt 007 :"
input_string = gets.chomp
puts "Enter you key(single-digit) for encyption :"
input_shift = gets.chomp.to_i
ceasar_cipher(input_string,input_shift)