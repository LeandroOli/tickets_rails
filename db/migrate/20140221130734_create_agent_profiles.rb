class CreateAgentProfiles < ActiveRecord::Migration
  def change
    create_table :agent_profiles do |t|
      t.integer :company_id
      t.boolean :company_manager

      t.timestamps
    end
  end
end
