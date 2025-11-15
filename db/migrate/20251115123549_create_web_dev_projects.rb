class CreateWebDevProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :web_dev_projects do |t|
      t.string :github_url
      t.string :live_url
      t.text :tech_stack

      t.timestamps
    end
  end
end
