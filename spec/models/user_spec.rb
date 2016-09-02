require 'rails_helper'

describe User do

  pending "add some examples to (or delete) #{__FILE__}"
    before(:each) do
      @post = User.new(:name => "Title",:password => "123456", :password_confirmation =>  "123456", :course => "rola", :birthday => Time.now.strftime("2015-11-21 15:45:30"), :university => "ufc", :email => "vica.escorcio@gmail.com", :semester => 5 )
    end
    
    it "should be not created without name" do
      @post.name = nil
      expect(@post).to be_valid
    end
    
    it "should be not created without course" do
      @post.course = nil
      expect(@post).to be_valid
    end

    it "should be not created without university" do
      @post.university = nil
      expect(@post).to be_valid
    end

    it "should be not created without semester" do
      @post.semester= nil
      expect(@post).to be_valid
    end

    it "should be not created without email" do
      @post.email = nil
      expect(@post).to be_valid
    end

    it "should be not created without birthday" do
      @post.birthday = nil
      expect(@post).to be_valid
    end
    

    it "should be not created without minimum 6 caracteres passaword " do
      @post.password = "1234"
      @post.password_confirmation = "1234"
      expect(@post).to be_valid
    end
  describe "set_package" do
    it "not have a package" do
      
    end
  end
end
