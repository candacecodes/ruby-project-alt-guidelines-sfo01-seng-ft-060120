require_relative '../config/environment'

#ruby bin/run.rb 
#call a method that starts everything 

new_CLI = CLI.new 
new_CLI.start_method 
new_CLI.choose_farmer 
new_CLI.select_size 


