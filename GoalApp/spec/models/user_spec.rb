# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do


  describe "validate stuff" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password_digest }
    it { should validate_presence_of :session_token }

      it { should validate_length_of(:password).is_at_least(6) }

    describe "uniqueness" do
      before(:each) do
        create(:user)
      end

      it { should validate_uniqueness_of(:session_token) }
      it { should validate_uniqueness_of(:username) }
    end

  end
  describe "find by credentials" do
    let!(:user) {create(:user)}

    context "there is a matching user" do

      it "should  return the user" do
        expect(User.find_by_credentials(user.username, "starwars")).to eq(user)
      end

    end

    context "there is not a matching user" do

      it "should return nil" do
        expect(User.find_by_credentials(user.username, "starteck")).not_to eq(user)
      end
    
    end
  
    it {should have_many(:goals)}
  end



  # describe "is_password?"

  # end
  # describe "generate_session_token"

  # end
  # describe "sets password digest (password=)"

  # end
  # describe "ensure_session_token"

  # end
  # describe "reset_session_token"

  # end

  # describe "has many goals"

  # end
  

end
