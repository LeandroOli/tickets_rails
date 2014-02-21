class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|

      t.timestamps
    end
  end
end
