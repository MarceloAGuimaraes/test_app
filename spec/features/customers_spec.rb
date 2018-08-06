require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'visit index page' do
     visit(new_member_password_path)

     expect(page).to have_current_path(new_member_password_path)

  end

end
