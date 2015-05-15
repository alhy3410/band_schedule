require('./app')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe("add a band to the list", {:type => :feature}) do
  it('will navigate through the site to add a band name') do
    visit('/')
    click_on('Bands')
    fill_in('band_name', :with => "ACDC")
    click_button('Add Band')
    expect(page).to have_content("Acdc")
  end
end
