class CreateProjectSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :project_skills do |t|
      t.references :skill, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
