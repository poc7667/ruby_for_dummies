require 'pry'

def show_bill(names, prices)
  total =  0
  binding.pry
  names.zip(prices).each do |name, price|
    p "#{name}:$#{price}"
    total += price.to_i
  end
  p "------------"
  p "Total: $#{total}"
end
names =[] #Array
prices = []
while true
  print 'Product name: '
  names << gets.chomp!
  print 'Product price: '
  prices << gets.chomp!
  if names.include? 'q' or prices.include? 'q'

    show_bill(names[0..-2], prices[0..-2])
    break
  end
end