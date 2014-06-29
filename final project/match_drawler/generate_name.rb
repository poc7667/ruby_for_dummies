require 'pry'
require 'faker'
f=open('attendess.txt','w')
(1..80).each do |i|
   f.write("#{Faker::Name.name},#{%w(male female)[i%2]}\n")
end 



