require 'rails_helper'
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe PostsController, type: :controller do
  def user_login
    user=FactoryGirl.create(:user)
    @u=User.where(email: 'test01@testing.com').first
    if(@u.blank?)
      @u=User.create(email: 'test01@testing.com', password: 'new1life', password_confirmation: 'new1life')
    end
    @u.save
    sign_in @u
  end

  describe "GET #index" do
    it "returns a success response" do
      user_login
      get :index
      expect(response).to render_template :index
      # sign_out @user
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user_login
      post = Post.create(title: "Test1", url: "url1", user_id: @u.id)
      get :show,  params: {:id=>post.id}
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      user_login
      get :new, params: {}
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      user_login
      post = Post.create(title: "Test1", url: "url1", user_id: @u.id)
      get :edit, params: {id: post.to_param}
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        user_login
        expect {
          post :create, params: {post: {title: "Test2", url: "url2", user_id: @u.id}}
        }.to change(Post, :count).by(1)
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested post" do
        user_login
        post = Post.create(title: "Test1", url: "url1", user_id: @u.id)
        put :update, params: {id: post.to_param, post: {title: "Test2", url: "url2"}}
        post.reload
        expect(post.title).to eq "Test2"
        expect(post.url).to eq "url2"
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      user_login
      post = Post.create(title: "Test1", url: "url1", user_id: @u.id)
      expect {
        delete :destroy, params: {id: post.to_param}
      }.to change(Post, :count).by(-1)
    end
  end
end
