class AddDefaultValueToStatusCustomer < ActiveRecord::Migration[5.0]
  def up
	  change_column :customers, :status, :string, :default => true
	end

	def down
	  change_column :customers, :status, :string, :default => nil
	end
end
