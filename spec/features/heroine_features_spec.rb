require 'spec_helper'

describe Heroine do
  describe 'form' do
    it 'uses a dropdown with existing powers.' do
      visit '/heroines/new'
      expect(page).to have_select('heroine_power_id')
    end

    it 'creates a new instance of Heroine and an association with a Power.' do
      visit '/heroines/new'
      fill_in('heroine_name', with: 'Jennifer Waters')
      fill_in('heroine_super_name', with: 'She-Hulk')
      select('super strength', from: 'heroine_power_id')
      click_button('Create Heroine')
      expect(page).to have_http_status(200)
    end
  end
end
