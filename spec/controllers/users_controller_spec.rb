require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    before(:each) do
      get :new
    end
    it "sets up a new user" do
      expect(assigns(:user)).to be_a_new(User)
    end
    it "renders :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "adds the user" do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it "redirects to companies#new" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to new_company_path #needs register a company after user signup
      end
    end
  end

end