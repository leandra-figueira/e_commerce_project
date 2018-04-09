class RemoveDetailsFromOrderItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_items, :gst, :decimal
    remove_column :order_items, :pst, :decimal
    remove_column :order_items, :hst, :decimal
    remove_column :order_items, :total, :decimal
  end
end
