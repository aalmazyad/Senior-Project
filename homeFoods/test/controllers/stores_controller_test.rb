require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: { address: @store.address, city: @store.city, contactId: @store.contactId, contactMethod: @store.contactMethod, country: @store.country, description: @store.description, filename: @store.filename, foodType: @store.foodType, fromDay: @store.fromDay, fromHour: @store.fromHour, fromZone: @store.fromZone, name: @store.name, state: @store.state, tags: @store.tags, toDay: @store.toDay, toHour: @store.toHour, toZone: @store.toZone, user_id: @store.user_id, zipcode: @store.zipcode }
    end

    assert_redirected_to store_path(assigns(:store))
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store
    assert_response :success
  end

  test "should update store" do
    patch :update, id: @store, store: { address: @store.address, city: @store.city, contactId: @store.contactId, contactMethod: @store.contactMethod, country: @store.country, description: @store.description, filename: @store.filename, foodType: @store.foodType, fromDay: @store.fromDay, fromHour: @store.fromHour, fromZone: @store.fromZone, name: @store.name, state: @store.state, tags: @store.tags, toDay: @store.toDay, toHour: @store.toHour, toZone: @store.toZone, user_id: @store.user_id, zipcode: @store.zipcode }
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_redirected_to stores_path
  end
end
