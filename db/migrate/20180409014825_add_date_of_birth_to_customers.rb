class AddDateOfBirthToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :date_of_birth, :datetime
  end
end
