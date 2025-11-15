class CreateMobileAppProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :mobile_app_projects do |t|
      t.string :store_link
      t.string :os
      t.text :tech_used

      t.timestamps
    end
  end
end
