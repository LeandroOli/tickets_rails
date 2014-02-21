module Admin
  require 'spec_helper'
  describe Admin::PagesController do

    describe "guest access" do
      it "GET#index redirects to the login form" do
        get :index
        expect(response).to redirect_to login_url
      end
    end  
    describe "admin access" do
      let(:admin_user) { create(:admin_user) }
      before :each do
        session[:user_id] = admin_user.id
      end
      it "GET #index renders the :index view" do
        get :index
        expect(response).to render_template :index
      end
    end

  end
end