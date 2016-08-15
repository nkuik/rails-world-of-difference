class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_projects, class_name: Project, foreign_key: :author_id
  has_many :skill_users
  # accepts_nested_attributes_for :skill_users
end
