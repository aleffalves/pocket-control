require "application_system_test_case"

class ConsumidorsTest < ApplicationSystemTestCase
  setup do
    @consumidor = consumidors(:one)
  end

  test "visiting the index" do
    visit consumidors_url
    assert_selector "h1", text: "Consumidors"
  end

  test "should create consumidor" do
    visit consumidors_url
    click_on "New consumidor"

    fill_in "Nome", with: @consumidor.nome
    fill_in "Usuario", with: @consumidor.usuario_id
    click_on "Create Consumidor"

    assert_text "Consumidor was successfully created"
    click_on "Back"
  end

  test "should update Consumidor" do
    visit consumidor_url(@consumidor)
    click_on "Edit this consumidor", match: :first

    fill_in "Nome", with: @consumidor.nome
    fill_in "Usuario", with: @consumidor.usuario_id
    click_on "Update Consumidor"

    assert_text "Consumidor was successfully updated"
    click_on "Back"
  end

  test "should destroy Consumidor" do
    visit consumidor_url(@consumidor)
    click_on "Destroy this consumidor", match: :first

    assert_text "Consumidor was successfully destroyed"
  end
end
