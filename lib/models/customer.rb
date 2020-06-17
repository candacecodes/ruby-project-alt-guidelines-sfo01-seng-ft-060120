class Customer < ActiveRecord::Base
    has_many :orders 
    has_many :farmers, through: :orders 
    #has_many :crops, through: :farmers 
end 

