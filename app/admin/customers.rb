ActiveAdmin.register Customer do
  permit_params :first_name, :last_name, :email, :street, :number, :zipcode, :city, :suit_number, :province_id
end

