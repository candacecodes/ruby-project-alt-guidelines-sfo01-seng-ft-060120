class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :farmer_id 
      t.string :size 
    end
  end
end

# if you want 
#   order == primary key => do not need to put in t.whatever :order_name 
# if you want to create a unique name for each order 
#   then put in the create_table 
#   t. integer/string :order_order => allows us to randomize the order int/name, instead of being sequential 
