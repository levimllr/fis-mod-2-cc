require 'spec_helper'

describe Heroine do
  it 'index view exists with complete data.' do
    visit '/heroines'
    expect(page).to have_selector('li', count: 2)
  end

  it 'show view exists with complete data.' do
    visit '/heroines/2'
    expect(page).to have_content('Harley Quinn')
  end
end
