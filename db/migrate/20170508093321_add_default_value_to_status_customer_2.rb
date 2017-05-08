class AddDefaultValueToStatusCustomer2 < ActiveRecord::Migration[5.0]
  def up
	  change_column :customers, :status, :string, :default => "0"
	end

	def down
	  change_column :customers, :status, :string, :default => true
	end
end
