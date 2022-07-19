 
@cart 
@item = [{item: "milk", price: 1.00, quantity: 3},
{item: "bread", price: 2.00, quantity: 4},
{item: "cheese", price: 2.00, quantity: 5},
{item: "eggs", price: 3.00, quantity: 2}]

def welcome
puts "Welcome to my grocery list!"
puts "---------------------------"
main_menu
end

welcome

# main menu method
def main_menu 
puts "1) Add Item to inventory"
puts "2) Add Item to cart"
puts "3) View All Store Items"
puts "4) Remove an Item from cart"
puts "5) Show total cost in cart"
puts "6) Exit"
puts "What is it you want to do?"
user_choice = gets.strip.to_i

# condition of what the user chooses for the menu
if user_choice == 1  
  puts 'Add item to inventory'
  main_menu # go back to main menu
elsif user_choice == 2
  puts 'Add item to cart'
elsif user_choice == 3
  puts 'View all store items'
  main_menu # go back to main menu
elsif  user_choice == 4
  puts 'Remove an item'
  main_menu # go back to main menu
elsif user_choice == 5
  puts 'Show Cost'
  main_menu #go back to main menu
elsif user_choice == 6
  puts "Good Bye"
  exit # exit the program
else
  # error handling for what they have not choose 1, 2 or 3
  puts "Error have to choose 1, 2, 3, 4, 5 or 6"
  main_menu
end


# method to add inventory
def add_item_inventory
# outputs of grabbing the users info
puts "Adding Item to Inventory"
puts "What is item name?"
item = gets.strip 
puts "How much does the item cost?"
price = gets.strip 
puts "How many do you want to add to inventory?"
quantity = gets.strip  


# add item to store inventory
new_item = { 
  item: item, 
  price: price,
  quantity: quantity,
}
add_item_inventory
# add new item to the array
@store_items << new_item
end


# method to view all store items
def view_all_items
puts 'View All Store Items'
# iterate through the array and display in a readable format
@store_items.each do |item_info|
  puts "Item: #{item_info[:item]}"
  puts "Price: #{item_info[:price]}"
  puts "Quantity: #{item_info[:quantity]}"
  puts 
  puts "---------"
end
view_all_items
# method to add item to cart
def add_item_cart
  @cart = Cart.find(session[:cart_id])
rescue ActiveRecord do RecordNOTFound
  @cart = Cart.create
  session[:cart_id] = @cart.id
end
add_item_cart
# method to remove item from cart
def remove_item
  cart = session[cart]
  item = cart[items].find { |item| item['product_id'] == params[id]}
  if itemcart[items].delete item
  end
  remove_item
# method to show items in the cart
def show_items_cart
  @cart = cart.length
end
show_items_cart
# method to remove all items from cart
def remove_all
  items.destroy_all
  #clear => destroy_all
end
remove_all
# method to show total cost in cart
def show_cart_total_cost
  @cart = cart.inject(0) { |sum, item| sum + item.price }
end
show_cart_total_cost
# method to apply 20% off using discount code
def PRODUCT_DISCOUNTS_BY_DISCOUNT_CODE = [
  {
    discount_code_match_type: :exact,
    discount_code: ["DISCOUNT20"],
    discount_type: :percent,
    discount_amount: 20,
    discount_message: '20% off tagged products!'
  }
]

  def initialize(match_type, discount_code)
    @comparator = match_type == :exact ? '==' : 'include?'
    @discount_code = discount_codes.map { |discount_code| discount_code.upcase.strip }
  end

  def match?(discount_code)
    @discount_code.any? { |code| discount_code.code.upcase.send(@comparator, code) }
  end
  def initialize(discount_type, discount_amount, discount_message)
    @discount_type = discount_type
    @discount_message = discount_message

    @discount_amount = if discount_type == :percent
      20 - (discount_amount * 0.20)
    else
      Money.new(cents: 100) * discount_amount
    end
  def apply(line_item)
    new_line_price = if @discount_type == :percent
      line_item.line_price * @discount_amount
    else
      [line_item.line_price - (@discount_amount * line_item.quantity), Money.zero].max

    line_item.change_line_price(new_line_price, message: @discount_message)
  end
