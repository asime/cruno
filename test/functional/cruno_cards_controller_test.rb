require 'test_helper'

class CrunoCardsControllerTest < ActionController::TestCase
  setup do
    @cruno_card = cruno_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cruno_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cruno_card" do
    assert_difference('CrunoCard.count') do
      post :create, cruno_card: @cruno_card.attributes
    end

    assert_redirected_to cruno_card_path(assigns(:cruno_card))
  end

  test "should show cruno_card" do
    get :show, id: @cruno_card.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cruno_card.to_param
    assert_response :success
  end

  test "should update cruno_card" do
    put :update, id: @cruno_card.to_param, cruno_card: @cruno_card.attributes
    assert_redirected_to cruno_card_path(assigns(:cruno_card))
  end

  test "should destroy cruno_card" do
    assert_difference('CrunoCard.count', -1) do
      delete :destroy, id: @cruno_card.to_param
    end

    assert_redirected_to cruno_cards_path
  end
end
