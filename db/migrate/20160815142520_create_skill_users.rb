class CreateSkillUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_users do |t|
      t.integer :level
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
