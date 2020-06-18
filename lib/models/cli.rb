class CLI

    def start_method
        greeting 
        create_name # customer2
    end 

    def greeting
        puts "Welcome to Farm to Table! Your connection to locally sourced, organically grown and sustainable
        produce options. Shipped to your door!"
        sleep 3 
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

      puts """           .:'
      __ :'__
  .'`__`-'__``.
  :__________.-'
  :_________:
  :_________`-;
   `.__.-.__.' """
    
    
    end 

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

    end 




    def create_order #called in order_size to create an order instance variable. 
        response = "" 
            while response == ""
                puts 'Want to make an order? Put in Y for yes and N for no'
                response = gets.chomp 
                if response == "Y" || response == 'y'
                    size = select_size 
                    Order.create(customer: @customer, farmer: @farmer, size: size)
                elsif response == "N" || response =="n"
                    exit  #method call for start_method 
                else 
                    puts 'That is not a valid input. Please put in Y or N.'
                end 
            end 
    end


    #As a user, I want to be able to make an order from a farmer. (Create)
    #select_size method also holds create order function 
    def select_size #Create 
        order_size = "" 
        puts 'Please select an order size from the following for your produce order: small (1-2 person), medium (3-4 person), large (5 people)'
        order_size = gets.chomp
        if order_size == "small" || order_size == "medium" || order_size == "large" 
            puts "Thanks, you have selected #{order_size} for your order size and your order id is #{order.id} We'll send details shortly."

        else order_size != "small" || order_size != "medium" || order_size != "large" 
            puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
            order_size = gets.chomp
            puts "Thanks, you have selected #{order_size} for your order size and your order id is #{order.id} We'll send details shortly."
        end
        @order = Order.create(customer: @customer, farmer: @farmer, size: order_size)
    
    end 

    def edit_size #Update 
        order_size = "" 
        puts 'Please select an order size from the following for your produce order: small, medium, large'
        order_size = gets.chomp
        if order_size == "small" || order_size == "medium" || order_size == "large" 
            @order = Order.update(@order.id, :size => order_size)
            puts "Thanks, you have updated your order size to #{order_size} and your order id is #{@order.id}. We'll send details shortly."
            edit_delete_or_exit

        else order_size != "small" || order_size != "medium" || order_size != "large" 
            puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
            order_size = gets.chomp
            # @order = Order.update(size: order.size)
            # puts "Thanks, you have updated your order size to #{order_size} and your order id is #{@order.id}. We'll send details shortly."
            # edit_delete_or_exit
        end
    
    end 

    #create <exit> method to return user if they choose no from <create_order>
    def exit 
        puts 'Thank you for your time.'
    end 

    
#     # As a user, I want to be able to confirm an order from a farmer. (Read)
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

    # As a user, I want to edit my shopping list size. (Update)
    def edit_order 
        edit = ""
            while edit == "" 
                puts 'Want to edit your order? Select Y for yes or N to exit.'
                edit = gets.chomp 
                if edit == "Y" 
                    edit_size  
            elsif edit == "N" 
                exit 
            else 
                puts 'That is not a valid input. Please select Y to edit or N to exit.'
                edit = gets.chomp 
            end 
        end 
    end 



#     # As a user, I want to be able to delete my basket. (Delete)
    def clear_basket
        clear = ""
        puts 'Want to clear your order? Select Y for yes and N for no'
        clear = gets.chomp 
        if clear == "Y" || clear == "Yes"
            # Order.delete(customer: @customer, farmer: @farmer, size: @order_size)
            Order.delete(@order.id)
            puts "Your basket has been deleted."
        else clear == "N" || clear == "No"
            exit 
        end 
    end 

    def select_size #Create 
        order_size = "" 
        puts 'Please select an order size from the following for your produce order: small, medium, large'
        order_size = gets.chomp
        if order_size == "small" || order_size == "medium" || order_size == "large" 

        else order_size != "small" || order_size != "medium" || order_size != "large" 
            puts "Please put in a valid option of 'small,' 'medium,' or 'large'"
            order_size = gets.chomp
        end
        @order = Order.create(customer: @customer, farmer: @farmer, size: order_size)
        puts "Thanks, you have selected #{order_size} for your order size and we have submitted your order. Your order number is #{@order.id} and we'll send details shortly."
        edit_delete_or_exit
    
    end 

    def edit_delete_or_exit
        response = "" 
        puts 'Enter edit (to edit your order size), delete (to delete your order), or exit (to exit).'
        response = gets.chomp.downcase 
        if response == "exit"
            exit 
        elsif response == "delete" 
            clear_basket
        elsif response == "edit" 
            edit_order
        else 
            puts "Please a valid option of 'edit, 'delete,' or 'exit.'"
            edit_delete_or_exit
        end 
    end 



  

end 