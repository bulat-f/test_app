require 'spec_helper'

describe "Posts" do

  subject { page }

  let(:first_user) { FactoryGirl.create(:user) }
  let(:second_user) { FactoryGirl.crate(:user) }

  let(:post) { FactoryGirl.create(:post, user: first_user) }

  describe "not sign in user" do
    before do
      visit posts_path
    end
    it { should_not have_link("Create new post", href: new_post_path) }
  end
end
