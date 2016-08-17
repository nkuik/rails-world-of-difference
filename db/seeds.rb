# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skill.destroy_all

skills_attributes = [
  {
    name:         "Project Development",
  },
  {
    name:         "Coaching and Facilitation",
  },
  {
    name:         "Strategy Development",
  },
  {
    name:         "Campaigning",
  },
  {
    name:         "Curriculum Development",
  },
  {
    name:         "Writing and Editing",
  },
  {
    name:         "Policy Development",
  },
  {
    name:         "Fundraising",
  },
  {
    name:         "Translation",
  },
  {
    name:         "Graphic Design",
  },
  {
    name:         "Web Design and Development",
  },
  {
    name:         "IT",
  },
]

skills_attributes.each { |params| Skill.create!(params) }

User.destroy_all
Project.destroy_all
Application.destroy_all

70.times do
  user_email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create(email: user_email, password: 'topsecret', password_confirmation: 'topsecret')
  user
  2.times do
    name = Faker::Commerce.department(5)
    description = Faker::Lorem.paragraphs(1)
    complete = [true, false].sample
    project = Project.create(author_id: user.id, name: name, description: description, complete: complete)
    project
    2.times do
      content = Faker::Hipster.paragraph
      accepted = [true, false].sample
      Application.create(user_id: user.id, project_id: project.id, content: content, accepted: accepted)
    end
  end
end









