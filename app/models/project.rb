class Project < ApplicationRecord
  has_many :project_skills
  has_many :applications
  has_many :users, through: :applications
  has_many :skills, through: :project_skills
  belongs_to :author, class_name: User
end
