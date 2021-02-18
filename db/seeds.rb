require 'net/http'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
uri = URI(url)
response = Net::HTTP.get(uri)
drinks_object = JSON.parse(response)
arr_drink = drinks_object['drinks']
arr_drink.each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
