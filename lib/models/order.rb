class Order < ActiveRecord::Base
    belongs_to :farmer 
    belongs_to :customer 
end 