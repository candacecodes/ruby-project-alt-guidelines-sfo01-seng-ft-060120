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
        puts 'Welcome to Farm to Table, meet your perfect farmer!' 
    end 

    def create_name 
        #username stuff
        username = ""
        while username == "" 
            puts 'Hi, please enter your name:'
            username = gets.chomp
        end
 
        #location stuff
        location = ""
        while location == "" 
            puts 'please enter your location from the following:'
            location = gets.chomp
        end 

        @customer = Customer.create(name: username, location: location) 
    end

    def choose_farmer #<view_previous_order> can return here
        selected_farmers = Farmer.all.select {|farmer| farmer.location == @customer.location}
        selected_farmers.each {|farmers| puts farmers.name} 

        farmer = ""
        while farmer == "" 
            puts 'Please choose a farmer'
            farmer = gets.chomp 
        end

        puts "Thanks, you have chosen #{farmer}."

        @farmer = Farmer.find_by(name: farmer) 


        #'Want to order produce directly from your local farmer? We can help you with that!'
        # puts 'Put in farmer (choice'
        #what could we put here to allow a user to type a response? 
        #method that selects the farmer from list 
        #customer_id and farmer_id are linked/joined
    end 


    # As a user, I want to be able to make an order from a farmer. (Create)
    # def make_order 
    #     response = "" 
    #         while response == ""
    #             puts 'Want to make an order? Put in Y for yes and N for no'
    #             response = gets.chomp 
    #             if response = "Y" 
    #                 size = select_size 
    #                 Order.create(customer: @customer, farmer: @farmer, size: size)
    #             elsif response = "N"
    #                 puts 'Exit' #need to bring back to main menu 
    #             else 
    #                 puts 'That is not a valid input. Please put in Y or N.'
    #             end 
    #     #answer y or n 
    #         #if no => end 
    #         #if yes => <select_size>
    #     #join customer and farmer together to create an order instance 
    # end
    
    def select_size #also used in <make_order>
        puts 'Please select a size (small, medium, large)'
        #method selects size 
        #joins order(:size) with customer 
    end 

    # # As a user, I want to pick a farm and view previous orders. (Read)
    def view_previous_orders
        puts 'Do you want to view your previous order?' #'Want to view previous orders?' 
        #answer y or n 
            #if no => take back to <choose_farmer> method 
            #if yes => method selects orders that match with customer_id 

            #can do another method that specifies the orders with farmer too 
            #method in SQL that SELECT * FROM orders WHERE customer_id == ? and farmer_id == ?
    end 

    # # As a user, I should be able to edit my shopping list size. (Update)
    # def edit_order 
    #     puts 
    #     response = "" 
    #     while response == ""
    #         puts 'Want to change your order size? Put in Y for yes and N for no'
    #         response = gets.chomp 
    #         if response = "Y" 
    #             size = select_size 
    #             #Order.update(customer: @customer, farmer: @farmer, size: size)??
    #         elsif response = "N"
    #             puts 'Exit' #need to bring back to main menu 
    #         else 
    #             puts 'That is not a valid input. Please put in Y or N.'
    #         end 
    # end 

    # As a user, I want to be able to delete my basket. (Delete)
    def clear_basket
        puts 'Want to clear your order?'
        puts 'Select y or n'
        #method to delete the order 
        #if no => continue 
        #if yes => delete order 
    end 

end 