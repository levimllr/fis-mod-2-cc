require 'spec_helper'

describe 'Heroine controller' do
  describe 'validations' do
    it 'render new page on invalid heroine creation.' do
      visit '/heroines/new'
      fill_in('heroine_name', with: 'Diana Prince')
      fill_in('heroine_super_name', with: 'Wonder Woman')
      select('immortality', from: 'heroine_power_id')
      click_button('Create Heroine')
      expect(page).to have_field('heroine_name')
    end
  end
end
