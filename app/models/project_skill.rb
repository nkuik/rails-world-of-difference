class ProjectSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :project
  # validates_presence_of :level
end
