require 'spec_helper'

describe Heroine do
  # STRETCH GOAL FOR MODEL SCORE OF 5
  # describe 'model' do
  #   it 'accepts nested attributes for Power' do
  #     should accept_nested_attributes_for(:power)
  #   end
  # end

  describe 'association' do
    it 'uses a superpower_id foreign key.' do
      expect(@wonderwoman.power_id).to eq(1)
    end

    it 'is composed of a belongs_to relationship.' do
      expect(@wonderwoman.power).to eq(@immortality)
    end
  end

  describe 'validations' do
    describe 'of attributes' do
      context 'when creating a heroine' do
        it 'reject the heroine if :name is blank.' do
          expect {
            Heroine.create!(
              name: nil,
              super_name: 'Wonder Woman',
              power_id: 1
            )
          }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'reject the heroine if :super_name is blank.' do
          expect {
            Heroine.create!(
              name: 'Diana Prince',
              super_name: nil,
              power_id: 1
            )
          }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'reject a new heroine with a non-unique name.' do
          expect {
            Heroine.create!(
              name: 'Diana Prince',
              super_name: 'Wonder Gal',
              power_id: 1
            )
          }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'reject a new heroine with a non-unique super_name.' do
          expect {
            Heroine.create!(
              name: 'Diana Queen',
              super_name: 'Wonder Woman',
              power_id: 1
            )
          }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
