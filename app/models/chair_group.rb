class ChairGroup < ActiveRecord::Base
  has_many :chair_assignments, dependent: :destroy
  has_many :chairs, -> { order("position ASC") }, through: :chair_assignments

  accepts_nested_attributes_for :chair_assignments, :allow_destroy=>true
end
