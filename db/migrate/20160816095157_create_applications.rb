class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.boolean :accepted

      t.timestamps
    end
  end
end
