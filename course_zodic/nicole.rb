require 'pry'
def mc
  type=['Big Mac', 'FrenchFries', 'Omelette']
  meal= {} #hash
  meal['Big_Mac']= 70
  meal['FrenchFries']= 35
  meal['Omelette']= 250
  total_money = 0
  meal.each do | key, value|
    p "#{key} : #{value}"
    total_money += value
  end
  return total_money
end
puts mc