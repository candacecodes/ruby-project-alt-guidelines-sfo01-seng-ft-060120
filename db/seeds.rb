#need examples for customer, farmers, order 
#customer: name, location 
customer1 = Customer.create(name: "Candace", location: "SF")
customer2 = Customer.create(name: "Daniel", location: "Seattle")
customer3 = Customer.create(name: "Gabriel", location: "Seattle")
customer4 = Customer.create(name: "Akiko", location: "SF")
customer5 = Customer.create(name: "Brandon", location: "Seattle")
customer6 = Customer.create(name: "Zana", location: "Seattle")
#farmer: name, location 
farmer1 = Farmer.create(name: "Farmer1", location: "SF")
farmer2 = Farmer.create(name: "Farmer2", location: "SF")
farmer3 = Farmer.create(name: "Farmer3", location: "Seattle")
farmer4 = Farmer.create(name: "Farmer4", location: "Seattle")

# order: farmer_id, customer_id, size (single, couple, individual)
order1 = Order.create(customer: customer1, farmer: farmer1, size: "small")
order2 = Order.create(customer: customer2, farmer: farmer3, size: "medium")
order3 = Order.create(customer: customer3, farmer: farmer4, size: "large")
order4 = Order.create(customer: customer4, farmer: farmer2, size: "small")
order5 = Order.create(customer: customer5, farmer: farmer4, size: "medium")
order6 = Order.create(customer: customer6, farmer: farmer3, size: "large")
#question: within the parameters, where / how do we get the farmer_id and customer_id? 

# once we do rake.db seeds, it'll create tables and 
#     we are guessing that the customer_id will align with the primary key of customer table 
#     same with farmer_id