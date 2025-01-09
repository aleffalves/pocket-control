require "application_system_test_case"

class ReceitaTest < ApplicationSystemTestCase
  setup do
    @receitum = receita(:one)
  end

  test "visiting the index" do
    visit receita_url
    assert_selector "h1", text: "Receita"
  end

  test "should create receitum" do
    visit receita_url
    click_on "New receitum"

    fill_in "Categoria", with: @receitum.categoria_id
    fill_in "Consumidor", with: @receitum.consumidor_id
    fill_in "Data", with: @receitum.data
    fill_in "Valor", with: @receitum.valor
    click_on "Create Receitum"

    assert_text "Receitum was successfully created"
    click_on "Back"
  end

  test "should update Receitum" do
    visit receitum_url(@receitum)
    click_on "Edit this receitum", match: :first

    fill_in "Categoria", with: @receitum.categoria_id
    fill_in "Consumidor", with: @receitum.consumidor_id
    fill_in "Data", with: @receitum.data
    fill_in "Valor", with: @receitum.valor
    click_on "Update Receitum"

    assert_text "Receitum was successfully updated"
    click_on "Back"
  end

  test "should destroy Receitum" do
    visit receitum_url(@receitum)
    click_on "Destroy this receitum", match: :first

    assert_text "Receitum was successfully destroyed"
  end
end
