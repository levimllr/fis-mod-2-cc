require 'rails_helper'

describe 'Routes for' do
  describe 'Power' do
    it 'have an index page.' do
      visit "/powers"
      expect(page.status_code).to eq(200)
    end

    it 'have a show page.' do
      visit "/powers/1"
      expect(page.status_code).to eq(200)
    end

    # No test for powers#new as most students' routes will conflate with powers#show

    it 'have no unnecessary heroine#create action.' do
      {post: '/powers'}.should_not be_routable
    end

    it 'have no unnecessary edit route.' do
      {get: '/powers/1/edit'}.should_not be_routable
    end

    it 'have no unnecessary heroine#update action.' do
      {patch: '/powers/1'}.should_not be_routable
    end

    it 'have no unnecessary heroine#destroy action.' do
      {delete: '/powers/1'}.should_not be_routable
    end
  end
end
