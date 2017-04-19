require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to enlightenment or numbers in the form of words', {:type => :feature}) do
  it('processes the user input number and returns the number in english words') do
    visit('/')
    fill_in('input_number', :with => '456')
    click_button('submit_button')
    expect(page).to have_content('four hundred fifty six')
  end
end
