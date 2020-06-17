class CLI

    def start_method
        greeting 
        create_name # customer2
        # print all farmers in area 
        # have user select a farmer -> farmer3
        # create an order for that customer and the farmer (Order.create(customer: customer2, farmer: farmer3))
        # it might be better to do @customer instead of customer because we might want to use it again 
        # if we want to keep track of the customer until the end of the order 
        # @ allows us to have access to customer throughout the methods 
    end 

    #local variables: my_var (scope: just one method)
    #instance variables: @my_var (scope: throughout the instance - in other instance methods)
    #class variables: @@my_var (scope: throughout the class)

    def greeting
        puts 'Welcome to Farm to Table! your connection to locally sourced, organically grown and sustainable
        produce options. Shipped to your door!' 
    end 

    def create_name 
        #username stuff
        username = ""
        while username == "" 
            puts 'Hi, please enter your name:'
            username = gets.chomp
            puts "Hi #{username}, thanks for joining."
        end
 
        #location stuff
        location = ""
        while location == "" 
            puts 'Please enter your location from the following: SF or Seattle'
            location = gets.chomp
            puts "Thanks, your location is set to #{location} let's continue."
        end 

        @customer = Customer.create(name: username, location: location) 
    end

    def choose_farmer #<view_previous_order> can return here
        selected_farmers = Farmer.all.select {|farmer| farmer.location.upcase == @customer.location.upcase}
        
       puts selected_farmers.map {|farmers| farmers.name}.uniq 

        farmer = ""
        while farmer == "" 
            puts 'Please choose a farmer from the list:'
            farmer = gets.chomp 
        end

        puts "Thanks. You have chosen #{farmer}."

        @farmer = Farmer.find_by(name: farmer) 


        #'Want to order produce directly from your local farmer? We can help you with that!'
        # puts 'Put in farmer (choice'
        #what could we put here to allow a user to type a response? 
        #method that selects the farmer from list 
        #customer_id and farmer_id are linked/joined
    end 


    
# select_size #Create
    #     order_size = "" 
    #     while order_size == "" #!= "small" "medium" "large"
    #         puts 'Please select an order size from the following for your produce order: small, medium, large'
    #         order_size = gets.chomp 
    #         #if order_size != small, medium, or large 
    #         #puts 'Please re-enter from the following options: small, medium, large'
    #     end
    #     puts "Thanks, you have selected #{order_size} for your order size and your order number is order_id."
    #     #joins order(:size) with customer 
    # end 

    def select_size #Create 
        order_size = "" 
        puts 'Please select an order size from the following for your produce order: small, medium, large'
        order_size = gets.chomp
        if order_size == "small" || order_size == "medium" || order_size == "large" 
            puts "Thanks, you have selected #{order_size} for your order size."

        else order_size != "small" || order_size != "medium" || order_size != "large" 
            puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
            order_size = gets.chomp
            puts "Thanks, you have selected #{order_size} for your order size."
        end
       binding.pry
        
        @order = Order.create(customer: @customer, farmer: @farmer, size: order_size)
    
            # puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
            # order_size = gets.chomp 
            # while order_size != "small" || order_size != "medium" || order_size != "large" 
            #     puts "Thanks, you have selected #{order_size} for your order size."
            #       @order = Order.create(customer: @customer, farmer: @farmer, size: order_size)
            #     puts "Please put in a valid option of 'small,' 'medium,' or 'large'
    end 



        # while order_size != ""
        #     # if order_size !="small, medium, large"
        #     order_size = gets.chomp 
        #     if order_size == "small" || order_size == "medium" || order_size == "large"
        #         puts "Thanks, you have selected #{order_size} for your order size."
        #     elseif 
        #         puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
        #     # if order_size != "small" || order_size != "medium" || order_size != "large"
        #     #     puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
        #     else
        #         puts "Thanks, you have selected #{order_size} for your order size."
        #     # #     puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
        #     # else order_size != "large"
        #     #     puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
        #     # puts 'Please re-enter from the following options: small, medium, large'
        #     end 
        # end
        
        #Create order.create(parameters) 
    #     @order = Order.create(customer: @customer, farmer: @farmer, size: order_size)
    # end 

    #create <exit> method to return user if they choose no from <create_order>
    def exit 
        puts 'Thank you for your time.'
    end 

    #   As a user, I want to be able to make an order from a farmer. (Create)
    def create_order #call only if order size is correct
        response = "" 
            while response == ""
                puts 'Want to make an order? Put in Y for yes and N for no'
                response = gets.chomp 
                if response == "Y" || response == 'y'
                    size = select_size 
                    # Order.create(customer: @customer, farmer: @farmer, size: size)
                elsif response == "N" || response =="n"
                    exit  #method call for start_method 
                else 
                    puts 'That is not a valid input. Please put in Y or N.'
                end 
        #answer y or n 
            #if no => end 
            #if yes => <select_size>
        #join customer and farmer together to create an order instance 
            end 
    end

#     # As a user, I want to be able to confirm an order from a farmer. (Create)
#     def confirm_order (order_number)
#         matching_order = Order.all.find {|order| order.number == order_number}
#         order_details = matching_order.each {|order| puts order.customer, order.farmer, order.size}
#         puts "Here are the details of your confirmed order. #{order_details}""
#     end 
        
#     # end

#     # # As a user, I want to pick a farm and view previous orders. (Read)
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

#     # # As a user, I should be able to edit my shopping list size. (Update)
#     # def edit_order(order_id)
#         orderid = ""
#         puts 'Please enter your order_id' 
#         orderid = gets.chomp 
#         Order.all.find {|order| order_id == orderid}
#         <order_size>
#     # end 

#     # As a user, I want to be able to delete my basket. (Delete)
#     # def clear_basket
#     #     puts 'Want to clear your order? Select Y for yes and N for no'
#     # end 

  # def repeat_customer
    #     puts 'To start enter user name:'
    #     input = gets.chomp
    #     @user_name = Customer.find_by(name: input)
    #         if @user_name 
    #         #puts looks like you've already set up an account! continue w/ previous order? y or n?
    #         #seepreviousorder?
    #         else
    #         @user_name = Customer.create(name: input) #maybe jump to create_name?
    #         #addlocation later?        
    #     end
    #     binding.pry
    # end

end 