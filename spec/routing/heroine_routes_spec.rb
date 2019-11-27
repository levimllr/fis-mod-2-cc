require 'rails_helper'

describe 'Routes for' do
  describe 'Heroine' do
    it 'have an index page.' do
      visit "/heroines"
      expect(page.status_code).to eq(200)
    end

    it 'have a show page.' do
      visit "/heroines/1"
      expect(page.status_code).to eq(200)
    end

    it 'have a new page.' do
      visit "/heroines/new"
      expect(page.status_code).to eq(200)
    end

    it 'have a heroine#create controller action.' do
      visit 'heroines/new'
      fill_in('heroine_name', :with => "Jennifer Walters")
      fill_in('heroine_super_name', :with => "She-Hulk")
      click_button('Create Heroine')
      expect(page.status_code).to eq(200)
    end

    it 'have no unnecessary edit route.' do
      {get: '/heroines/1/edit'}.should_not be_routable
    end

    it 'have no unnecessary heroine#update action.' do
      {patch: '/heroines/1'}.should_not be_routable
    end

    it 'have no unnecessary heroine#destroy action.' do
      {delete: '/heroines/1'}.should_not be_routable
    end
  end
end
