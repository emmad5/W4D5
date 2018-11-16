require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users sign up page' do
      get :new
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end
  
  describe "POST #create" do
    context 'with invalid params' do
    it 'validates the presence of email and password' do
      post :create, params: { user: {email: 'email', password: ''}}
      expect(response).to render_template('new')
      expect(flash[:errors]).to be_present
    end
  end

    context 'with valid params' do
      it 'redirects to the link show page' do
        post :create, params: { user: {email: 'new_email', password: '123456'}}
        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end
end
  