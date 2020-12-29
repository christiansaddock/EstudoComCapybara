describe 'Alertas de JS', :alerts do
  before(:each) do
    visit '/javascript_alerts'
  end

  it 'alerta' do
    click_button 'Alerta'

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Isto é uma mensagem de alerta'

    page.driver.browser.switch_to.alert.accept
  end

  it 'sim confirma' do
    click_button 'Confirma'

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Mensagem confirmada'
  end

  it 'não confirma' do
    click_button 'Confirma'

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content 'Mensagem não confirmada'
  end

  it 'accept prompt', :accept_prompt do
    accept_prompt(with: 'Fernando') do
      click_button 'Prompt'
    end

    expect(page).to have_content 'Olá, Fernando'
  end

  # desafio

  it 'dismiss prompt', :dismiss_prompt do
    # Quando eu nao aceito este prompt
    # Entao a mensage deve ser Ola, null
  end
end
