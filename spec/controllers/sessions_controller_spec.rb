require 'spec_helper'

describe SessionsController do
  let(:admin_user) { create(:admin_user) } 
  describe "POST #create" do
    context "invalid login" do
      before(:each) do
        post :create, { email: "invalid@invalid.com", password: "invalid" }
      end
      it "re-render login page with invalid login" do
        expect(response).to render_template :new
      end
      it "don't have user_id in session" do
        expect(session[:user_id]).to be_nil
      end
    end

    context "admin" do
      context "successfully login" do
        before(:each) do
          post :create, { email: admin_user.email, password: admin_user.password }
        end
        it "successfully login a admin user" do          
          expect(response).to redirect_to admin_root_path
        end
        it "have a user id in the session" do
          expect(session[:user_id]).to eq admin_user.id
        end
      end 
    end

  end

  describe "DELETE #destroy" do
    before(:each) do
      post :create, { email: admin_user.email, password: admin_user.password }
      delete :destroy
    end
    it "clear the session" do
      expect(session[:user_id]).to be_nil
    end
    it "redirects to index page" do
      expect(response).to redirect_to root_path
    end
  end
end