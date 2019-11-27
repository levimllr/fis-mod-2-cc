class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, presence: true, uniqueness: true
  validates :super_name, presence: true, uniqueness: true

  def self.search(param)
    if !param.nil?
      @heroines = Heroine.all.select{ |heroine| heroine.power.name.include?(param) }
    else
      @heroines = Heroine.all
    end
  end

  accepts_nested_attributes_for :power
end
