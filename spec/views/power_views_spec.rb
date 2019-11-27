describe Power do
  it 'index view exists with complete data.' do
    visit '/powers'
    expect(page).to have_selector('li', count: 3)
  end

  it 'show view exists with complete data.' do
    visit '/powers/1'
    expect(page).to have_content('immortality')
  end
end
