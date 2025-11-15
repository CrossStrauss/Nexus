class CreateUnrealProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :unreal_projects do |t|
      t.string :engine_version
      t.string :download_url
      t.string :platform

      t.timestamps
    end
  end
end
