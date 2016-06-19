require 'Date'
def to_zodiac(bday)
  zodiac_signs = ['Aquarius', #January 21 - February 19

                  'Pisces', # February 20 - March 20

                  'Aries', # March 21 - April 20

                  'Taurus', # April 21 - May 21

                  'Gemini', # May 22 - June 21

                  'Cancer', # June 22 - July 22

                  'Leo', # July 23 -August 21

                  'Virgo', # August 22 - September 23

                  'Libra', # September 24 - October 23

                  'Scorpio', # October 24 - November 22

                  'Sagittarius', # November 23 - December 22

                  'Capricorn'] # December 23 - January 20

  zodiac_descriptions = {}
  zodiac_descriptions['Aquarius'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Pisces'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Aries'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Taurus'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Gemini'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Cancer'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Leo'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Virgo'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Libra'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Scorpio'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Sagittarius'] = ['Witty', 'Clever', 'Humanitarian']
  zodiac_descriptions['Capricorn'] = ['Witty', 'Clever', 'Humanitarian']

  sign = case bday.month
         when 1  then (bday.day >= 21)? 'Aquarius' : 'Capricorn'
         when 2  then (bday.day >= 20)? 'Pisces' : 'Aquarius'
         when 3  then (bday.day >= 21)? 'Aries' : 'Pisces'
         when 4  then (bday.day >= 21)? 'Taurus' : 'Aries'
         when 5  then (bday.day >= 22)? 'Gemini' : 'Taurus'
         when 6  then (bday.day >= 22)? 'Cancer' : 'Gemini'
         when 7  then (bday.day >= 23)? 'Leo' : 'Cancer'
         when 8  then (bday.day >= 22)? 'Virgo' : 'Leo'
         when 9  then (bday.day >= 24)? 'Libra' : 'Virgo'
         when 10 then (bday.day >= 24)? 'Scorpio' : 'Libra'
         when 11 then (bday.day >= 23)? 'Sagittarius' : 'Scorpio'
         when 12 then (bday.day >= 23)? 'Capricorn' : 'Sagittarius'
         end
  descriptions = zodiac_descriptions[sign]
  [sign, descriptions]
end
class People
  attr_accessor :name, :birthday
end
mary = People.new
mary.name = 'Jack'
binding.pry
print "How many people will play this game? "
num_of_people = gets.chomp.to_i

(1..num_of_people).each do |index|
  print "What's your name?"
  user_name = gets.chomp!
  print 'What day is your birthday? '
  bday = gets.chomp!
  bday = Date.parse(bday)
  sign, descriptions = to_zodiac bday
  puts "Hi #{user_name}, You're #{sign} "
  puts "So, you're #{descriptions.join(', ')}"
end