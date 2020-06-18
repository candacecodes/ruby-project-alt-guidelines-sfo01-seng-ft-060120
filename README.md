# Mod 1 Project Outline

## Repo Link
- <Attach github link here>
create our own repo + clone on github 
+ fork? 

## Project Idea/Misson
- Customizable produce order service | Customer and farmer groups. 

## Domain
| Model            | Join             | Model 2      | Model 3          |
| Customer         | Order            | Produce      | Farmer           | 
| name: string     | name: string     | name: string | name: string     |
| loc: string      | farmer_id: int   | price: float | loc: string      |
|                  | customer_id: int | type: string |                  |

## User Story ( At least 4)
1. As a user, I want to see my list of farmers to select my preferred farmer (Read & Create)
2. As a user, I want to be able to make an order with a specified produce amount for my selected farmer (Create)
3. As a user, I want to edit my shopping list size. (Update)
4. As a user, I want to be able to delete my basket. (Delete)
When randomizing fruits and veggies, it can be part of a dev size as a method in the class.
Customer doesn't see this when interacting with the application. 
Ex. create a method in a class called fruit_randomizer, which selects random produce from your produce class. 
Can use online resources that provides hashes of data for us to test out MVP. 

Stretch Goals
TTY Main Menu 
- Create an order => 

    def start_method
        prompt = TTY::Prompt.new
        prompt.select("What would you like to do?", cycle: true, echo: false) do |menu|
            menu.choice "create username", -> {create_name}
            menu.choice "choose farmer", -> {choose_farmer}
            menu.choice "make a order", -> {create_order}
            menu.choice "edit order", -> {edit_order}
            menu.choice "delete order", -> {delete_order}
            menu.choice "exit farm to table" do exit! end
        end
    end 







- As a user, I want to be able to confirm an order from a farmer. (Read)
#     def confirm_order (order_number)
#         matching_order = Order.all.find {|order| order.number == order_number}
#         order_details = matching_order.each {|order| puts order.customer, order.farmer, order.size}
#         puts "Here are the details of your confirmed order. #{order_details}""
#     end 
        
#     # end

- As a user, I want to pick a farm and view previous orders. (Read)
#     # def view_previous_order
#         def find_customer(name)
#             Puts 'Please enter your name.'
#             Customer.all.select{|customer| customer.name == name} 
#             find corresponding order numbers from customer name search 
#         end 
#         def find_previous_orders(orderid)
#             use order numbers to pull up farmer and size details (name can be excluded)
#         end 
#     # end 