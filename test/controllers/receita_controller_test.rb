require "test_helper"

class ReceitaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receitum = receita(:one)
  end

  test "should get index" do
    get receita_url
    assert_response :success
  end

  test "should get new" do
    get new_receitum_url
    assert_response :success
  end

  test "should create receitum" do
    assert_difference("Receitum.count") do
      post receita_url, params: { receitum: { categoria_id: @receitum.categoria_id, consumidor_id: @receitum.consumidor_id, data: @receitum.data, valor: @receitum.valor } }
    end

    assert_redirected_to receitum_url(Receitum.last)
  end

  test "should show receitum" do
    get receitum_url(@receitum)
    assert_response :success
  end

  test "should get edit" do
    get edit_receitum_url(@receitum)
    assert_response :success
  end

  test "should update receitum" do
    patch receitum_url(@receitum), params: { receitum: { categoria_id: @receitum.categoria_id, consumidor_id: @receitum.consumidor_id, data: @receitum.data, valor: @receitum.valor } }
    assert_redirected_to receitum_url(@receitum)
  end

  test "should destroy receitum" do
    assert_difference("Receitum.count", -1) do
      delete receitum_url(@receitum)
    end

    assert_redirected_to receita_url
  end
end
