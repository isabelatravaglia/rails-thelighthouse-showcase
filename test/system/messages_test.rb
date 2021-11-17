require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase

  test "anyone can send a contact message" do
    visit root_path
    click_link "Contato"
    sleep 1.5
    fill_in "message_name", with: "Testing contact form"
    fill_in "message_email", with: "testing-contact-form@hotmail.com"
    fill_in "message_body", with: "Testing contact form"
    check "message_privacy_policy"
    click_button "Enviar"
    assert_text "Recebemos sua mensagem! Entraremos em contato brevemente!"
    # save_and_open_screenshot
  end
  ############################ Lideranca Inspiradora #############################
  # test "anyone can send an interest message regarding the course Lideranca Inspiradora at Services Page" do
  #   visit services_path
  #   find('a[data-target="#liderancaContactUsModal"]').click
  #   sleep 1.5
  #   fill_in "message_name", with: "Testing interest message - Lideranca Inspiradora"
  #   fill_in "message_email", with: "testing-lideranca-inspiradora@hotmail.com"
  #   fill_in "message_body", with: "Testing interest message - Lideranca Inspiradora"
  #   check "message_privacy_policy"
  #   click_button "Enviar"
  #   assert_text "Recebemos sua mensagem! Entraremos em contato brevemente!"
  # end

  # test "anyone can send an interest message regarding the course Lideranca Inspiradora at Leaders Page" do
  #   visit leaders_path
  #   find('a[data-target="#liderancaContactUsModal"]').click
  #   sleep 1.5
  #   fill_in "message_name", with: "Testing interest message - Lideranca Inspiradora"
  #   fill_in "message_email", with: "testing-lideranca-inspiradora@hotmail.com"
  #   fill_in "message_body", with: "Testing interest message - Lideranca Inspiradora"
  #   check "message_privacy_policy"
  #   click_button "Enviar"
  #   assert_text "Recebemos sua mensagem! Entraremos em contato brevemente!"
  # end

  # test "anyone can send an interest message regarding the course Lideranca Inspiradora at Companies Page" do
  #   visit companies_path
  #   find('a[data-target="#liderancaContactUsModal"]').click
  #   sleep 1.5
  #   fill_in "message_name", with: "Testing interest message - Lideranca Inspiradora"
  #   fill_in "message_email", with: "testing-lideranca-inspiradora@hotmail.com"
  #   fill_in "message_body", with: "Testing interest message - Lideranca Inspiradora"
  #   check "message_privacy_policy"
  #   click_button "Enviar"
  #   assert_text "Recebemos sua mensagem! Entraremos em contato brevemente!"
  # end

############################ Academia de Liderança #############################
test "anyone can click on the 'Inscreva-se já' button and be redirected to the product page at Services Page" do
  visit services_path
  click_link "Inscreva-se já!"
  page.driver.browser.switch_to.window (page.driver.browser.window_handles.last)
  assert_current_path('https://pay.hotmart.com/Y62278856R?checkoutMode=10&bid=1637021147415')
end

test "anyone can click on the 'Inscreva-se já' button and be redirected to the product page at Leaders Page" do
  visit leaders_path
  click_link "Inscreva-se já!"
  page.driver.browser.switch_to.window (page.driver.browser.window_handles.last)
  assert_current_path('https://pay.hotmart.com/Y62278856R?checkoutMode=10&bid=1637021147415')
end

test "anyone can click on the 'Inscreva-se já' button and be redirected to the product page at Companies Page" do
  visit companies_path
  click_link "Inscreva-se já!"
  page.driver.browser.switch_to.window (page.driver.browser.window_handles.last)
  assert_current_path('https://pay.hotmart.com/Y62278856R?checkoutMode=10&bid=1637021147415')
end
############################ Proposito #######################################
  test "anyone can send an interest message regarding the course Proposito at Services Page" do
    visit services_path
    find('a[data-target="#workshopContactUsModal"]').click
    sleep 1.5
    fill_in "message_name", with: "Testing interest message - Proposito"
    fill_in "message_email", with: "testing-proposito@hotmail.com"
    fill_in "message_body", with: "Testing interest message - Proposito"
    check "message_privacy_policy"
    click_button "Enviar"
    assert_text "Recebemos sua mensagem! Entraremos em contato brevemente!"
    # save_and_open_screenshot
  end

  test "anyone can send an interest message regarding the course Proposito at Leaders Page" do
    visit leaders_path
    find('a[data-target="#workshopContactUsModal"]').click
    sleep 1.5
    fill_in "message_name", with: "Testing interest message - Proposito"
    fill_in "message_email", with: "testing-proposito@hotmail.com"
    fill_in "message_body", with: "Testing interest message - Proposito"
    check "message_privacy_policy"
    click_button "Enviar"
    assert_text "Recebemos sua mensagem! Entraremos em contato brevemente!"
    # save_and_open_screenshot
  end
end
