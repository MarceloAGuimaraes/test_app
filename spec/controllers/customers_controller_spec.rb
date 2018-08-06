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

  context ' as logged member ' do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end
    it 'certificate that server responses are in json' do
      customer_params = attributes_for(:customer)
      
      sign_in @member

      post :create, params:{ customer: customer_params},
      format: :json
      
      expect(response.content_type).to eq("application/json")
      
    end


      it 'spec for flash_notices' do
        customer_params = attributes_for(:customer)
        sign_in @member 
          
        post :create, params: { customer: customer_params }
          
        expect(flash[:notice]).to match(/Customer was successfully created./)
      end

      it 'create with valid attributes ' do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect{
         post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
      end

      it '200 status response' do
      sign_in @member
      get :show, params: { id: @customer.id}
      expect(response).to have_http_status(200)
      end
     
      it 'route spec' do
        should { route(:get, '/customers').to(action: :index)}
      end
        
      


    end
end

