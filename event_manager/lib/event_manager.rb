

# contents = File.read "../event_attendees.csv"
# puts contents
require "csv" 
require "google/apis/civicinfo_v2"
require "erb"

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
        address: zip,
        levels: "country",
        roles: ["legislatorUpperBody","legislatorLowerBody"]).officials
  rescue 
  "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end  
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,"w") do |file|
    file.puts form_letter
  end
end

puts "EventManager Initialized!"

file = CSV.open "../event_attendees.csv", headers: true ,header_converters: :symbol

template_letter = File.open("../form_letter.erb", "r") {|template| template.read}
erb_template = ERB.new template_letter

file.each do |column|
     id = column[0]

     name = column[:first_name]

     zipcode = clean_zipcode(column[:zipcode])

     legislators = legislators_by_zipcode(zipcode)

     form_letter = erb_template.result(binding)

     save_thank_you_letter(id,form_letter)
end



