class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_projects, class_name: Project, foreign_key: :author_id
  has_many :skill_users, inverse_of: :user, dependent: :destroy
  has_many :applications, dependent: :destroy
  accepts_nested_attributes_for :skill_users
  has_many :skills, through: :skill_users
  has_many :projects, through: :applications
end

  # has_many :applications, dependent: :destroy <-- not sure if we need dependent destroy?



