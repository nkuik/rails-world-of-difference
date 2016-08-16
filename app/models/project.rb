class Project < ApplicationRecord
  has_many :project_skills, inverse_of: :project, dependent: :destroy
  has_many :applications
  has_many :users, through: :applications
  has_many :skills, through: :project_skills
  belongs_to :author, class_name: User
  accepts_nested_attributes_for :project_skills
end
