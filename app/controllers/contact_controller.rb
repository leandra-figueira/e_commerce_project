class ContactController < ApplicationController
  def contact
    @contact = Contact.first
  end
end
