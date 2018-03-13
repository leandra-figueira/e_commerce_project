ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :description, :stock_quantity, :price, :category_id, :image

  index do
    column :name
    column :description
    column :stock_quantity
    column :price
    column "Category" do |c|
      cat = Category.find(c.category_id)
      link_to cat.name, admin_category_path(c.category_id)
    end
    column :image
    actions
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :stock_quantity
      f.input :price
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.collect {|category| [category.name, category.id]}
      f.input :image, as: :file
    end
    f.actions
  end
end
