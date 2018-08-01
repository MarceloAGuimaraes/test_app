require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  context 'as a guest' do
      it 'respond successfully' do
        get :index 
        expect(response).to be_success
      end
   
      it '200 expect to response' do
        customer = create(:customer)
      
        get :index 
        expect(response).to have_http_status(200)
      end
  end

  context 'as a user' do
      it 'it responds a 302 response (not authorized)' do
        customer = create(:customer)
        get :show, params: { id: customer }
        expect(response).to have_http_status(302)
      end

      it 'it responds a 200 response ( authorized)' do
        member = create(:member)
      
        customer = create(:customer)
        sign_in member
        get :show, params: { id: customer.id}
        expect(response).to render_template(:show)
      end
  end

end

