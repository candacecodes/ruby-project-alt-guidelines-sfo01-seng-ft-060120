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
4. As a user, I want to edit my shopping list size. (Update)
5. As a user, I want to be able to delete my basket. (Delete)
When randomizing fruits and veggies, it can be part of a dev size as a method in the class.
Customer doesn't see this when interacting with the application. 
Ex. create a method in a class called fruit_randomizer, which selects random produce from your produce class. 
Can use online resources that provides hashes of data for us to test out MVP. 

## Stretch Goals
- We can create a new class dedicated to previous orders. Requires a new class, ex. PreviousOrders, which belongs_to :customer through :order, belongs_to :farmer through :order. One previous order has one customer and one farmer. Customers and farmers have many previous orders. 