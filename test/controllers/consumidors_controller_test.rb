require "test_helper"

class ConsumidorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumidor = consumidors(:one)
  end

  test "should get index" do
    get consumidors_url
    assert_response :success
  end

  test "should get new" do
    get new_consumidor_url
    assert_response :success
  end

  test "should create consumidor" do
    assert_difference("Consumidor.count") do
      post consumidors_url, params: { consumidor: { nome: @consumidor.nome, usuario_id: @consumidor.usuario_id } }
    end

    assert_redirected_to consumidor_url(Consumidor.last)
  end

  test "should show consumidor" do
    get consumidor_url(@consumidor)
    assert_response :success
  end

  test "should get edit" do
    get edit_consumidor_url(@consumidor)
    assert_response :success
  end

  test "should update consumidor" do
    patch consumidor_url(@consumidor), params: { consumidor: { nome: @consumidor.nome, usuario_id: @consumidor.usuario_id } }
    assert_redirected_to consumidor_url(@consumidor)
  end

  test "should destroy consumidor" do
    assert_difference("Consumidor.count", -1) do
      delete consumidor_url(@consumidor)
    end

    assert_redirected_to consumidors_url
  end
end
