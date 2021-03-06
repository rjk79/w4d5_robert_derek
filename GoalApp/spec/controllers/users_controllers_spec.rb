
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # describe "get#index" do
  #   it "render the user index" do
      
  #   end
  # end
  describe "get#new" do
    it "renders the new template" do
      get(:new)
      expect(response).to render_template(:new)
    end
  end
  describe "post#create" do
  
    context "with valid params" do
      let(:valid_params) { { user: { username: "robbie", password: "starwars" } } }
      it "creates user with valid params" do
        post(:create, params: valid_params)
        expect(User.last.username).to eq("robbie")
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { user: { srnm: "derek", psswrd: "startrek" } } }

      before(:each) do
        post(:create, params: invalid_params)
      end

      it "error when invalid params are used" do
        expect(flash[:errors]).to be_present
      end

      it "redirects back to new_user_url" do
        expect(response).to redirect_to(new_user_url)
      end
    end

  end
  # describe "get#edit" do
  #   it "" do
  #   end
  # end
  # describe "get#show" do
  #   it "" do
  #   end
  # end
  # describe "patch#update" do
  #   it "" do
  #   end
  # end
  
  # describe "delete#destroy" do
  #   it "" do
  #   end
  # end
end

