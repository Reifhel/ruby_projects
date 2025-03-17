require 'csv'
require 'date'
require 'erb'
require 'google/apis/civicinfo_v2'
require 'time'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_number(phone)
  clean_phone = phone.gsub(/[^\d]/, "")
  if clean_phone.length == 10
    clean_phone
  elsif clean_phone.length == 11 and clean_phone[0] == "1"
    clean_phone[1..10]
  else
    "Bad number!"
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = File.read('secret.key').strip

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def get_max_frequency(hash)
  hash.max_by{|k,v| v}
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

hours_counter = Hash.new()
week_days_counter = Hash.new()

week_day_name = {0=>"sunday",1=>"monday",2=>"tuesday",3=>"wednesday",4=>"thursday",5=>"friday",6=>"saturday"}

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  cellphone = clean_phone_number(row[:homephone])
  reg_date = DateTime.strptime(row[:regdate],"%m/%d/%y %H:%M")

  if hours_counter.key?(reg_date.hour)
    hours_counter[reg_date.hour] += 1
  else
    hours_counter[reg_date.hour] = 1
  end

  if week_days_counter.key?(week_day_name[reg_date.wday])
    week_days_counter[week_day_name[reg_date.wday]] += 1
  else
    week_days_counter[week_day_name[reg_date.wday]] = 1
  end

  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id,form_letter)

end

most_active_hour = get_max_frequency(hours_counter)
most_active_day = get_max_frequency(week_days_counter)
p "The hour with most registration is #{most_active_hour[0]}:00 with #{most_active_hour[1]}" 
p "The day of the week with most registration is #{most_active_day[0]} with #{most_active_day[1]}"
