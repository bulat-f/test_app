require 'spec_helper'

describe Post do
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.create(title: "Hello", body: "Hello World!!!")}
  subject { @post }
  
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:user) }
  it { should respond_to(:comments) }
  it { should respond_to(:tags) }
  it { should respond_to(:str_tags) }
  it { should respond_to(:str_tags=) }

  it { should be_valid }

  describe "tagging" do
    let!(:second_tag) { Tag.create(label: "second_tag") }
    let(:tags) { "first_tag; seCond_tag; last_tag" }
    before { @post.str_tags= tags }
    describe "with existing tag" do
      its(:tags) { should include(second_tag) }
    end

    describe "not existing tag" do
      let(:first_tag){ Tag.find_by(label: "first_tag") }
      its(:tags) { should include(first_tag) }
    end
  end

end
