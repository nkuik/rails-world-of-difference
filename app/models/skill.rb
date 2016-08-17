class Skill < ApplicationRecord
  has_many :project_skills, inverse_of: :project, dependent: :destroy
end
