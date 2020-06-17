class CreateFarmers < ActiveRecord::Migration[5.2]
    def change 
      create_table :farmers do |t|
        t.string :name
        t.string :location
      end
    end
end

# if we have another model class for produce 
#   column: name, type, etc. 
#   we get access to produce through farmers 
#   join class between farmer and produce: bc the farmer is the one growing the produce
#   farmer has many produce, and the case instant of produce has one farmer 