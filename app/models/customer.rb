require 'csv'

class Customer < ApplicationRecord
	validates :email, uniqueness: true

	def self.import(file)
		@errors = []
	  CSV.foreach(file.path, headers: true) do |row|
	  	email = row.to_hash["email"]
	  	customer = Customer.new row.to_hash
	  	unless customer.save
	  		customer.errors.full_messages.each do |message|
	        @errors << "#{email}: #{message}"
	      end
	  	end
	  end
	  @errors
	end
end
