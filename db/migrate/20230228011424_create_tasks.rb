class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :completed, null: false, default: false
      t.references :list, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
