require 'spec_helper'

describe CompaniesController do
  let(:user) { create(:user) }
  describe "GET #new" do

    context "as guest" do
      before(:each) do
        get :new
      end
      it "requires login" do
        expect(response).to redirect_to login_path
      end
    end

    context "as logged in" do
      before(:each) do
        set_user_session user
        get :new
      end
      it "sets up a new company" do
        expect(assigns(:company)).to be_a_new(Company)
      end
      it "renders :new template" do
        expect(response).to render_template :new
      end
    end

  end

  describe "POST #create" do
    before(:each) do
      set_user_session user
    end

    context "with valid attributes" do
      it "adds the company" do
        expect {
          post :create, company: attributes_for(:company)
        }.to change(Company, :count).by(1)
      end
      it "associates current user to an agent profile and manager of the company" do
        post :create, company: attributes_for(:company)
        expect(current_user.profile).to_not be_nil
        expect(current_user.profile.company).to eq Company.last
      end
      it "redirects to pages#index" do
        attributes = attributes_for(:company)
        post :create, company: attributes
        expect(response).to redirect_to dashboard_index_url(subdomain: attributes[:subdomain])
      end
    end

    context "with invalid attributes" do
      it "re-renders the new template" do
        post :create, company: attributes_for(:company, subdomain: nil)
        expect(response).to render_template :new
      end
    end
  end

end