ActiveAdmin.register Product do
  permit_params :name, :description, :stock_quantity, :price, :category_id, :image, image_attributes: [:_destroy]

  # have a look on Kyle's video, it is done in a different way
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
    # this was added in class - display errors if there is any
    f.semantic_errors #*f.object.errors.keys

    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :stock_quantity
      f.input :price
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.collect {|category| [category.name, category.id]}
      f.input :image, as: :file
      if f.object.image.present?
        f.semantic_fields_for :image_attributes do |image_fields|
          image_fields.input :_destroy, as: :boolean, label: 'Delete saved image?'
        end
      end
    end
    f.actions
  end
end
