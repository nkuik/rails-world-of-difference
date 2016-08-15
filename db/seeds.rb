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
