class CreateProvinces < ActiveRecord::Migration[5.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :code
      t.decimal :hst
      t.decimal :gst
      t.decimal :pst

      t.timestamps
    end
  end
end
