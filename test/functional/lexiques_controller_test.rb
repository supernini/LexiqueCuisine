require 'test_helper'

class LexiquesControllerTest < ActionController::TestCase
  setup do
    @lexique = lexiques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lexiques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lexique" do
    assert_difference('Lexique.count') do
      post :create, lexique: { description: @lexique.description, keywords: @lexique.keywords, meta_description: @lexique.meta_description, name: @lexique.name, publish_at: @lexique.publish_at, short_description: @lexique.short_description, title: @lexique.title }
    end

    assert_redirected_to lexique_path(assigns(:lexique))
  end

  test "should show lexique" do
    get :show, id: @lexique
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lexique
    assert_response :success
  end

  test "should update lexique" do
    put :update, id: @lexique, lexique: { description: @lexique.description, keywords: @lexique.keywords, meta_description: @lexique.meta_description, name: @lexique.name, publish_at: @lexique.publish_at, short_description: @lexique.short_description, title: @lexique.title }
    assert_redirected_to lexique_path(assigns(:lexique))
  end

  test "should destroy lexique" do
    assert_difference('Lexique.count', -1) do
      delete :destroy, id: @lexique
    end

    assert_redirected_to lexiques_path
  end
end
