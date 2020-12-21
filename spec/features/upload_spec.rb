require 'rails_helper'

RSpec.describe "Upload", type: :feature do
  it 'separates a combo pdf' do
    visit root_path
    expect(page).to have_content('Fast. Secure. Free.')
    attach_file('upload[pdf_file]', File.join(Rails.root, '/spec/letter_legal_mix.pdf'))
    click_button 'Separate my PDF'
  end
end
