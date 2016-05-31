class ChairAssignment < ActiveRecord::Base
  belongs_to :chair_group
  belongs_to :chair
end
