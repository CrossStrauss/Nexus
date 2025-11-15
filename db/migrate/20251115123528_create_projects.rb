class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :thumbnail
      t.references :projectable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
